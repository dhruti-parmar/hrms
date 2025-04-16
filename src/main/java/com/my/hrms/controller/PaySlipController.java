package com.my.hrms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.PaySlip;
import com.my.hrms.service.PaySlipService;

@Controller
@RequestMapping("/employee/payroll")
public class PaySlipController {

    @Autowired
    private PaySlipService paySlipService;

    @GetMapping
    public List<PaySlip> getAllPaySlips() {
        return paySlipService.getAllPaySlips();
    }

    @PostMapping
    public PaySlip generatePaySlip(@RequestBody PaySlip paySlip) {
        return paySlipService.generatePaySlip(paySlip);
    }
}
