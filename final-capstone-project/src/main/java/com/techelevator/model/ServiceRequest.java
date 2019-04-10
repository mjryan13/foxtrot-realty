package com.techelevator.model;

public class ServiceRequest {

	private int propertyId;
	private String description;
	private String requestStatus;
	private int userId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(int propertyId) {
		this.propertyId = propertyId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRequest_status() {
		return requestStatus;
	}

	public void setRequest_status(String requestStatus) {
		this.requestStatus = requestStatus;
	}

}
