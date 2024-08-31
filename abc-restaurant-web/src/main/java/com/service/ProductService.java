package com.service;

import java.sql.SQLException;
import java.util.List;

import com.dao.ProductDAO;
import com.model.Product;



public class ProductService {

	 	private static ProductService instance;
	    private ProductDAO productDAO;

	    private ProductService() {
	        this.productDAO = new ProductDAO();
	    }

	    public static ProductService getInstance() {
	        if (instance == null) {
	            synchronized (ProductService.class) {
	                if (instance == null) {
	                    instance = new ProductService();
	                }
	            }
	        }
	        return instance;
	    }

	    public void addProduct(Product product) {
	        productDAO.addProduct(product);
	    }

	    public List<Product> getAllProducts() throws SQLException {
	        return productDAO.getAllProducts();
	    }
	}
