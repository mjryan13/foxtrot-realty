package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	
	
	

}
