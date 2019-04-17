package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.ServiceRequest;

public interface ServiceRequestDAO {
	
	void createServiceRequest(ServiceRequest request);
	
	List<ServiceRequest> showAllPendingServiceRequests();
	
	List<ServiceRequest> showAllCompletedServiceRequests();
	
	void completeServiceRequest(ServiceRequest request);
	

}
