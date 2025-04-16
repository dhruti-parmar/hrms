package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Attendance;
import com.my.hrms.entity.Employee;
import com.my.hrms.repository.AttendanceRepository;

@Service
public class AttendanceService {

    @Autowired
    private AttendanceRepository attendanceRepository;

    public List<Attendance> getAllAttendances() {
        return attendanceRepository.findAll();
    }

    public Attendance markAttendance(Attendance attendance) {
        return attendanceRepository.save(attendance);
    }

    public List<Attendance> getEmployeeAttendances(Long employeeId) {
        return attendanceRepository.findByEmployeeId(employeeId);
    }
    
    public List<Attendance> getAttendanceRecordsByEmployee(Employee employee) {
        return attendanceRepository.findByEmployeeId(employee.getId());
    }
}
