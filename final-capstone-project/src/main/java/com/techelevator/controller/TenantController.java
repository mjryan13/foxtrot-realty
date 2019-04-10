package com.techelevator.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.dao.RentDAO;
import com.techelevator.dao.ServiceRequestDAO;
import com.techelevator.model.ServiceRequest;

@Controller
public class TenantController {
	
	@Autowired
	private RentDAO rentDao;
	
	@Autowired
	private ServiceRequestDAO serviceRequestDao;
	
	@RequestMapping(path="/tenants", method=RequestMethod.GET)
	public String showTenantsPage(ModelMap map) {
		
		map.addAttribute("rent", rentDao.getRent(2));
		return "tenantsHomePage";
	}
	
	@RequestMapping(path="/tenants", method=RequestMethod.POST)
	public String submitServiceRequest(ModelMap map, ServiceRequest request) {
		request.setRequest_status("pending");
		serviceRequestDao.createServiceRequest(request);
		return "redirect:/tenants";
	}
	
	

	
}
