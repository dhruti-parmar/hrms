package com.my.hrms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.entity.PaySlip;
import com.my.hrms.repository.EmployeeRepository;
import com.my.hrms.repository.LeaveApplicationRepository;
import com.my.hrms.repository.PaySlipRepository;

@Service
public class PayrollService {

    @Autowired
    private PaySlipRepository paySlipRepository;
    @Autowired
    private LeaveApplicationRepository leaveApplicationRepository;
    @Autowired
    private EmployeeRepository employeeRepository;

    public List<PaySlip> generatePaySlips() {
        List<PaySlip> paySlips = new ArrayList<>();
        
        List<Employee> employees = employeeRepository.findAll();
        for (Employee employee : employees) {
            PaySlip paySlip = new PaySlip();
            paySlip.setEmployee(employee);
            paySlip.setSalary(50000.0); // Fixed salary for example
            
            // Calculate deductions based on leave taken
            List<LeaveApplication> leaveApplications = leaveApplicationRepository.findByEmployeeId(employee.getId());
            Double deduction = 0.0;
            for (LeaveApplication leaveApplication : leaveApplications) {
                if (leaveApplication.getStatus().equals("Approved")) {
                    deduction += leaveApplication.getDays() * 1000.0; // Assume $1000 per day deduction
                }
            }
            paySlip.setDeduction(deduction);
            paySlip.setNetSalary(paySlip.getSalary() - deduction);
            
            paySlip.setPayDate(new Date());
            paySlips.add(paySlipRepository.save(paySlip));
        }
        
        return paySlips;
    }
    
    public PaySlip generatePaySlip(Employee employee, String month, int year) {
        PaySlip paySlip = new PaySlip();
        paySlip.setEmployee(employee);
        paySlip.setSalary(50000.0); // Example fixed salary

        // Calculate deductions (example logic)
        double deduction = 1000.0; // Example deduction logic per leave or absence

        paySlip.setDeduction(deduction);
        paySlip.setNetSalary(paySlip.getSalary() - deduction);
        paySlip.setPayDate(new Date()); // Current date as pay date

        return paySlipRepository.save(paySlip);
    }

    public List<PaySlip> getPaySlipsByEmployee(Employee employee) {
        return paySlipRepository.findByEmployeeId(employee.getId());
    }
}
