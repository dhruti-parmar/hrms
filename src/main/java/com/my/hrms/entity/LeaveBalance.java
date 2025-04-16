package com.my.hrms.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "leave_balances")
public class LeaveBalance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer plBalance;
    private Integer plYearlyLimit;
    private Integer slBalance;
    private Integer slYearlyLimit;
    private Integer lwpBalance;
    private Integer lwpYearlyLimit;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @Column(name = "created_by")
	private String createdBy;

    @Column(name = "updated_by")
    private String updatedBy;
    
    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;
}
