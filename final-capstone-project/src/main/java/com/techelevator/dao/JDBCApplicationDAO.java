package com.techelevator.dao;



import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.model.Application;


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
		
		jdbcTemplate.update(sqlInsertApplication, application.getPropertyId(), application.getFirstName(), application.getLastName(), application.getSsn(), application.getBirthDate(),
				application.getCurrentEmployer(), application.getAnnualIncome(), application.getPhoneNumber(), application.getEmail(), application.getAddressLine1(), application.getAddressLine2(), application.getCity(),
				application.getState(), application.getZipcode());
		
		
	}
	

}
