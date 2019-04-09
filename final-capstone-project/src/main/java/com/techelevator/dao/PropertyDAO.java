package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Property;

public interface PropertyDAO {

	List<Property> searchAvilableProperties();

	Property searchPropertyById(int propertyId);

	Property searchByZipCode(int zipcode);

	Property searchByBedrooms(int noOfBedrooms);
	
	void saveProperty(Property property);

}
