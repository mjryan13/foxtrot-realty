package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Property;
import com.techelevator.model.Rent;
import com.techelevator.model.User;

@Component
public class JDBCRentDAO implements RentDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCRentDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public void payRent(Rent rent) {
		// TODO Auto-generated method stub
		String sqlInsertPayment = "INSERT INTO payment(rent, property_id, user_id) VALUES (? ,?, ?)";
		jdbcTemplate.update(sqlInsertPayment, rent.getRent(), rent.getPropertyId(), rent.getUserId());

	}

	@Override
	public List<Rent> getAllRents() {
		// TODO Auto-generated method stub
		List<Rent> allRents = new ArrayList<>();
		String sqlSelectAllRents = "SELECT users.first_name, users.last_name, property.property_name, payment.rent, payment.property_id, payment.user_id\n"
				+ "FROM payment\n" + "JOIN property ON property.property_id = payment.property_id\n"
				+ "JOIN users ON users.user_id = payment.user_id";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSelectAllRents);
		while (results.next()) {
			allRents.add(mapRowToRent(results));
		}
		return allRents;

	}

	private Rent mapRowToRent(SqlRowSet row) {
		Rent rent = new Rent();
		Property property = new Property();
		User user = new User();
		rent.setPropertyId(row.getInt("property_id"));
		rent.setUserId(row.getInt("user_id"));
		rent.setRent(row.getDouble("rent"));
		property.setPropertyName(row.getString("property_name"));
		user.setFirstName(row.getString("first_name"));
		user.setLastName(row.getString("last_name"));
		rent.setProperty(property);
		rent.setUser(user);
		return rent;

	}

}
