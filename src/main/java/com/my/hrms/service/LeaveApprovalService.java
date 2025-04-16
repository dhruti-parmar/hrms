package com.my.hrms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.entity.LeaveApplication;
import com.my.hrms.repository.LeaveApplicationRepository;

@Service
public class LeaveApprovalService {

    @Autowired
    private LeaveApplicationRepository leaveApplicationRepository;
    @Autowired
    private NotificationService notificationService;
    
    public LeaveApplication approveLeave(Long leaveId, String approverComment) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(leaveId).orElseThrow();
        Employee employee = leaveApplication.getEmployee();
//        Employee manager = employee.getManager();
//
//        if (manager != null) {
        if (employee.getDesignation().getName().equalsIgnoreCase("Manager")) {
            leaveApplication.setStatus("Approved");
            leaveApplication.setComment(approverComment);
            notificationService.sendNotification(employee, "Your leave has been approved.");
            return leaveApplicationRepository.save(leaveApplication);
        } else {
            throw new RuntimeException("No manager assigned to approve leave");
        }
    }

    public LeaveApplication rejectLeave(Long leaveId, String rejectionComment) {
        LeaveApplication leaveApplication = leaveApplicationRepository.findById(leaveId).orElseThrow();
        Employee employee = leaveApplication.getEmployee();
//        Employee manager = employee.getManager();
//
//        if (manager != null) {
        if (employee.getDesignation().getName().equalsIgnoreCase("Manager")) {
            leaveApplication.setStatus("Rejected");
            leaveApplication.setComment(rejectionComment);
            notificationService.sendNotification(employee, "Your leave has been rejected.");
            return leaveApplicationRepository.save(leaveApplication);
        } else {
            throw new RuntimeException("No manager assigned to reject leave");
        }
    }
}
