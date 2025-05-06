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
import com.my.hrms.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/profile")
    public String viewProfile(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("employee", employee);
        return "employee/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@ModelAttribute Employee employee, Principal principal) {
        // Verify that the employee is updating their own profile
        Employee existingEmployee = employeeService.getEmployeeByEmail(principal.getName());
        if (!existingEmployee.getId().equals(employee.getId())) {
            throw new RuntimeException("Unauthorized profile update attempt");
        }
        
        employeeService.updateProfile(employee);
        return "redirect:/employee/profile?success=true";
    }
}
