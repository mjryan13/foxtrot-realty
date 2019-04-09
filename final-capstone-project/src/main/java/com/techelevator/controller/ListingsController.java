package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.dao.PropertyDAO;
import com.techelevator.model.Property;

@Controller
public class ListingsController {

	@Autowired
	PropertyDAO propertyDao;

	@RequestMapping(path = "/listings", method = RequestMethod.GET)
	public String showListings(ModelMap map) {
		List<Property> propertiesList = propertyDao.searchAvilableProperties();
		map.addAttribute("listings", propertiesList);
		return "listingsPage";

	}

	@RequestMapping(path = "/propertyDetail", method = RequestMethod.GET)
	public String showPropertyDetail(ModelMap map, @RequestParam("propertyId") int propertyId) {

		map.addAttribute("property", propertyDao.searchPropertyById(propertyId));

		return "propertyDetail";

	}
	
	@RequestMapping(path = "/searchListings", method = RequestMethod.GET)
	public String showSearchListings(ModelMap map, @RequestParam("zipcode") int zipcode, @RequestParam("numberOfBedrooms") int numberOfBedrooms ) {
		List<Property> propertiesList = propertyDao.searchPropertiesByChoice(zipcode, numberOfBedrooms);
		map.addAttribute("searchListings", propertiesList);
		return "searchListingsPage";

	}
	
	@RequestMapping(path = "/sortListings", method = RequestMethod.GET)
	public String showSortListings(ModelMap map, @RequestParam("sortBy") String sortBy) {
		
		List<Property> propertiesList = propertyDao.sortPropertiesByChoice(sortBy);
		//System.out.println(sortBy);
//		for(Property p: propertiesList) {
//			System.out.println(p.getZipcode());
//		}
		map.addAttribute("listings", propertiesList);
		return "listingsPage";

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
