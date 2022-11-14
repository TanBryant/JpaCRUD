package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import com.nhattan.springmvc.demojpa.models.Tag;

public interface TagService {

	List<Tag> getAllTags();
	
	Optional<Tag> getTagById(int id);
}
