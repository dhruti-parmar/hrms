package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.LeaveType;
import com.my.hrms.repository.LeaveTypeRepository;

@Service
public class LeaveTypeService {

    @Autowired
    private LeaveTypeRepository leaveTypeRepository;

    public List<LeaveType> getAllLeaveTypes() {
        return leaveTypeRepository.findAll();
    }

    public LeaveType createLeaveType(LeaveType leaveType) {
        return leaveTypeRepository.save(leaveType);
    }

    public LeaveType updateLeaveType(LeaveType leaveType) {
        LeaveType existingLeaveType = leaveTypeRepository.findById(leaveType.getId()).orElseThrow();
        existingLeaveType.setType(leaveType.getType());
        return leaveTypeRepository.save(existingLeaveType);
    }

    public void deleteLeaveType(Long id) {
        leaveTypeRepository.deleteById(id);
    }
}
