package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.entity.LeaveBalance;
import com.my.hrms.repository.LeaveApplicationRepository;

@Service
public class LeaveService {

    @Autowired
    private LeaveApplicationRepository leaveApplicationRepository;
    @Autowired
    private LeaveBalanceService leaveBalanceService;

    public List<LeaveApplication> getAllLeaves() {
        return leaveApplicationRepository.findAll();
    }

    public List<LeaveApplication> getLeaveApplicationsByEmployee(Employee employee) {
        return leaveApplicationRepository.findByEmployeeId(employee.getId());
    }
    
    public LeaveApplication applyLeave(LeaveApplication leaveApplication) {
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

    public LeaveApplication approveLeave(Long id) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(id).orElseThrow();
        leaveApplication.setStatus("Approved");
        return leaveApplicationRepository.save(leaveApplication);
    }

    public LeaveApplication rejectLeave(Long id) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(id).orElseThrow();
        leaveApplication.setStatus("Rejected");
        return leaveApplicationRepository.save(leaveApplication);
    }
    
}
