package com.my.hrms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.my.hrms.entity.HelpDesk;

public interface HelpDeskRepository extends JpaRepository<HelpDesk, Long> {
}
