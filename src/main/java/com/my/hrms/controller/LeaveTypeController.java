package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.LeaveType;
import com.my.hrms.service.LeaveTypeService;

@Controller
@RequestMapping("/admin/leave-types")
public class LeaveTypeController {

    @Autowired
    private LeaveTypeService leaveTypeService;

    @GetMapping("/")
    public String viewLeaveTypesPage(Model model) {
        model.addAttribute("leaveTypes", leaveTypeService.getAllLeaveTypes());
        return "admin/leave-types";
    }

    @GetMapping("/create-leave-type")
    public String createLeaveTypePage(Model model) {
        model.addAttribute("leaveType", new LeaveType());
        return "admin/create-leave-type";
    }

    @PostMapping("/create-leave-type")
    public String createLeaveType(@ModelAttribute LeaveType leaveType) {
        leaveTypeService.createLeaveType(leaveType);
        return "redirect:/admin/leave-types";
    }

    @GetMapping("/delete-leave-type/{id}")
    public String deleteLeaveType(@PathVariable Long id) {
        leaveTypeService.deleteLeaveType(id);
        return "redirect:/admin/leave-types";
    }
}
