package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import com.nhattan.springmvc.demojpa.models.Category;

public interface CategoryService {
	List<Category> getAllCates();
	Optional<Category> getCateById(Integer id);

}
