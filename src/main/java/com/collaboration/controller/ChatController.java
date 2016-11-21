package com.collaboration.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.collaboration.model.Message;
import com.collaboration.model.OutputMessage;

@Controller
public class ChatController {
	
	private static final Logger logger= LoggerFactory.getLogger(ChatController.class);
	
	@MessageMapping("/chat")
	@SendTo("/topic/message")
	public OutputMessage sendMessage(Message message)
	{
		logger.debug("Calling method send message");
		logger.debug("Message : ",message.getMessage());
		logger.debug("Message ID : ",message.getId());
		
		return new OutputMessage(message,new Date());
	}
	
	@RequestMapping(value="/user/viewChat", method = RequestMethod.GET)
	  public String viewChat() {
	    return "user/chat";
	  }

}
