package com.bob.stepy.util;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.java.Log;

@Log
public class SessionUtil implements HttpSessionBindingListener{
	
	@Autowired
	HttpSession session;
	
	private static SessionUtil sessiontest = null;
	private static Hashtable<HttpSession, String> loginuser = new Hashtable();
	
	public static synchronized SessionUtil getInstance() {
		if(sessiontest == null) {
			sessiontest = new SessionUtil();
		}
		return sessiontest;
	}
	
	public void setSession(HttpSession session, String userId) {
		String identityid = userId;
		log.info("entered is " + userId);
		log.info("setSession area HttpSession Print Out : " + session);
		session.setAttribute(identityid, this);
	}
	
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		
		log.info(event.getName());
		log.info("Session is : " + event.getSession() + " and " + event.getName());
		
		if(using(event.getName())) {
			log.info("already logged in member");
		}else {
			loginuser.put(event.getSession(), event.getName());
			log.info("put a new session - userid pair");
		}
		log.info("The whole number of users connected to Stepy is " + loginuser.size());
	}
	
	
	public boolean using(String userId) {

		return loginuser.containsValue(userId);
	}
	
	
	
	
	

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		
		log.info("GoodBye" + "event get Name is " + event.getName());
		loginuser.remove(event.getSession());
	}

}
