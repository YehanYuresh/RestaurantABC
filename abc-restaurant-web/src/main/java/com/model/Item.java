package com.model;

import java.util.Base64;

public class Item {
	
	private int Id;
	private String Name;
	private String description;
	private double price;
	private byte[] image;
	
	public Item(int Id, String name, String description, double price,  byte[] image ) {
		
		this.Id = Id;
		this.Name = name;
		this.description = description;
		this.price = price;
		this.image =image;
	}
	
	public Item(String name, String description, double price,  byte[] image ) {
		
		this.Name = name;
		this.description = description;
		this.price = price;
		this.image =image;
	}


	public Item() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return Id;
	}
	public void setId(int Id) {
		this.Id = Id;
	}


	public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}


	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}


	public double getPrice() {
		return price;
	}
	public void setPrice(double price) 	{
		this.price = price;
	}


	public byte[] getImage() {
		return image;
	}
	public void setImage( byte[] image) 	{
		this.image = image;
	}
	   public String getImageBase64() {
	        if (this.image != null) {
	            return Base64.getEncoder().encodeToString(this.image);  // Converts byte[] to Base64
	        }
	        return null; // Handle case where image is not set
	    }

}