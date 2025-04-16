package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.service.LeaveApprovalService;

@Controller
@RequestMapping("/leave/approval")
public class LeaveApprovalController {

    @Autowired
    private LeaveApprovalService leaveApprovalService;

    @PutMapping("/approve/{id}")
    public LeaveApplication approveLeave(@PathVariable Long id, @RequestParam String approverComment) {
        return leaveApprovalService.approveLeave(id, approverComment);
    }

    @PutMapping("/reject/{id}")
    public LeaveApplication rejectLeave(@PathVariable Long id, @RequestParam String rejectionComment) {
        return leaveApprovalService.rejectLeave(id, rejectionComment);
    }
}
