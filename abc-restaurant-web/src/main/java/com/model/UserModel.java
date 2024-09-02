package com.model;

public class UserModel {
	
	private int Id;
    private String username;
    private String password;
    private String usertype;
    private Boolean delete;
    private int	mobile;
    
    public UserModel(int id , String username, String password , String usertype, Boolean delete , int mobile) {
    	this.Id = id;
    	this.username = username;
        this.password = password;
        this.usertype = usertype;
        this.delete = delete;
        this.mobile = mobile;
    }
    public UserModel(int id , String username, String password , String usertype, int mobile) {
    	this.Id = id;
    	this.username = username;
        this.password = password;
        this.usertype = usertype;
        this.mobile = mobile;
    }
    public UserModel(int id , String username, String password , String usertype) {
    	this.Id = id;
    	this.username = username;
        this.password = password;
        this.usertype = usertype;
 
    }
       
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
	
	
	public Boolean getDelete() {
		return delete;
	}
	public void setDelete(Boolean delete) {
		this.delete = delete;
	}
	
	  public int getMobile() {
			return mobile;
		}
		public void setMobile(int mobile) {
			this.mobile = mobile;
		}
}
