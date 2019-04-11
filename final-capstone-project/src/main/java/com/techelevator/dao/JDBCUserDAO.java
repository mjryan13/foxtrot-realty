package com.techelevator.dao;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;
import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAO implements UserDAO {

	private JdbcTemplate jdbcTemplate;
	private PasswordHasher hashMaster;

	@Autowired
	public JDBCUserDAO(DataSource dataSource, PasswordHasher hashMaster) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
		this.hashMaster = hashMaster;
	}
	
	@Override
	public void saveUser(User user) {
		byte[] salt = hashMaster.generateRandomSalt();
		String hashedPassword = hashMaster.computeHash(user.getPassword(), salt);
		String saltString = new String(Base64.encode(salt));
//		user.setUserID(getNextUserId());
		jdbcTemplate.update("INSERT INTO users(first_name, last_name, user_name, password, role, phone_number, email, salt) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
				user.getFirstName(), user.getLastName(), user.getUserName(), hashedPassword, user.getRole(), user.getPhoneNumber(), user.getEmailId(), saltString);
	}

	@Override
	public boolean searchForUsernameAndPassword(String userName, String password) {
		String sqlSearchForUser = "SELECT * "+
							      "FROM users "+
							      "WHERE UPPER(user_name) = ? ";
		System.out.println(userName + " "+password);
		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUser, userName.toUpperCase());
		if(user.next()) {
			String dbSalt = user.getString("salt");
			String dbHashedPassword = user.getString("password");
			System.out.println(dbHashedPassword);
			String givenPassword = hashMaster.computeHash(password, Base64.decode(dbSalt));
			System.out.println(givenPassword);
			return dbHashedPassword.equals(givenPassword);
		} else {
			return false;
		}
	}

	@Override
	public void updatePassword(String userName, String password) {
		jdbcTemplate.update("UPDATE app_user SET password = ? WHERE user_name = ?", password, userName);
	}

	@Override
	public User getUserByUserName(String userName) {
		String sqlSearchForUsername ="SELECT * "+
		"FROM users "+
		"WHERE UPPER(user_name) = ? ";

		SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase()); 
		User thisUser = null;
		if(user.next()) {
			thisUser = new User();
			thisUser.setUserName(user.getString("user_name"));
			thisUser.setPassword(user.getString("password"));
		}

		return thisUser;
	}
	
//	private int getNextUserId() {
//		SqlRowSet nextIdResult = jdbcTemplate.queryForRowSet("SELECT nextval('seq_user_id')");
//		if(nextIdResult.next()) {
//			return nextIdResult.getInt(1);
//		} else {
//			throw new RuntimeException("Something went wrong while getting an id for the new city");
//		}
//	}


}
