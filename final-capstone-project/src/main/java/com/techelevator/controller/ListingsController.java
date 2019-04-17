package com.techelevator.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.dao.ApplicationDAO;
import com.techelevator.dao.PropertyDAO;
import com.techelevator.model.Application;
import com.techelevator.model.Property;

@Controller
@SessionAttributes("propertySession")
public class ListingsController {

	@Autowired	
	PropertyDAO propertyDao;
	
	@Autowired 
	ApplicationDAO applicationDao;

	@RequestMapping(path = "/listings", method = RequestMethod.GET)
	public String showListings(ModelMap map) {
		List<Property> propertiesList = propertyDao.searchAvilableProperties();
		map.addAttribute("listings", propertiesList);
		return "listingsPage";

	}

	@RequestMapping(path = "/propertyDetail", method = RequestMethod.GET)
	public String showPropertyDetail(ModelMap map, HttpSession session, @RequestParam("propertyId") int propertyId) {
        session.setAttribute("propertySession", propertyDao.searchPropertyById(propertyId));
		map.addAttribute("property", propertyDao.searchPropertyById(propertyId));
		map.addAttribute("addressMap", propertyDao.searchAddressById(propertyId));
		return "propertyDetail";

	}
	
	@RequestMapping(path = "/searchListings", method = RequestMethod.GET)
	public String showSearchListings(ModelMap map, @RequestParam("zipcode") int zipcode, @RequestParam("numberOfBedrooms") int numberOfBedrooms ) {
		List<Property> propertiesList = propertyDao.searchPropertiesByChoice(zipcode, numberOfBedrooms);
		map.addAttribute("searchListings", propertiesList);
		return "searchListingsPage";

	}
	
	@RequestMapping(path = "/sortListings", method = RequestMethod.GET)
	public String showSortListings(ModelMap map, @RequestParam("sortBy") String sortBy, HttpServletRequest request) {	
		List<Property> propertiesList = propertyDao.sortPropertiesByChoice(sortBy);
		map.addAttribute("listings", propertiesList);
		String status = request.getParameter("sortBy");
		request.setAttribute("sortBy", status);
		return "listingsPage";

	}
	
	@RequestMapping(path = "/application", method = RequestMethod.GET)
	public String showApplication (ModelMap map, HttpSession session, @RequestParam("propertyId") int propertyId) { 
		session.setAttribute("propertySession", propertyDao.searchPropertyById(propertyId));
		map.addAttribute("property", propertyDao.searchPropertyById(propertyId));
		return "application";

	}
	
	@RequestMapping(path ="/submitApplication", method = RequestMethod.POST)
	public String submitApplication(ModelMap map, Application application) {
		Property property = (Property) map.get("propertySession");
		application.setPropertyId(property.getPropertyId());
		application.setAddressLine2(" ");
		applicationDao.saveApplication(application);
		propertyDao.applyProperty(property.getPropertyId());	
		return "confirmationPage";
	}
	
	@RequestMapping(path = "/visitorConfirmation", method = RequestMethod.POST)
	public String showConfirmation (ModelMap map, @RequestParam("propertyId") int propertyId) {
		propertyDao.applyProperty(propertyId);
		return "confirmationPage";

	}
	
	@RequestMapping(path = "/aboutUs", method = RequestMethod.GET)
	public String showAboutUs () {
		return "aboutUsPage";
	}
	
}
