package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Designation;
import com.my.hrms.entity.User;
import com.my.hrms.repository.DesignationRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class DesignationService {

    @Autowired
    private DesignationRepository designationRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<Designation> getAllDesignations() {
        return designationRepository.findAll();
    }

    public Designation createDesignation(Designation designation) {
        // Set timestamps
        designation.setCreatedAt(LocalDateTime.now());
        designation.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                designation.setCreatedBy(String.valueOf(user.getId()));
                designation.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                designation.setCreatedBy("1");
                designation.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            designation.setCreatedBy("1");
            designation.setUpdatedBy("1");
        }
        
        return designationRepository.save(designation);
    }

    public Designation updateDesignation(Designation designation) {
        Designation existingDesignation = designationRepository.findById(designation.getId())
            .orElseThrow(() -> new RuntimeException("Designation not found with id: " + designation.getId()));
        
        // Update only the name
        existingDesignation.setName(designation.getName());
        
        // Update timestamp
        existingDesignation.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                existingDesignation.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                existingDesignation.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            existingDesignation.setUpdatedBy("1");
        }
        
        return designationRepository.save(existingDesignation);
    }

    public void deleteDesignation(Long id) {
        if (!designationRepository.existsById(id)) {
            throw new RuntimeException("Designation not found with id: " + id);
        }
        designationRepository.deleteById(id);
    }
}