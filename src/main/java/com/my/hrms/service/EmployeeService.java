package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.User;
import com.my.hrms.repository.EmployeeRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private LeaveBalanceService leaveBalanceService;

    public List<Employee> getAllEmployees() {
        return employeeRepository.findAll();
    }

    public Employee getEmployee(Long id) {
        return employeeRepository.findById(id).orElseThrow();
    }

    public Employee getEmployeeByEmail(String email) {
        return employeeRepository.findByEmail(email).orElseThrow();
    }

    public Employee createEmployee(Employee employee) {
        // Set timestamps
        employee.setCreatedAt(LocalDateTime.now());
        employee.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                employee.setCreatedBy(String.valueOf(user.getId()));
                employee.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                employee.setCreatedBy("1");
                employee.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            employee.setCreatedBy("1");
            employee.setUpdatedBy("1");
        }
        
        // Save the employee
        Employee savedEmployee = employeeRepository.save(employee);
        
        // Create default leave balance for the new employee using LeaveBalanceService
        leaveBalanceService.createDefaultLeaveBalance(savedEmployee);
        
        return savedEmployee;
    }

    public Employee updateEmployee(Employee employee) {
        Employee existingEmployee = employeeRepository.findById(employee.getId())
            .orElseThrow(() -> new RuntimeException("Employee not found with id: " + employee.getId()));
        
        // Update employee details
        existingEmployee.setName(employee.getName());
        existingEmployee.setEmail(employee.getEmail());
        existingEmployee.setRole(employee.getRole());
        existingEmployee.setDepartment(employee.getDepartment());
        existingEmployee.setDesignation(employee.getDesignation());
        
        // Update timestamp
        existingEmployee.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                existingEmployee.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                existingEmployee.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            existingEmployee.setUpdatedBy("1");
        }
        
        return employeeRepository.save(existingEmployee);
    }

    public void deleteEmployee(Long id) {
        if (!employeeRepository.existsById(id)) {
            throw new RuntimeException("Employee not found with id: " + id);
        }
        employeeRepository.deleteById(id);
    }

    public Employee getProfile(Long id) {
        return employeeRepository.findById(id).orElseThrow();
    }

    public Employee updateProfile(Employee employee) {
        Employee existingEmployee = employeeRepository.findById(employee.getId()).orElseThrow();
        
        // Only allow updating specific fields
        existingEmployee.setPhone(employee.getPhone());
        existingEmployee.setAddress(employee.getAddress());
//        existingEmployee.setLinkedinUrl(employee.getLinkedinUrl());
        existingEmployee.setAboutMe(employee.getAboutMe());
        existingEmployee.setDegree(employee.getDegree());
        existingEmployee.setSpecialization(employee.getSpecialization());
        existingEmployee.setSkills(employee.getSkills());
        
        // Update timestamp and updated by
        existingEmployee.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                existingEmployee.setUpdatedBy(String.valueOf(user.getId()));
            }
        }
        
        return employeeRepository.save(existingEmployee);
    }
}