package com.nhattan.springmvc.demojpa.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhattan.springmvc.demojpa.models.Tag;
import com.nhattan.springmvc.demojpa.repositories.TagReposetory;

@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagReposetory tagReposetory;

	@Override
	public List<Tag> getAllTags() {
		return tagReposetory.findAll();
	}

	@Override
	public Optional<Tag> getTagById(int id) {
		return tagReposetory.findById(id);
	}

}
