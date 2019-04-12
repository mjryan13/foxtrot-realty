package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Application;

public interface ApplicationDAO {
	
	void saveApplication(Application application);
	
	List<Application> showApplications();
			

}
