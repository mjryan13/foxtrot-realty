package com.techelevator.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.dao.UserDAO;
import com.techelevator.model.User;

@Controller
@SessionAttributes("currentUser")
public class AuthenticationController {

	private UserDAO userDAO;

	@Autowired
	public AuthenticationController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@RequestMapping(path="/login", method=RequestMethod.GET)
	public String displayLoginForm() {
		return "login";
	}
	
	@RequestMapping(path="/login", method=RequestMethod.POST)
	public String login(@RequestParam String userName, 
						@RequestParam String password, 
						@RequestParam(required=false) String destination,
						HttpSession session) {
		if(userDAO.searchForUsernameAndPassword(userName, password)) {
			
			session.setAttribute("currentUser", userDAO.getUserByUserName(userName));
		    User user = (User) userDAO.getUserByUserName(userName);
	         if(user.getRole().equals("tenant")) {
	        	return "redirect:/tenants"; 
	         }
	         else if(user.getRole().equalsIgnoreCase("admin")) {
	        	 return "redirect:/admin";
	         }
		    
		    
//			if(destination != null && ! destination.isEmpty()) {
//				return "redirect:" + destination;
//			} else {
//				return "redirect:/users/"+userName;
//			}
			
		} else {
			return "redirect:/login";
		}
		return "redirect:/login";
	}

	@RequestMapping(path="/logout", method=RequestMethod.GET)
	public String logout(ModelMap model, HttpSession session) {
		model.remove("currentUser");
		session.invalidate();
		return "redirect:/";
	}
}
