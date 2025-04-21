package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveBalance;
import com.my.hrms.entity.User;
import com.my.hrms.repository.LeaveBalanceRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class LeaveBalanceService {

    @Autowired
    private LeaveBalanceRepository leaveBalanceRepository;
    
    @Autowired
    private UserRepository userRepository;

    public List<LeaveBalance> getAllLeaveBalances() {
        return leaveBalanceRepository.findAll();
    }

    public LeaveBalance updateLeaveBalance(LeaveBalance leaveBalance) {
        return leaveBalanceRepository.save(leaveBalance);
    }

    public LeaveBalance getEmployeeLeaveBalance(Long employeeId) {
        return leaveBalanceRepository.findByEmployeeId(employeeId);
    }
    
    public void createDefaultLeaveBalance(Employee employee) {
        LeaveBalance leaveBalance = new LeaveBalance();
        leaveBalance.setEmployee(employee);
        leaveBalance.setPlBalance(10);
        leaveBalance.setPlYearlyLimit(10);
        leaveBalance.setSlBalance(10);
        leaveBalance.setSlYearlyLimit(10);
        leaveBalance.setLwpBalance(10);
        leaveBalance.setLwpYearlyLimit(10);
        
        // Set timestamps
        leaveBalance.setCreatedAt(LocalDateTime.now());
        leaveBalance.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                leaveBalance.setCreatedBy(String.valueOf(user.getId()));
                leaveBalance.setUpdatedBy(String.valueOf(user.getId()));
            } else {
                // Default to admin user ID ("1") if user not found
                leaveBalance.setCreatedBy("1");
                leaveBalance.setUpdatedBy("1");
            }
        } else {
            // Default to admin user ID ("1") if not authenticated
            leaveBalance.setCreatedBy("1");
            leaveBalance.setUpdatedBy("1");
        }
        
        leaveBalanceRepository.save(leaveBalance);
    }
    
    //@Scheduled(cron = "0 0 0 1 1 *") // Run on January 1st every year
    public void resetLeaveBalances() {
        List<LeaveBalance> leaveBalances = leaveBalanceRepository.findAll();
        for (LeaveBalance leaveBalance : leaveBalances) {
            leaveBalance.setPlBalance(leaveBalance.getPlYearlyLimit());
            leaveBalance.setSlBalance(leaveBalance.getSlYearlyLimit());
            leaveBalance.setLwpBalance(leaveBalance.getLwpYearlyLimit());
            leaveBalanceRepository.save(leaveBalance);
        }
    }
}