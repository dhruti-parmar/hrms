package com.my.hrms.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.entity.Awards;
import com.my.hrms.entity.Employee;
import com.my.hrms.service.AwardsService;
import com.my.hrms.service.EmployeeService;

@Controller
@RequestMapping("/admin")
public class AwardsController {

    @Autowired
    private AwardsService awardsService;
    
    @Autowired
    private EmployeeService employeeService;

    // Admin endpoints
    @GetMapping("/awards")
    public String viewAdminAwardsPage(Model model) {
        model.addAttribute("awards", awardsService.getAllAwards());
        model.addAttribute("employees", employeeService.getAllEmployees());
        model.addAttribute("newAward", new Awards());
        return "admin/awards";
    }

    @PostMapping("/awards/create")
    public String createAward(@ModelAttribute Awards award, @RequestParam Long employeeId, Principal principal) {
        Employee employee = employeeService.getEmployee(employeeId);
        awardsService.createAwardForEmployee(award, employee, principal.getName());
        return "redirect:/admin/awards";
    }

    @GetMapping("/awards/delete/{id}")
    public String deleteAward(@PathVariable Long id) {
        awardsService.deleteAwards(id);
        return "redirect:/admin/awards";
    }

    // Employee endpoints
    @GetMapping("/employee/awards")
    public String viewEmployeeAwardsPage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("awards", awardsService.getAwardsByEmployee(employee));
        return "employee/awards";
    }
}