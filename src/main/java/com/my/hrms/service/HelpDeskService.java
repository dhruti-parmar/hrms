package com.my.hrms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.entity.HelpDesk;
import com.my.hrms.repository.HelpDeskRepository;

@Service
public class HelpDeskService {

    @Autowired
    private HelpDeskRepository helpDeskRepository;

    public List<HelpDesk> getAllHelpDesks() {
        return helpDeskRepository.findAll();
    }

    public HelpDesk createHelpDesk(HelpDesk deplDesk) {
        return helpDeskRepository.save(deplDesk);
    }

    public HelpDesk updateHelpDesk(HelpDesk deplDesk) {
        HelpDesk existingHelpDesk = helpDeskRepository.findById(deplDesk.getId()).orElseThrow();
        existingHelpDesk.setComment(existingHelpDesk.getComment());
        return helpDeskRepository.save(existingHelpDesk);
    }

    public void deleteHelpDesk(Long id) {
        helpDeskRepository.deleteById(id);
    }
}
