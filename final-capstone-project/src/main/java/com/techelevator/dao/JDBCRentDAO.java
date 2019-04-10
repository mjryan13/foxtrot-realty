package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Rent;

@Component
public class JDBCRentDAO implements RentDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCRentDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public void payRent(int propertyId) {
		// TODO Auto-generated method stub

	}

	@Override
	public double getRent(int propertyId) {
		// TODO Auto-generated method stub
		double rentAmount = 0;
		Rent rent = new Rent();
		System.out.println(propertyId);
		String sqlGetRent = "SELECT rent FROM payment WHERE property_id = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetRent, propertyId);
//		rentAmount = result.getDouble("rent");
		
		if(result.next()) {
			
			rent.setRent(result.getDouble("rent"));
			
		}
		return rent.getRent();
	}

}
