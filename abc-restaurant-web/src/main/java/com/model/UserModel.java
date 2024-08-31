package com.model;

public class UserModel {
	
	private int Id;
    private String username;
    private String password;
    private String usertype;
    
    public UserModel(int id , String username, String password , String usertype) {
    	this.Id = id;
    	this.username = username;
        this.password = password;
        this.usertype = usertype;
    }
    
	/*
	 * public UserModel(String username, String password , String usertype) {
	 * this.username = username; this.password = password; this.usertype = usertype;
	 * }
	 * 
	 * public UserModel(String username, String password) { this.username =
	 * username; this.password = password; }
	 */
    
    public UserModel() {		
	}
    
    public int getId() {
		return Id;
	}
	public void setId(int id) {
		this.Id = id;
	}
	
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String username) {
		this.username = username;
	}
	
	
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUserType() {
		return usertype;
	}
	public void setUserType(String usertype) {
		this.usertype = usertype;
	}
	
}
