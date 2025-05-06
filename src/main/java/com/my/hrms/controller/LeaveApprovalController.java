package com.my.hrms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.service.LeaveApprovalService;
import com.my.hrms.service.LeaveService;

@Controller
@RequestMapping("/admin/leave")
public class LeaveApprovalController {

    @Autowired
    private LeaveService leaveService;
    
    @Autowired
    private LeaveApprovalService leaveApprovalService;

    @GetMapping("/approvals")
    public String viewLeaveApprovals(Model model) {
        List<LeaveApplication> pendingLeaves = leaveService.getAllLeaves();
        model.addAttribute("leaveApplications", pendingLeaves);
        return "admin/leave-approvals";
    }

    @PutMapping("/approve/{id}")
    public String approveLeave(@PathVariable Long id, @RequestParam String comment) {
        leaveApprovalService.approveLeave(id, comment);
        return "redirect:/admin/leave/approvals";
    }

    @PutMapping("/reject/{id}")
    public String rejectLeave(@PathVariable Long id, @RequestParam String comment) {
        leaveApprovalService.rejectLeave(id, comment);
        return "redirect:/admin/leave/approvals";
    }
}