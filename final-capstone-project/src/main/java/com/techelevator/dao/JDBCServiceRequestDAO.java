package com.techelevator.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.techelevator.model.ServiceRequest;

@Component
public class JDBCServiceRequestDAO implements ServiceRequestDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCServiceRequestDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);

	}

	@Override
	public void createServiceRequest(ServiceRequest request) {
		// TODO Auto-generated method stub
		String sqlInsertRequest = "INSERT INTO service_request(property_id, description, request_status, user_id) VALUES(?, ?, ?, ?)";
		jdbcTemplate.update(sqlInsertRequest, request.getPropertyId(), request.getDescription(),
				request.getRequest_status(), request.getUserId());

	}
}
