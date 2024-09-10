package com.model;

import java.util.Base64;

public class Item {
	
	private int Id;
	private String Name;
	private String description;
	private double price;
	private byte[] image;
	private String category;
	
	public Item(int Id, String name, String description, double price,  byte[] image , String category ) {
		
		this.Id = Id;
		this.Name = name;
		this.description = description;
		this.price = price;
		this.image =image;
		this.category =category;
	}
	
	public Item(String name, String description, double price,  byte[] image , String category ) {
		
		this.Name = name;
		this.description = description;
		this.price = price;
		this.image =image;
		this.category =category;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	        return Base64.getEncoder().encodeToString(this.image);
	    }

}