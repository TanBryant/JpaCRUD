package com.nhattan.springmvc.demojpa.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.nhattan.springmvc.demojpa.models.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{

}
