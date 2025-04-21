package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Department;
import com.my.hrms.entity.User;
import com.my.hrms.repository.DepartmentRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Department> getAllDepartments() {
        return departmentRepository.findAll();
    }

    public Department createDepartment(Department department) {
        // Set timestamps
        department.setCreatedAt(LocalDateTime.now());
        department.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                department.setCreatedBy(String.valueOf(user.getId()));
                department.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                department.setCreatedBy("1");
                department.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            department.setCreatedBy("1");
            department.setUpdatedBy("1");
        }
        
        return departmentRepository.save(department);
    }

    public Department updateDepartment(Department department) {
        Department existingDepartment = departmentRepository.findById(department.getId())
            .orElseThrow(() -> new RuntimeException("Department not found with id: " + department.getId()));
        
        // Update only the name
        existingDepartment.setName(department.getName());
        
        // Update timestamp
        existingDepartment.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                existingDepartment.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                existingDepartment.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            existingDepartment.setUpdatedBy("1");
        }
        
        return departmentRepository.save(existingDepartment);
    }

    public void deleteDepartment(Long id) {
        if (!departmentRepository.existsById(id)) {
            throw new RuntimeException("Department not found with id: " + id);
        }
        departmentRepository.deleteById(id);
    }
}