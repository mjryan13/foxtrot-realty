package com.techelevator.dao;

import com.techelevator.model.Rent;

public interface RentDAO {

	void payRent(Rent rent);

	double getRent(String userName);

}
