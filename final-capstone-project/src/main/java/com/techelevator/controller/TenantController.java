package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.dao.PropertyDAO;
import com.techelevator.dao.RentDAO;
import com.techelevator.dao.ServiceRequestDAO;
import com.techelevator.model.ServiceRequest;
import com.techelevator.model.User;

@Controller
@SessionAttributes("currentUser")
public class TenantController {
	
	@Autowired
	private PropertyDAO propertyDao;
	
	@Autowired
	private ServiceRequestDAO serviceRequestDao;
	
	@RequestMapping(path="/tenants", method=RequestMethod.GET)
	public String showTenantsPage(ModelMap map) {
		System.out.println("At line 1");
		User user = (User) map.get("currentUser");
		System.out.println("At line 2" + user.getUserName());
		map.addAttribute("property", propertyDao.getRentInformation(user.getUserName()));
		System.out.println("At line 3");
		System.out.println("In Tenant Controller" + user.getUserName());
		System.out.println("In Rent Controller property:" + propertyDao.getRentInformation(user.getUserName()).getRent());
		return "tenantsHomePage";
	}
	
	@RequestMapping(path="/tenantsServiceRequest", method=RequestMethod.POST)
	public String submitServiceRequest(ModelMap map, ServiceRequest request, @RequestParam String description) {
		User user = (User) map.get("currentUser");
		map.addAttribute("property", propertyDao.getRentInformation(user.getUserName()));
		request.setUserId(propertyDao.getRentInformation(user.getUserName()).getUserId());
		request.setPropertyId(propertyDao.getRentInformation(user.getUserName()).getPropertyId());
		request.setDescription(description);	
		request.setRequestStatus("pending");
		
		serviceRequestDao.createServiceRequest(request);
		return "tenantsHomePage";
	}
	
	@RequestMapping(path="/tenantsPayRent", method=RequestMethod.POST)
	public String submitPayment(ModelMap map) {
		return "tenantsHomePage";
	}
	
}
