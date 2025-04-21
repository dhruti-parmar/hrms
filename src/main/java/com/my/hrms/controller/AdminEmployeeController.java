package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.Employee;
import com.my.hrms.service.DepartmentService;
import com.my.hrms.service.DesignationService;
import com.my.hrms.service.EmployeeService;
import com.my.hrms.service.RoleService;
import com.my.hrms.service.UserService;

@Controller
@RequestMapping("/admin/employees")
public class AdminEmployeeController {

    @Autowired
    private EmployeeService employeeService;
    
    @Autowired
    private DepartmentService departmentService;
    
    @Autowired
    private DesignationService designationService;
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private RoleService roleService;

    @GetMapping
    public String viewEmployeesPage(Model model) {
        model.addAttribute("employees", employeeService.getAllEmployees());
        model.addAttribute("departments", departmentService.getAllDepartments());
        model.addAttribute("designations", designationService.getAllDesignations());
        model.addAttribute("users",userService.findUsersWithRoleUser());
        return "admin/employees";
    }

    @GetMapping("/create-employee")
    public String createEmployeePage(Model model) {
        model.addAttribute("employee", new Employee());
        model.addAttribute("departments", departmentService.getAllDepartments());
        model.addAttribute("designations", designationService.getAllDesignations());
        model.addAttribute("users",userService.findUsersWithRoleUser());
        return "admin/create-employee";
    }

    @PostMapping("/create-employee")
    public String createEmployee(@ModelAttribute Employee employee) {
    	employee.setRole("ROLE_USER");
        employeeService.createEmployee(employee);
        return "redirect:/admin/employees";
    }
    
    @PostMapping("/update-employee")
    public String updateEmployee(@ModelAttribute Employee employee) {
        employeeService.updateEmployee(employee);
        return "redirect:/admin/employees";
    }
    
    @GetMapping("/delete-employee/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        employeeService.deleteEmployee(id);
        return "redirect:/admin/employees";
    }
}