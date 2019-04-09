package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Property;

@Component
public class JDBCPropertyDAO implements PropertyDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCPropertyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Property> searchAvilableProperties() {
		// TODO Auto-generated method stub
		List<Property> availableProperties = new ArrayList<>();
		String sqlSelectAvailableProperties = "SELECT * FROM property where property_status = 'available' ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAvailableProperties);
		while (results.next()) {
			availableProperties.add(mapRowToProperty(results));
		}
		return availableProperties;

	}

	@Override
	public Property searchPropertyById(int propertyId) {
		// TODO Auto-generated method stub
		Property newProperty = null;
		String sqlSelectPropertyById = "Select * from property where property_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectPropertyById, propertyId);

		if (results.next()) {
			newProperty = mapRowToProperty(results);
		}

		return newProperty;
	}

	@Override
	public Property searchByZipCode(int zipcode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Property searchByBedrooms(int noOfBedrooms) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveProperty(Property property) {
		// TODO Auto-generated method stub

	}

	private Property mapRowToProperty(SqlRowSet row) {
		Property newProperty = new Property();
		newProperty.setPropertyId(row.getInt("property_id"));
		newProperty.setSquareFootage(row.getInt("square_feet"));
		newProperty.setNumberOfBedrooms(row.getInt("number_of_bedrooms"));
		newProperty.setNumberOfBathrooms(row.getInt("number_of_bathrooms"));
		newProperty.setRent(row.getInt("rent"));
		newProperty.setPropertyDescription(row.getString("property_description"));
		newProperty.setPropertyType(row.getString("property_type"));
		newProperty.setStatusOfProperty(row.getString("property_status"));
		newProperty.setUserId(row.getInt("user_id"));
		newProperty.setAddressId(row.getInt("address_id"));
		newProperty.setStreetAddress1(row.getString("street_name1"));
		newProperty.setStreetAddress2(row.getString("street_name2"));
		newProperty.setCity(row.getString("city"));
		newProperty.setState(row.getString("state"));
		newProperty.setZipcode(row.getInt("zipcode"));
		newProperty.setPropertyName(row.getString("property_name"));
		newProperty.setOfferAvailable(row.getBoolean("offer_available"));

		return newProperty;

	}

}
