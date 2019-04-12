package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.ApplicationDAO;
import com.techelevator.dao.PropertyDAO;
import com.techelevator.dao.ServiceRequestDAO;
import com.techelevator.model.Application;
import com.techelevator.model.Property;
import com.techelevator.model.ServiceRequest;

@Controller
public class AdminController {
	
	@Autowired
	ApplicationDAO applicationDao;
	
	@Autowired
	PropertyDAO propertyDao;
	
	@Autowired
	ServiceRequestDAO serviceRequestDao;
	
	@RequestMapping(path = "/admin", method = RequestMethod.GET)
	public String showApplications(ModelMap map) {
		List<Application> applicationList = applicationDao.showApplications();
		map.addAttribute("applications", applicationList);
		System.out.println("In Admin controller");
		for (Application a : applicationList) {
			System.out.println(a.getEmail());
		}
		
		List<Property> propertiesList = propertyDao.showAllProperties();
		map.addAttribute("propeties", propertiesList);
		
		
		List<ServiceRequest>  serviceRequestsList = serviceRequestDao.showAllServiceRequests();
		map.addAttribute("serviceRequests", serviceRequestsList );
		
		return "adminHomePage";
	}
	
	
	
}
