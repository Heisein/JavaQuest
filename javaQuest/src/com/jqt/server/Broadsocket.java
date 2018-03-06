package com.jqt.server;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static ArrayList<String> nickNames = new ArrayList<String>();
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("serverMessage : " + message);
		//유저 입장시
		if(message.substring(0, 5).equals("흘흘흘흘흘")){
			for(int i = 0; i < nickNames.size(); i++){
				if(i == 0){
					message = "흘흘흘흘흘|" + nickNames.get(i);
				}else {
					message += ", " + nickNames.get(i);
				}
			}
			synchronized (clients) {
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}
			//삭제
		}else if(message.substring(0, 5).equals("닉네임삭제")){
			for(int i = 0; i < nickNames.size(); i++){
				if(nickNames.get(i).equals(message.substring(6, message.length()))){
					nickNames.remove(i);
				}
			}
		}else if(message.substring(0, 7).equals("buttonO") || message.substring(0, 7).equals("buttonX")) {
		
			synchronized (clients) {
				// 수신한 메시지를 방송하고
				// 연결된 세션 간에 반복
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}
			
			/*}else if(message.substring(0, 7).equals("buttonO")){
			for(int i = 0; i < nickNames.size(); i++){
				if(i == 0){
					message = "buttonO|" + nickNames.get(i);
				}else {
					message += ", " + nickNames.get(i);
				}
			}
			synchronized (clients) {
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}
			
		}else if(message.substring(0, 7).equals("buttonX")){
			for(int i = 0; i < nickNames.size(); i++){
				if(i == 0){
					message = "buttonX|" + nickNames.get(i);
				}else {
					message += ", " + nickNames.get(i);
				}
			}
			synchronized (clients) {
				for (Session client : clients) {
					client.getBasicRemote().sendText(message);
				}
			}*/
			
		}else {
			synchronized (clients) {
				// 수신한 메시지를 방송하고
				// 연결된 세션 간에 반복
				for (Session client : clients) {
					if (!client.equals(session)) {
						client.getBasicRemote().sendText(message);
					}
				}
			}
		}
		
	}

	@OnOpen
	public void onOpen(Session session) {
		// 연결된 세션 세트에 세션 추가
		clients.add(session);
		System.out.println("getQueryString : " + session.getQueryString());
		nickNames.add(session.getQueryString());
		System.out.println("접속 성공 : " + nickNames.size());
	}

	
	@OnClose
	public void onClose(Session session) {
		// 연결된 세션 세트에서 세션 제거
		clients.remove(session);
		
		System.out.println("닫힘");
		System.out.println("접속 종료 : " + nickNames.size());
	}
}