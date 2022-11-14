package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhattan.springmvc.demojpa.models.Product;
import com.nhattan.springmvc.demojpa.repositories.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;

	@Override
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Optional<Product> getProductById(int id) {
		return productRepository.findById(id);
	}

	@Override
	public void saveProduct(Product product) {
		productRepository.save(product);

	}

	@Override
	public void removeProduct(int id) {
		productRepository.deleteById(id);
	}

}
