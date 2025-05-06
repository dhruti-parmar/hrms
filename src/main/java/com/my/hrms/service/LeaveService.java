package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.entity.LeaveBalance;
import com.my.hrms.entity.User;
import com.my.hrms.repository.LeaveApplicationRepository;
import com.my.hrms.repository.UserRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveApplicationRepository leaveApplicationRepository;
    @Autowired
    private LeaveBalanceService leaveBalanceService;
    @Autowired
    private UserRepository userRepository;

    public List<LeaveApplication> getAllLeaves() {
        return leaveApplicationRepository.findAll();
    }

    public List<LeaveApplication> getLeaveApplicationsByEmployee(Employee employee) {
        return leaveApplicationRepository.findByEmployeeId(employee.getId());
    }
    
    public LeaveApplication applyLeave(LeaveApplication leaveApplication) {
        // Set timestamps and user tracking
        leaveApplication.setCreatedAt(LocalDateTime.now());
        leaveApplication.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                leaveApplication.setCreatedBy(String.valueOf(user.getId()));
                leaveApplication.setUpdatedBy(String.valueOf(user.getId()));
            }
        }
        
        LeaveBalance leaveBalance = leaveBalanceService.getEmployeeLeaveBalance(leaveApplication.getEmployee().getId());
        
        if (leaveApplication.getLeaveType().getType().equals("PL")) {
            if (leaveBalance.getPlBalance() >= leaveApplication.getDays()) {
                leaveBalance.setPlBalance(leaveBalance.getPlBalance() - leaveApplication.getDays());
                leaveBalanceService.updateLeaveBalance(leaveBalance);
            } else {
                throw new RuntimeException("Insufficient PL balance");
            }
        } else if (leaveApplication.getLeaveType().getType().equals("SL")) {
            if (leaveBalance.getSlBalance() >= leaveApplication.getDays()) {
                leaveBalance.setSlBalance(leaveBalance.getSlBalance() - leaveApplication.getDays());
                leaveBalanceService.updateLeaveBalance(leaveBalance);
            } else {
                throw new RuntimeException("Insufficient SL balance");
            }
        } else {
            if (leaveBalance.getLwpBalance() >= leaveApplication.getDays()) {
                leaveBalance.setLwpBalance(leaveBalance.getLwpBalance() - leaveApplication.getDays());
                leaveBalanceService.updateLeaveBalance(leaveBalance);
            } else {
                throw new RuntimeException("Insufficient LWP balance");
            }
        }

        return leaveApplicationRepository.save(leaveApplication);
    }

    public LeaveApplication approveLeave(Long id, String comment) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(id).orElseThrow();
        leaveApplication.setStatus("Approved");
        if (comment != null && !comment.isEmpty()) {
            leaveApplication.setComment(comment);
        }
        return leaveApplicationRepository.save(leaveApplication);
    }

    public LeaveApplication rejectLeave(Long id, String comment) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(id).orElseThrow();
        leaveApplication.setStatus("Rejected");
        if (comment != null && !comment.isEmpty()) {
            leaveApplication.setComment(comment);
        }
        
        // Return the leave balance if the leave is rejected
        LeaveBalance leaveBalance = leaveBalanceService.getEmployeeLeaveBalance(leaveApplication.getEmployee().getId());
        if (leaveApplication.getLeaveType().getType().equals("PL")) {
            leaveBalance.setPlBalance(leaveBalance.getPlBalance() + leaveApplication.getDays());
        } else if (leaveApplication.getLeaveType().getType().equals("SL")) {
            leaveBalance.setSlBalance(leaveBalance.getSlBalance() + leaveApplication.getDays());
        } else {
            leaveBalance.setLwpBalance(leaveBalance.getLwpBalance() + leaveApplication.getDays());
        }
        leaveBalanceService.updateLeaveBalance(leaveBalance);
        
        return leaveApplicationRepository.save(leaveApplication);
    }

    public LeaveApplication cancelLeave(Long leaveId, Long employeeId) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(leaveId)
            .orElseThrow(() -> new RuntimeException("Leave application not found"));
            
        // Verify that the leave belongs to the employee
        if (!leaveApplication.getEmployee().getId().equals(employeeId)) {
            throw new RuntimeException("You can only cancel your own leave applications");
        }
        
        // Only allow cancellation of pending leaves
        if (!"Pending".equals(leaveApplication.getStatus())) {
            throw new RuntimeException("Only pending leaves can be cancelled");
        }
        
        // Return the leave balance
        LeaveBalance leaveBalance = leaveBalanceService.getEmployeeLeaveBalance(employeeId);
        if (leaveApplication.getLeaveType().getType().equals("PL")) {
            leaveBalance.setPlBalance(leaveBalance.getPlBalance() + leaveApplication.getDays());
        } else if (leaveApplication.getLeaveType().getType().equals("SL")) {
            leaveBalance.setSlBalance(leaveBalance.getSlBalance() + leaveApplication.getDays());
        } else {
            leaveBalance.setLwpBalance(leaveBalance.getLwpBalance() + leaveApplication.getDays());
        }
        leaveBalanceService.updateLeaveBalance(leaveBalance);
        
        // Update leave application
        leaveApplication.setStatus("Cancelled");
        leaveApplication.setUpdatedAt(LocalDateTime.now());
        
        // Get current user ID from SecurityContext
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated()) {
            String username = authentication.getName();
            User user = userRepository.findByEmail(username);
            if (user != null) {
                leaveApplication.setUpdatedBy(String.valueOf(user.getId()));
            }
        }
        
        return leaveApplicationRepository.save(leaveApplication);
    }
    
}