package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Property;
import com.techelevator.model.ServiceRequest;
import com.techelevator.model.User;

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
				request.getRequestStatus(), request.getUserId());

	}

	@Override
	public List<ServiceRequest> showAllServiceRequests() {
		// TODO Auto-generated method stub
		List<ServiceRequest> allServiceRequests = new ArrayList<>();
		String sqlSelectAllServiceRequests = "SELECT property.property_name, service_request.description, service_request.request_status, users.first_name, users.last_name, users.email, users.phone_number from service_request\n"
				+ "JOIN property ON property.property_id = service_request.property_id\n"
				+ "JOIN users ON users.user_id = service_request.user_id";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllServiceRequests);
		while (results.next()) {
			allServiceRequests.add(mapRowToServiceRequest(results));
		}
		return allServiceRequests;
	}

	private ServiceRequest mapRowToServiceRequest(SqlRowSet row) {
		ServiceRequest request = new ServiceRequest();
		Property property = new Property();
		User user = new User();
		request.setDescription(row.getString("description"));
		request.setRequestStatus(row.getString("request_status"));
		property.setPropertyName(row.getString("property_name"));
		user.setFirstName(row.getString("first_name"));
		user.setLastName(row.getString("last_name"));
		user.setEmailId(row.getString("email"));
		user.setPhoneNumber(row.getLong("phone_number"));
		request.setProperty(property);
		request.setUser(user);
		return request;

	}
}
