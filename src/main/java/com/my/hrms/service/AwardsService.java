package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.Awards;
import com.my.hrms.repository.AwardsRepository;

@Service
public class AwardsService {

    @Autowired
    private AwardsRepository awardsRepository;

    public List<Awards> getAllAwardss() {
        return awardsRepository.findAll();
    }

    public Awards createAwards(Awards Awards) {
        return awardsRepository.save(Awards);
    }

    public Awards updateAwards(Awards Awards) {
        Awards existingAwards = awardsRepository.findById(Awards.getId()).orElseThrow();
        existingAwards.setName(Awards.getName());
        return awardsRepository.save(existingAwards);
    }

    public void deleteAwards(Long id) {
    	awardsRepository.deleteById(id);
    }
}
