//This class is used to create an object of a new task.
//Assigns values to a new task.
//Consists of setters and getters to set and receive Add object's values

package com.add;

public class Add {
	
	private String title;
	private String description;
	private String status;
	public static int id = 0;
	
	Add(String title, String description, String status) {
		this.title = title;
		this.description = description;
		this.status = status;
		id += 1;
	}
	
	public int getId() {
		return id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getDescription() {
		return description;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

}
