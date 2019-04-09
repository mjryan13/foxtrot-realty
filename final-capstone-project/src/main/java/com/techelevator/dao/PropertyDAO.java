package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Property;

public interface PropertyDAO {

	List<Property> searchAvilableProperties();

	Property searchPropertyById(int propertyId);

	List<Property> searchPropertiesByChoice(int zipcode, int numberOfBedrooms);
	
	List<Property> sortPropertiesByChoice (String choice);
	
	void applyProperty(int propertyId);

	Property searchByBedrooms(int noOfBedrooms);

	void saveProperty(Property property);

}
