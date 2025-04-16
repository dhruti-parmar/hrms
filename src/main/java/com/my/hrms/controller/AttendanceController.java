package com.my.hrms.controller;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.hrms.entity.Attendance;
import com.my.hrms.entity.Employee;
import com.my.hrms.service.AttendanceService;
import com.my.hrms.service.EmployeeService;

@Controller
@RequestMapping("/employee/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;
    @Autowired
    private EmployeeService employeeService;

    @GetMapping
    public String viewAttendancePage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("attendanceRecords", attendanceService.getAttendanceRecordsByEmployee(employee));
        return "employee/attendance";
    }

    @PostMapping("/mark-attendance")
    public String markAttendance(@RequestParam("date") Date date, @RequestParam("present") boolean present, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        Attendance attendance = new Attendance();
        attendance.setDate(date);
        attendance.setPresent(present);
        attendance.setEmployee(employee);
        attendanceService.markAttendance(attendance);
        return "redirect:/employee/attendance";
    }
}