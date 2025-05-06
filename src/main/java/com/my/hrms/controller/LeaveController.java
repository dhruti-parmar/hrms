package com.my.hrms.controller;

import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.entity.LeaveType;
import com.my.hrms.service.EmployeeService;
import com.my.hrms.service.LeaveService;
import com.my.hrms.service.LeaveTypeService;
import com.my.hrms.service.LeaveBalanceService;

@Controller
@RequestMapping("/employee/leave")
public class LeaveController {

    @Autowired
    private LeaveService leaveService;
    
    @Autowired
    private EmployeeService employeeService;
    
    @Autowired
    private LeaveTypeService leaveTypeService;
    
    @Autowired
    private LeaveBalanceService leaveBalanceService;

    @GetMapping
    public String viewLeavePage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("leaveApplications", leaveService.getLeaveApplicationsByEmployee(employee));
        model.addAttribute("leaveTypes", leaveTypeService.getAllLeaveTypes());
        model.addAttribute("leaveBalance", leaveBalanceService.getEmployeeLeaveBalance(employee.getId()));
        return "employee/leave";
    }

    @PostMapping("/add")
    public String applyLeave(
            @RequestParam(value = "leaveType.id", required = true) Long leaveTypeId,
            @RequestParam("startDate") String startDateStr,
            @RequestParam("endDate") String endDateStr,
            @RequestParam(value = "isHalfDay", required = false, defaultValue = "false") boolean isHalfDay,
            @RequestParam("comment") String comment,
            Principal principal) {
        
        try {
            // Validate leave type
            LeaveType leaveType = leaveTypeService.getLeaveTypeById(leaveTypeId);
            if (leaveType == null) {
                throw new RuntimeException("Invalid leave type selected");
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date utilStartDate = sdf.parse(startDateStr);
            java.util.Date utilEndDate = sdf.parse(endDateStr);
            
            // Validate dates
            if (utilStartDate.after(utilEndDate)) {
                throw new RuntimeException("Start date cannot be after end date");
            }
            
            // Convert to java.sql.Date
            Date startDate = new Date(utilStartDate.getTime());
            Date endDate = new Date(utilEndDate.getTime());
            
            // Calculate days
            long diffInMillies = Math.abs(endDate.getTime() - startDate.getTime());
            int days = (int) (diffInMillies / (1000 * 60 * 60 * 24)) + 1;
            if (isHalfDay) {
                days = 1;
            }
            
            Employee employee = employeeService.getEmployeeByEmail(principal.getName());
            
            LeaveApplication leaveApplication = new LeaveApplication();
            leaveApplication.setEmployee(employee);
            leaveApplication.setLeaveType(leaveType);
            leaveApplication.setStartDate(startDate);
            leaveApplication.setEndDate(endDate);
            leaveApplication.setDays(days);
            leaveApplication.setIsHalfDay(isHalfDay);
            leaveApplication.setComment(comment);
            leaveApplication.setStatus("Pending");
            
            leaveService.applyLeave(leaveApplication);
            return "redirect:/employee/leave?success=true";
        } catch (Exception e) {
            return "redirect:/employee/leave?error=" + e.getMessage();
        }
    }

    @PostMapping("/cancel/{id}")
    public String cancelLeave(@PathVariable Long id, Principal principal) {
        try {
            Employee employee = employeeService.getEmployeeByEmail(principal.getName());
            leaveService.cancelLeave(id, employee.getId());
            return "redirect:/employee/leave?success=true";
        } catch (Exception e) {
            return "redirect:/employee/leave?error=" + e.getMessage();
        }
    }
}