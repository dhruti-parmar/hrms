package com.my.hrms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.hrms.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);
}