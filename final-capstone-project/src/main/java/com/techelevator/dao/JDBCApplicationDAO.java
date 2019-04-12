package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Application;
import com.techelevator.model.Property;

@Component
public class JDBCApplicationDAO implements ApplicationDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCApplicationDAO(DataSource datasource) {

		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public void saveApplication(Application application) {
		// TODO Auto-generated method stub
		System.out.println("InDAO");
		String sqlInsertApplication = "INSERT INTO application (property_id, first_name, last_name, ssn, birthdate, current_employer, annual_income, phone_number, email, address_line1, "
				+ "address_line2, city, state, zipcode) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		jdbcTemplate.update(sqlInsertApplication, application.getPropertyId(), application.getFirstName(),
				application.getLastName(), application.getSsn(), application.getBirthDate(),
				application.getCurrentEmployer(), application.getAnnualIncome(), application.getPhoneNumber(),
				application.getEmail(), application.getAddressLine1(), application.getAddressLine2(),
				application.getCity(), application.getState(), application.getZipcode());

	}

	@Override
	public List<Application> showApplications() {
		// TODO Auto-generated method stub
		List<Application> allApplications = new ArrayList<>();
		String sqlSelectAllApplications = "SELECT application.*, property.property_name FROM application JOIN property ON application.property_id = property.property_id";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllApplications);
		while (results.next()) {
			allApplications.add(mapRowToApplication(results));
		}
		return allApplications;
	}

	private Application mapRowToApplication(SqlRowSet row) {
		Application application = new Application();
		Property property = new Property();
		application.setApplicationId(row.getInt("application_id"));
		application.setPropertyId(row.getInt("property_id"));
		application.setFirstName(row.getString("first_name"));
		application.setLastName(row.getString("last_name"));
		application.setSsn(row.getLong("ssn"));
		application.setBirthDate(row.getString("birthdate"));
		application.setCurrentEmployer(row.getString("current_employer"));
		application.setAnnualIncome(row.getDouble("annual_income"));
		application.setPhoneNumber(row.getLong("phone_number"));
		application.setEmail(row.getString("email"));
		application.setAddressLine1(row.getString("address_line1"));
		application.setAddressLine2(row.getString("address_line2"));
		application.setCity(row.getString("city"));
		application.setState(row.getString("state"));
		application.setZipcode(row.getInt("zipcode"));
		property.setPropertyName(row.getString("property_name"));
		application.setProperty(property);
		return application;

	}

}
