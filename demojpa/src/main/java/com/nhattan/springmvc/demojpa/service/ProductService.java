package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import com.nhattan.springmvc.demojpa.models.Product;


public interface ProductService {
	List<Product> getAllProducts();

	Optional<Product> getProductById(int id);

	void saveProduct(Product product);

	void removeProduct(int id);
}
