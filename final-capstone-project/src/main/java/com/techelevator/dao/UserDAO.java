package com.techelevator.dao;

import com.techelevator.model.User;

public interface UserDAO {

	public void saveUser(User user);

	public boolean searchForUsernameAndPassword(String userName, String password);

	public void updatePassword(String userName, String password);

	public Object getUserByUserName(String userName);

}
