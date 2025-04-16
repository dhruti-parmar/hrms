package com.my.hrms.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.service.EmployeeService;
import com.my.hrms.service.LeaveService;

@Controller
@RequestMapping("/employee/leave")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;
    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String viewLeavePage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("leaveApplications",leaveService.getLeaveApplicationsByEmployee(employee));
        return "employee/leave";
    }

    @PostMapping("/add")
    public String applyLeave(@ModelAttribute LeaveApplication leaveApplication, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        leaveApplication.setEmployee(employee);
        leaveService.applyLeave(leaveApplication);
        return "redirect:/employee/leave";
    }
}
