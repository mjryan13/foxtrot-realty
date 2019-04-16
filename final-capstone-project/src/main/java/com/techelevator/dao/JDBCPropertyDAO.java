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
		String sqlSelectAvailableProperties = "SELECT * FROM property where property_status = 'Available' OR property_status = 'Pending'";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAvailableProperties);
		while (results.next()) {
			availableProperties.add(mapRowToProperty(results));
		}
		return availableProperties;

	}

	@Override
	public List<Property> showAllProperties() {
		// TODO Auto-generated method stub
		List<Property> allProperties = new ArrayList<>();
		String sqlSelectAllProperties = "SELECT * FROM property";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllProperties);
		while (results.next()) {
			allProperties.add(mapRowToProperty(results));
		}
		return allProperties;
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
	public String searchAddressById(int propertyId) {
		// TODO Auto-generated method stub
		Property newProperty = null;
		String sqlSelectPropertyById = "Select street_name1, street_name2, city, state, zipcode from property where property_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectPropertyById, propertyId);

		if (results.next()) {
			newProperty = mapRowToAddress(results);
		}

		return newProperty.getStreetAddress1() + "," + newProperty.getCity() + "," + newProperty.getState() + " " + newProperty.getZipcode();
	}

	@Override
	public Property getRentInformation(String userName) {
		Property newProperty = null;
		String sqlGetRent = "select property.* from property join users on property.user_id = users.user_id where users.user_name = ?";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlGetRent, userName);
		if (result.next()) {
			newProperty = mapRowToProperty(result);
		}
		return newProperty;

	}

	@Override
	public List<Property> sortPropertiesByChoice(String choice) {
		// TODO Auto-generated method stub
		List<Property> sortProperties = new ArrayList<>();
		String sqlSelectPropertyBySort;
		if (choice.equals("zipcode")) {
			sqlSelectPropertyBySort = "Select * from property Order By zipcode desc";
		} else if (choice.equals("number_of_bedrooms")) {
			sqlSelectPropertyBySort = "Select * from property Order By number_of_bedrooms desc";
		} else {
			sqlSelectPropertyBySort = "Select * from property Order By rent";
		}

		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectPropertyBySort);

		while (results.next()) {
			sortProperties.add(mapRowToProperty(results));
		}

		return sortProperties;
	}

	@Override
	public List<Property> searchPropertiesByChoice(int zipcode, int numberOfBedrooms) {
		// TODO Auto-generated method stub
		List<Property> searchProperties = new ArrayList<>();
		String sqlSelectPropertyBySearch = "Select * from property where zipcode = ? and number_of_bedrooms= ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectPropertyBySearch, zipcode, numberOfBedrooms);

		while (results.next()) {
			searchProperties.add(mapRowToProperty(results));
		}

		return searchProperties;
	}

	@Override
	public List<Property> ShowAllPropertiesByUserId(int userId) {
		// TODO Auto-generated method stub
		List<Property> allPropertiesForUserId = new ArrayList<>();
		String sqlSelectPropertiesForUserId = "Select * from property where user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectPropertiesForUserId, userId);

		while (results.next()) {
			allPropertiesForUserId.add(mapRowToProperty(results));
		}

		return allPropertiesForUserId;
	}

	@Override
	public void saveProperty(Property property) {
		// TODO Auto-generated method stub
		String sqlInsertUpdate = "INSERT INTO property (square_feet, property_name, offer_available, number_of_bedrooms, number_of_bathrooms, rent, property_description, property_type, property_status, user_id, address_id, street_name1, street_name2, city, state, zipcode) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlInsertUpdate, property.getSquareFootage(), property.getPropertyName(),
				property.isOfferAvailable(), property.getNumberOfBedrooms(), property.getNumberOfBathrooms(),
				property.getRent(), property.getPropertyDescription(), property.getPropertyType(),
				property.getPropertyStatus(), property.getUserId(), property.getAddressId(),
				property.getStreetAddress1(), property.getStreetAddress2(), property.getCity(), property.getState(),
				property.getZipcode());

	}

	@Override
	public void applyProperty(int propertyId) {
		// TODO Auto-generated method stub
		String sqlUpdatePropertyStatus = "update property set property_status= 'Pending' where property_id = ?";
		jdbcTemplate.update(sqlUpdatePropertyStatus, propertyId);

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
		newProperty.setPropertyStatus(row.getString("property_status"));
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
	
	private Property mapRowToAddress(SqlRowSet row) {
		Property newProperty = new Property();
		newProperty.setStreetAddress1(row.getString("street_name1"));
		newProperty.setCity(row.getString("city"));
		newProperty.setState(row.getString("state"));
		newProperty.setZipcode(row.getInt("zipcode"));
		return newProperty;
		
	}

}
