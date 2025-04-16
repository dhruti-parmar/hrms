package com.my.hrms.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.my.hrms.entity.Awards;

@Repository
public interface AwardsRepository extends JpaRepository<Awards, Long> {
    Optional<Awards> findByName(String name);
}
