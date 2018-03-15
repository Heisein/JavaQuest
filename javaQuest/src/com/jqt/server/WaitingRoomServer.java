package com.jqt.server;

import java.awt.List;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.StringTokenizer;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.jqt.game.model.service.RoomService;

@ServerEndpoint("/waiting")
public class WaitingRoomServer {

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println(session);
		clients.add(session);
		String queryString = session.getQueryString();
		String type = getParameter(queryString, "type");
		String roomNumber = getParameter(queryString, "roomNumber");
		String present = getParameter(queryString, "present");
		String msg = "type="+type+"&roomNumber="+roomNumber+"&presentNo="+present;
		System.out.println("onOpen present : " + present);
		
		System.out.println("대기방 열림 : " + type);
		send(msg, session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		String type = getParameter(message, "type");
		String roomNumber = getParameter(message, "roomNumber");
		String title = getParameter(message, "title");
		String presentNo = getParameter(message, "presentNo");
		System.out.println("onMessage : " + type);
		System.out.println("presentNo : " + presentNo);
		System.out.println("roomNumber : " + roomNumber);
		String msg = "type="+type+"&roomNumber="+roomNumber+"&title="+title+"&presentNo="+presentNo;
		switch(type){
		case "create" : 
			msg = "type=" + type;
			sendOne(msg, session);
			break;
		case "upCount" : 
			int temp = Integer.parseInt(presentNo) + 1;
			System.out.println("temp : " + temp);
			msg = "type="+type+"&roomNumber="+roomNumber+"&title="+title+"&presentNo="+String.valueOf(temp);
			send(msg, session);
			break;
		case "exit" :
			System.out.println(msg);
			send(msg, session);
			clients.remove(session);
			break;
		
		default : 
			//send();
			
			break;
		}
	}


	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
	
	public String getParameter(String queryString, String paramName) {
	    ArrayList<String> params = new ArrayList<String>();
	    ArrayList<String> result = new ArrayList<String>();
	    
	    String paramResult = "";
	    
	    StringTokenizer tokens = new StringTokenizer(queryString, "&");
	    while (tokens.hasMoreTokens()) {
	      params.add(tokens.nextToken());
	    }
	    
	    for (int i = 0; i < params.size(); i++) {
	    	StringTokenizer st = new StringTokenizer((String)params.get(i), "=");
	    	
	    	while (st.hasMoreTokens()) {
	    		result.add(st.nextToken());
	    	}
	    }
	    
	    int cnt = result.indexOf(paramName);
	    paramResult = (String)result.get(cnt + 1);
	    System.out.println("paramResult : " + paramResult);
	    return paramResult;
	}
	
	public void send(String message, Session session){
		System.out.println(message);
		synchronized (clients) {
			for (Session client : clients) {
				if (!client.equals(session)) {
					try {
						client.getBasicRemote().sendText(message);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}
	
	public void sendOne(String message, Session session){
		try {
			session.getBasicRemote().sendText(message);
			System.out.println("message : " + message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}