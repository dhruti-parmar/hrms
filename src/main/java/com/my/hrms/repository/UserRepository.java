package com.my.hrms.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.my.hrms.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);
    
    @Query("SELECT u FROM User u WHERE LOWER(u.name) LIKE LOWER(CONCAT('%', :search, '%')) OR LOWER(u.email) LIKE LOWER(CONCAT('%', :search, '%'))")
    Page<User> findByNameContainingOrEmailContaining(@Param("search") String search, Pageable pageable);

}