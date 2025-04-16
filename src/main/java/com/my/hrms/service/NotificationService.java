package com.my.hrms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Employee;
import com.my.hrms.repository.NotificationRepository;

@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;
    @Autowired
    private JavaMailSender javaMailSender;

    public List<Notification> getNotificationsByEmployee(Employee employee) {
        return notificationRepository.findByEmployeeId(employee.getId());
    }
    
    public void sendNotification(Employee employee, String message) {
        Notification notification = new Notification();
        notification.setMessage(message);
        notification.setEmployee(employee);
        notification.setSentDate(new Date());
        notificationRepository.save(notification);

        // Send email notification
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(employee.getEmail());
        mailMessage.setSubject("Leave Status Update");
        mailMessage.setText(message);
        javaMailSender.send(mailMessage);
    }
}
