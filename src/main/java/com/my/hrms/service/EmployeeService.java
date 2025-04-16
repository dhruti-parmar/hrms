package com.my.hrms.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.repository.EmployeeRepository;

@Service
public class EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    public Employee getEmployee(Long id) {
        return employeeRepository.findById(id).orElseThrow();
    }

    public Employee updateEmployee(Employee employee) {
        return employeeRepository.save(employee);
    }

    public Employee getProfile(Long id) {
        return employeeRepository.findById(id).orElseThrow();
    }

    public Employee updateProfile(Employee employee) {
        Employee existingEmployee = employeeRepository.findById(employee.getId()).orElseThrow();
        existingEmployee.setName(employee.getName());
        existingEmployee.setEmail(employee.getEmail());
        return employeeRepository.save(existingEmployee);
    }

	public Employee getEmployeeByEmail(String email) {
		Optional<Employee> employee = employeeRepository.findByEmail(email);
		return employee.isPresent()? employee.get() : null;
	}
}
