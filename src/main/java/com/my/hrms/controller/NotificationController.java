package com.my.hrms.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.Employee;
import com.my.hrms.service.EmployeeService;
import com.my.hrms.service.NotificationService;

@Controller
@RequestMapping("/employee")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;
    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/notifications")
    public String viewNotificationsPage(Model model, Principal principal) {
        Employee employee = employeeService.getEmployeeByEmail(principal.getName());
        model.addAttribute("notifications", notificationService.getNotificationsByEmployee(employee));
        return "employee/notifications";
    }
}
