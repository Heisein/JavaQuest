package com.jqt.server;

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

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private Session session;
	private static final HashMap<String, HashMap<String, Session>> chatRoomList = new HashMap<String, HashMap<String, Session>>();
	private String deleteNumber;
	
	//서버와 연결이 됬을때
	@OnOpen
	public void onOpen(Session session) {
		// 연결된 세션 세트에 세션 추가
		this.session = session;
		String queryString = session.getQueryString();
		
		//받아온 쿼리스트링 디코딩
		queryString = decoder(queryString);
		
		//각 키값에 맞춰 추출하기
		String nickName = getParameter(queryString, "nickName");
		String roomNumber = getParameter(queryString, "roomNumber");
		
		System.out.println("broadSocket roomNuber : " + roomNumber);
		 
		//방에 인원추가
		addChatClient(nickName, roomNumber, session);
		
		//해당 방 번호 안의 유저들 추출하기
		HashMap<String, Session> clients = chatRoomList.get(roomNumber);
		
		sendToAll("type=new&nickName=" + nickName + "&data=" + nickName + "님이 입장하셨습니다.\n" + "&members=" + getMembers(clients), clients);
																								//클라이언트쪽에서 가공할수 있도록 만듬
		clients.put(nickName, session);
		
		System.out.println("접속자 수 : " + clients.size());
		
	}
	
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("클라이언트로 부터 온 메세지 : " + message);
		String nickName = decoder(getParameter(message, "nickName"));
		String data = getParameter(message, "message");
		data = nickName + " : " + data + "\n";

		String type = getParameter(message, "type");
		String roomNumber = getParameter(message, "roomNumber");
		this.deleteNumber = roomNumber;
		
		HashMap<String, Session> clients = chatRoomList.get(roomNumber);
		String members = getMembers(clients);
		
		switch(type){
		case "sendToAll" :
			String serverMsg = "type=" + type + "&data=" + data + "&members=" + members;
			sendToAll(serverMsg, clients);
			break;
		
		case "close" :
			exitRoom(session); //삭제
			break;
			
		case "exit" : 
			serverMsg = "type="+type+"&members="+ members +"&roomNumber="+deleteNumber;
			sendOne(serverMsg, session);
			break;
			
		case "start" : 
			System.out.println("start roomNumber : " + roomNumber);
			serverMsg = "type=" + type + "&members=" + members + "&roomNumber=" + roomNumber;
			sendToAll(serverMsg, clients);
			
			break;
			
		case "O" :
		case "X" : 
			serverMsg = "type=" + type + "&nickName=" + nickName + "&members=" + members;
			sendToAll(serverMsg, clients);
			break;
		}
		
	}

	@OnClose
	public void onClose(Session session) {
		 System.out.println("websocketChatServer. OnClose!!!");
		 exitRoom(session);
	
	}
	
	//디코딩용 메소드
	public String decoder(String s)  {
	    String result = "";
	    try {
	      result = URLDecoder.decode(s, "UTF-8");
	    }
	    catch (Exception e) {
	      System.out.println("decoder 에러");
	    }
	    return result;
	}
	
	
	//받아온 파라미터 추출용 메소드
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
	
	//방이 없으면 방을 생성 있으면 클라이언트를 방에 넣는 메소드
	public void addChatClient(String nickName, String roomNumber, Session session) {
	    
		if (chatRoomList.get(roomNumber) == null) {
	      chatRoomList.put(roomNumber, new HashMap<String, Session>());
	    }
	   
		HashMap<String, Session> clients = chatRoomList.get(roomNumber);
	    clients.put(nickName, session);
	    chatRoomList.put(roomNumber, clients);
	    
	    System.out.println("chatRoomList : " + chatRoomList.size());
	
	}
	
	//한방의 클라이언트들을 추출
	public String getMembers(HashMap<String, Session> clients) { //방 한개
	    Object[] nickNames = clients.keySet().toArray();
	    String message = "";
	    if (nickNames.length > 0) {
	      for (int i = 0; i < nickNames.length; i++) {
	        message = message + nickNames[i] + "@";
	      }
	      
	      message = message.substring(0, message.length() - 1);
	    }
	    
	    return message;
	}
	
	//전체 메세지 보내기
	public void sendToAll(String message, HashMap<String, Session> clients) {
	    System.out.println("##sendToAll 시작!!!!!!!!!");
	    
	    Iterator<Session> it = clients.values().iterator();
	    while (it.hasNext()) {
	    	try {
	    		Session session = it.next();
	    		session.getBasicRemote().sendText(message);
	    		System.out.println("보낸 메세지 : " + message);
	    	}
	    	catch (IOException e) {
	    		System.out.println("sendToAll에러");
	    	}
	    }
	 }
	
	//자신한테 메세지 리턴
	public void sendOne(String message, Session session) {
		try {
			System.out.println("sendOne : " + message);
			session.getBasicRemote().sendText(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void exitRoom(Session s) {
		
		String queryString = decoder(this.session.getQueryString());
		String roomNumber = getParameter(queryString, "roomNumber");
		String nickName = getParameter(queryString, "nickName");

		HashMap<String, Session> clients = chatRoomList.get(roomNumber);
		
		if (clients != null) {
			clients.remove(nickName);
			if(clients.size() == 0){
				clients.clear();
				System.out.println("끝!!!!!");
				System.out.println("삭제하기 위한 룸넘버 : " + roomNumber);
				new RoomService().deleteRoom(roomNumber);

			}else {
				String data = "type=close&data=" + nickName + "님이 나가셨습니다" + "\n" + "&members=" + getMembers(clients) + "&nickName=." + nickName;
				System.out.println("eixtRoom data : " + data);
				sendToAll(data, clients);
			}
		}
		
	}
	
}