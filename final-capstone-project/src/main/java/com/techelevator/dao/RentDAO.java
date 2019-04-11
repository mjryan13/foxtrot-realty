package com.techelevator.dao;

public interface RentDAO {

	void payRent(int propertyId);
	double getRent(int propertyId);

}
