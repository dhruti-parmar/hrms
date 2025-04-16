package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.PaySlip;
import com.my.hrms.repository.PaySlipRepository;

@Service
public class PaySlipService {

    @Autowired
    private PaySlipRepository paySlipRepository;

    public List<PaySlip> getAllPaySlips() {
        return paySlipRepository.findAll();
    }

    public PaySlip generatePaySlip(PaySlip paySlip) {
        return paySlipRepository.save(paySlip);
    }

    public List<PaySlip> getPaySlipsByEmployee(Employee employee) {
        return paySlipRepository.findByEmployeeId(employee.getId());
    }
}
