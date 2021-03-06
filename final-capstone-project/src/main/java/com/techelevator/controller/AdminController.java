package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.dao.ApplicationDAO;
import com.techelevator.dao.PropertyDAO;
import com.techelevator.dao.RentDAO;
import com.techelevator.dao.ServiceRequestDAO;
import com.techelevator.model.Application;
import com.techelevator.model.Property;
import com.techelevator.model.Rent;
import com.techelevator.model.ServiceRequest;
import com.techelevator.model.User;

@Controller
@SessionAttributes("currentUser")
public class AdminController {
	
	@Autowired
	private ApplicationDAO applicationDao;
	
	@Autowired
	private PropertyDAO propertyDao;
	
	@Autowired
	private ServiceRequestDAO serviceRequestDao;
	
	@Autowired
	private RentDAO rentDao;
	
	@RequestMapping(path = "/admin", method = RequestMethod.GET)
	public String showApplications(ModelMap map) {
		
		User user = (User) map.get("currentUser");
		map.addAttribute("user", user.getUserName());
		
		List<Application> applicationList = applicationDao.showApplications();
		map.addAttribute("applications", applicationList);
		
		List<Property> propertiesList = propertyDao.showAllProperties();
		map.addAttribute("properties", propertiesList);
		
		List<Rent> rentsList = rentDao.getAllRents();
		map.addAttribute("rents", rentsList);
			
		List<ServiceRequest>  serviceRequestsList = serviceRequestDao.showAllPendingServiceRequests();
		map.addAttribute("serviceRequests", serviceRequestsList );
		
		List<ServiceRequest>  completeServiceRequestsList = serviceRequestDao.showAllCompletedServiceRequests();
		map.addAttribute("completedServiceRequests", completeServiceRequestsList );
				
		return "adminHomePage";
	}
	
	@RequestMapping(path = "/adminConfirm", method = RequestMethod.POST)
	public String approveOrDenyApplication(ModelMap map, @RequestParam("applicationId") int applicationId) {
		applicationDao.deleteApplication(applicationId);
		return "redirect:/admin";
	}
	
	@RequestMapping(path = "/completeServiceRequest", method = RequestMethod.POST)
	public String completeServiceRequest(ModelMap map, ServiceRequest request) {
		serviceRequestDao.completeServiceRequest(request);
		return "redirect:/admin";
	}
	
	
	
	
}
