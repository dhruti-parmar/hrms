package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Designation;
import com.my.hrms.repository.DesignationRepository;

@Service
public class DesignationService {

    @Autowired
    private DesignationRepository designationRepository;

    public List<Designation> getAllDesignations() {
        return designationRepository.findAll();
    }

    public Designation createDesignation(Designation Designation) {
        return designationRepository.save(Designation);
    }

    public Designation updateDesignation(Designation Designation) {
        Designation existingDesignation = designationRepository.findById(Designation.getId()).orElseThrow();
        existingDesignation.setName(Designation.getName());
        return designationRepository.save(existingDesignation);
    }

    public void deleteDesignation(Long id) {
    	designationRepository.deleteById(id);
    }
}
