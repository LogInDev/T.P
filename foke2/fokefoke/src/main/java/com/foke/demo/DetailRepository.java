package com.foke.demo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.foke.demo.dto.DetailDTO;

public interface DetailRepository extends JpaRepository<DetailDTO, Integer> {

	DetailDTO findByMemberIdAndProductName(String memberId, String productName);

	
}
