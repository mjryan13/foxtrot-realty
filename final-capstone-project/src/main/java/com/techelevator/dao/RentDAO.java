package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Rent;

public interface RentDAO {

	void payRent(Rent rent);

	List<Rent> getAllRents();

}
