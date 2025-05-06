package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.service.LeaveService;

@Controller
@RequestMapping("/admin/leaves")
public class AdminLeaveController {

    @Autowired
    private LeaveService leaveService;

    @GetMapping
    public String viewLeaveApplications(Model model) {
        model.addAttribute("leaveApplications", leaveService.getAllLeaves());
        return "admin/leaves";
    }

    @PostMapping("/approve/{id}")
    public String approveLeave(
            @PathVariable("id") Long id,
            @RequestParam(value = "comment", required = false) String comment) {
        try {
            leaveService.approveLeave(id, comment);
            return "redirect:/admin/leaves?success=true";
        } catch (Exception e) {
            return "redirect:/admin/leaves?error=" + e.getMessage();
        }
    }

    @PostMapping("/reject/{id}")
    public String rejectLeave(
            @PathVariable("id") Long id,
            @RequestParam(value = "comment", required = false) String comment) {
        try {
            leaveService.rejectLeave(id, comment);
            return "redirect:/admin/leaves?success=true";
        } catch (Exception e) {
            return "redirect:/admin/leaves?error=" + e.getMessage();
        }
    }
}