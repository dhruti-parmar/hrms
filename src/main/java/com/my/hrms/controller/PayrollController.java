package com.my.hrms.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.entity.Employee;
import com.my.hrms.service.EmployeeService;
import com.my.hrms.service.PayrollService;

@Controller
@RequestMapping("/employee/payroll")
public class PayrollController {

    @Autowired
    private PayrollService payrollService;
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/payroll")
    public String viewPayrollPage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("paySlips", payrollService.getPaySlipsByEmployee(employee));
        return "employee/payroll";
    }

    @PostMapping("/generate-payroll")
    public String generatePayroll(@RequestParam("month") String month, @RequestParam("year") int year, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        payrollService.generatePaySlip(employee, month, year);
        return "redirect:/employee/payroll";
    }
}
