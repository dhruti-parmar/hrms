package com.my.hrms.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.my.hrms.entity.Awards;
import com.my.hrms.entity.Employee;

@Repository
public interface AwardsRepository extends JpaRepository<Awards, Long> {
    Optional<Awards> findByName(String name);

	List<Awards> findByEmployee(Employee employee);
}
