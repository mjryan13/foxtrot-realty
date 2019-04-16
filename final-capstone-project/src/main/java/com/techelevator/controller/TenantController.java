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
import com.techelevator.model.Rent;
import com.techelevator.model.ServiceRequest;
import com.techelevator.model.User;

@Controller
@SessionAttributes("currentUser")
public class TenantController {
	
	@Autowired
	private PropertyDAO propertyDao;
	
	@Autowired
	private ServiceRequestDAO serviceRequestDao;
	
	@Autowired
	private RentDAO rentDao;
	
	@RequestMapping(path="/tenants", method=RequestMethod.GET)
	public String showTenantsPage(ModelMap map) {
		User user = (User) map.get("currentUser");
		map.addAttribute("user", user.getUserName());
		map.addAttribute("property", propertyDao.getRentInformation(user.getUserName()));
		
		return "tenantsHomePage";
	}
	
	@RequestMapping(path="/tenantsServiceRequest", method=RequestMethod.POST)
	public String submitServiceRequest(ModelMap map, ServiceRequest request, @RequestParam String description) {
		User user = (User) map.get("currentUser");
		map.addAttribute("property", propertyDao.getRentInformation(user.getUserName()));
		request.setUserId(propertyDao.getRentInformation(user.getUserName()).getUserId());
		request.setPropertyId(propertyDao.getRentInformation(user.getUserName()).getPropertyId());
		request.setDescription(description);	
		request.setRequestStatus("Pending");		
		serviceRequestDao.createServiceRequest(request);
		
		return "serviceRequestConfirmationPage";
	}
	
	@RequestMapping(path="/tenantsPayRent", method=RequestMethod.POST)
	public String submitPayment(ModelMap map, Rent rent) {
		User user = (User) map.get("currentUser");
		map.addAttribute("property", propertyDao.getRentInformation(user.getUserName()));
		rent.setPropertyId(propertyDao.getRentInformation(user.getUserName()).getPropertyId());
		rent.setUserId(propertyDao.getRentInformation(user.getUserName()).getUserId());
		rent.setRent(propertyDao.getRentInformation(user.getUserName()).getRent());
		rent.setProperty(propertyDao.getRentInformation(user.getUserName()));
		rent.setUser(user);
		rentDao.payRent(rent);
		
		return "paymentConfirmationPage";
	}
	
}
