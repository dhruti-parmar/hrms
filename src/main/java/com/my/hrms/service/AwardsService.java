package com.my.hrms.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Awards;
import com.my.hrms.entity.Employee;
import com.my.hrms.repository.AwardsRepository;

@Service
public class AwardsService {

    @Autowired
    private AwardsRepository awardsRepository;

    public List<Awards> getAllAwards() {
        return awardsRepository.findAll();
    }

    public Awards createAwards(Awards awards) {
        awards.setCreatedAt(LocalDateTime.now());
        awards.setUpdatedAt(LocalDateTime.now());
        return awardsRepository.save(awards);
    }

    public Awards updateAwards(Awards awards) {
        Awards existingAwards = awardsRepository.findById(awards.getId()).orElseThrow();
        existingAwards.setName(awards.getName());
        existingAwards.setDescription(awards.getDescription());
        existingAwards.setStatus(awards.getStatus());
        existingAwards.setDate(awards.getDate());
        existingAwards.setUpdatedAt(LocalDateTime.now());
        existingAwards.setUpdatedBy(awards.getUpdatedBy());
        return awardsRepository.save(existingAwards);
    }

    public void deleteAwards(Long id) {
        awardsRepository.deleteById(id);
    }
    
    public List<Awards> getAwardsByEmployee(Employee employee) {
        return awardsRepository.findByEmployee(employee);
    }
    
    public Awards createAwardForEmployee(Awards award, Employee employee, String createdBy) {
        award.setEmployee(employee);
        award.setCreatedBy(createdBy);
        award.setCreatedAt(LocalDateTime.now());
        award.setUpdatedAt(LocalDateTime.now());
        return awardsRepository.save(award);
    }
}