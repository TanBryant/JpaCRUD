package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhattan.springmvc.demojpa.models.Category;
import com.nhattan.springmvc.demojpa.repositories.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService{

	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Override
	public List<Category> getAllCates() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}

	@Override
	public Optional<Category> getCateById(Integer id) {
		// TODO Auto-generated method stub
		return categoryRepository.findById(id);
	}
	
	
}
