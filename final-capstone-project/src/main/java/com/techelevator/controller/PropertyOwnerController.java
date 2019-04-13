package com.techelevator.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.dao.PropertyDAO;
import com.techelevator.model.Property;
import com.techelevator.model.User;

@Controller
@SessionAttributes("currentUser")
public class PropertyOwnerController {
	
	
@Autowired
private PropertyDAO propertyDao;

@RequestMapping(path= "/propertyOwners", method = RequestMethod.GET)
public String showPropertyOwnersPag(ModelMap map) {
	
	User user = (User) map.get("currentUser");
	List<Property> propertiesList = propertyDao.ShowAllPropertiesByUserId(user.getUserID());
    map.addAttribute("properties", propertiesList);  
    return "propertyOwnersHomePage";

}
	
@RequestMapping(path= "/propertyOwners", method = RequestMethod.POST)
public String addAProperty(ModelMap map, Property property) {

	User user = (User) map.get("currentUser");
	
	property.setPropertyStatus("available");
	property.setUserId(user.getUserID());
	property.setAddressId(1);
	propertyDao.saveProperty(property);
	
	return "redirect:/propertyOwners";
	
}

}
