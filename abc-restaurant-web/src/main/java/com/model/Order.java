package com.model;

import java.time.LocalDateTime;

public class Order {
	
	private int Id;
    private LocalDateTime date;
    private String item;
    private int	qty;
    private double price;
    private double total;
    private boolean pending;
    
    public Order (int id , LocalDateTime date, String item , int qty, double price , double total , boolean pending ) {
    	this.Id = id;
    	this.date = date;
        this.item = item;
        this.qty = qty;
        this.price = price;
        this.total = total;
        this.pending = pending;
    }
    public Order (int id , LocalDateTime date, String item , int qty, double price , double total  ) {
    	this.Id = id;
    	this.date = date;
        this.item = item;
        this.qty = qty;
        this.price = price;
        this.total = total;

    }
       
   
    public int getId() {
		return Id;
	}
    public void setId(int id) {
		this.Id = id;
	}
    
    public LocalDateTime getDate() {
		return date;
	}
    public void setDate(LocalDateTime date) {
		this.date = date;
	}
    
    public String getItem() {
		return item;
	}
    public void setItem(String item) {
		this.item = item;
	}
    
    
    public int getQty() {
		return qty;
	}
    public void setQty(int qty) {
		this.qty = qty;
	}
    
    
    public double getUnitPrice() {
		return price;
	}
    public void setUnitPice(double uprice) {
		this.price = uprice;
	}
    
    
    public double getTotal() {
		return total;
	}
    public void setTotal(double total) {
		this.total = total;
	}
    
    
    public boolean getPending() {
		return pending;
	}
    public void setPending(boolean pending) {
		this.pending = pending;
	}
    
    
}
