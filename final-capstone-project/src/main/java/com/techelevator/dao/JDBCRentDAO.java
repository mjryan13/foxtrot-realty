package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Property;
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
	public double getRent(String userName) {
		// TODO Auto-generated method stub
		double rentAmount = 0;
		Property property = new Property();
		
		String sqlGetRent = "select property.rent from property join users on property.user_id = users.user_id where users.user_name = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetRent, userName);
//		rentAmount = result.getDouble("rent");
		
		if(result.next()) {
			
			property.setRent(result.getDouble("rent"));
			
		}
		return property.getRent();
	}

}
