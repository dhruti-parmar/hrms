package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.LeaveBalance;
import com.my.hrms.repository.LeaveBalanceRepository;

@Service
public class LeaveBalanceService {

    @Autowired
    private LeaveBalanceRepository leaveBalanceRepository;

    public List<LeaveBalance> getAllLeaveBalances() {
        return leaveBalanceRepository.findAll();
    }

    public LeaveBalance updateLeaveBalance(LeaveBalance leaveBalance) {
        return leaveBalanceRepository.save(leaveBalance);
    }

    public LeaveBalance getEmployeeLeaveBalance(Long employeeId) {
        return leaveBalanceRepository.findByEmployeeId(employeeId);
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
