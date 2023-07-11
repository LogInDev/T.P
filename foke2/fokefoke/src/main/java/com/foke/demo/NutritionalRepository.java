package com.foke.demo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.foke.demo.dto.NutritionalDTO;

public interface NutritionalRepository extends JpaRepository<NutritionalDTO, Integer>{
	NutritionalDTO findByProductName(String productName);
}
