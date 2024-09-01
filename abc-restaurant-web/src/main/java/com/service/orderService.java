package com.service;

import java.sql.SQLException;
import java.util.List;

import com.dao.OrderDao;
import com.model.Order;



public class orderService {

	 	private static orderService instance;
	    private OrderDao orderDao;

	    private orderService() {
	        this.orderDao = new OrderDao();
	    }

	    public static orderService getInstance() {
	        if (instance == null) {
	            synchronized (orderService.class) {
	                if (instance == null) {
	                    instance = new orderService();
	                }
	            }
	        }
	        return instance;
	    }

	    public List<Order> getPendingOrder() throws SQLException {
	        return orderDao.getPendingOrder();
	    }
	    public List<Order> getallOrder() throws SQLException {
	        return orderDao.getallOrder();
	    }
	    public void orderComplete(int Id) {
	    	orderDao.orderComplete(Id); }
}