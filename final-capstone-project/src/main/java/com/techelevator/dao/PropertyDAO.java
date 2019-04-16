package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Property;

public interface PropertyDAO {

	List<Property> searchAvilableProperties();
	
	List<Property> showAllProperties();
	
	List<Property> ShowAllPropertiesByUserId(int userId);

	Property searchPropertyById(int propertyId);
	
	String searchAddressById(int propertyId);
	
	Property getRentInformation(String userName);

	List<Property> searchPropertiesByChoice(int zipcode, int numberOfBedrooms);
	
	List<Property> sortPropertiesByChoice (String choice);
	
	void applyProperty(int propertyId);

	void saveProperty(Property property);

}
