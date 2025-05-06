package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.LeaveType;
import com.my.hrms.entity.User;
import com.my.hrms.repository.LeaveTypeRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class LeaveTypeService {

    @Autowired
    private LeaveTypeRepository leavetypeRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<LeaveType> getAllLeaveTypes() {
        return leavetypeRepository.findAll();
    }
    
    public LeaveType getLeaveTypeById(Long id) {
    	return leavetypeRepository.findById(id).orElse(null);
    }

    public LeaveType createLeaveType(LeaveType leavetype) {
        // Set timestamps
    	leavetype.setCreatedAt(LocalDateTime.now());
    	leavetype.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                leavetype.setCreatedBy(String.valueOf(user.getId()));
                leavetype.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                leavetype.setCreatedBy("1");
                leavetype.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            leavetype.setCreatedBy("1");
            leavetype.setUpdatedBy("1");
        }
        
        return leavetypeRepository.save(leavetype);
    }

    public LeaveType updateLeaveType(LeaveType leavetype) {
    	LeaveType existingleavetype = leavetypeRepository.findById(leavetype.getId())
            .orElseThrow(() -> new RuntimeException("leavetype not found with id: " + leavetype.getId()));
        
        // Update only the name
        existingleavetype.setType(leavetype.getType());
        existingleavetype.setDescription(leavetype.getDescription());
        
        // Update timestamp
        existingleavetype.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                existingleavetype.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                existingleavetype.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            existingleavetype.setUpdatedBy("1");
        }
        
        return leavetypeRepository.save(existingleavetype);
    }

    public void deleteLeaveType(Long id) {
        if (!leavetypeRepository.existsById(id)) {
            throw new RuntimeException("leavetype not found with id: " + id);
        }
        leavetypeRepository.deleteById(id);
    }
}