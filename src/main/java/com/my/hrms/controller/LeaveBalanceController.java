package com.my.hrms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.LeaveBalance;
import com.my.hrms.service.LeaveBalanceService;

@Controller
@RequestMapping("/leave/balance")
public class LeaveBalanceController {

    @Autowired
    private LeaveBalanceService leaveBalanceService;

    @GetMapping
    public List<LeaveBalance> getAllLeaveBalances() {
        return leaveBalanceService.getAllLeaveBalances();
    }

    @PutMapping
    public LeaveBalance updateLeaveBalance(@RequestBody LeaveBalance leaveBalance) {
        return leaveBalanceService.updateLeaveBalance(leaveBalance);
    }

    @GetMapping("/employee/{id}")
    public LeaveBalance getEmployeeLeaveBalance(@PathVariable Long id) {
        return leaveBalanceService.getEmployeeLeaveBalance(id);
    }
}
