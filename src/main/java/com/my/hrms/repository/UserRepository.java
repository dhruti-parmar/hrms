package com.my.hrms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.hrms.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {

    User findByEmail(String email);
    
}