package com.model;
import java.sql.Date;
import java.time.LocalDateTime;

public class Table {	
	private int id;
    private String name;
    private String	mobile;
    private int person;
    private  String outlet;
    private String date;
    private String time;
    
    public Table ( String name, String mobile , int person, String outlet , String date, String time ) {
    	this.id = id;
    	this.name = name;
    	this.mobile = mobile;
        this.person = person;
        this.outlet = outlet;
        this.date = date;
        this.time = time;
    }
    public Table (int id , String name, String mobile , int person, String outlet , String date, String time ) {
    	this.id = id;
    	this.name = name;
    	 this.mobile = mobile;
        this.person = person;
        this.outlet = outlet;
        this.date = date;
        this.time = time;
    }
    public Table () {}
    
    
    public int getId() {
		return id;
	}
    public void setId(int id) {
		this.id = id;
	}    
    
    public String getName() {
 		return name;
 	}
     public void setName(String name) {
 		this.name = name;
 	}
     
     public String getMobile() {
  		return mobile;
  	}
      public void setMobile(String mobile) {
  		this.mobile = mobile;
  	}
          
    
    public int getPerson() {
		return person;
	}
    public void setPerson(int person) {
		this.person = person;
	}
    
    public String getOutlet() {
  		return outlet;
  	}
      public void setOutlet(String outlet) {
  		this.outlet = outlet;
  	}
      
      
      public String getDate() {
   		return date;
   	}
       public void setDate(String date) {
   		this.date = date;
   	}
    
	/*
	 * public LocalDateTime getDate() { return date; } public void
	 * setDate(LocalDateTime date) { this.date = date; }
	 */
     
     public String getTime() {
  		return time;
  	}
      public void setTime(String time) {
  		this.time = time;
  	}
}
