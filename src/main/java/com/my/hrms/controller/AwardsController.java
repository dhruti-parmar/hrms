package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.Awards;
import com.my.hrms.service.AwardsService;

@Controller
@RequestMapping("/employee/awards")
public class AwardsController {

    @Autowired
    private AwardsService designationService;

    @GetMapping
    public String viewAwardssPage(Model model) {
        model.addAttribute("awardItems", designationService.getAllAwardss());
        return "employee/awards";
    }

    @PostMapping("/create")
    public String createAwards(@ModelAttribute Awards designation) {
        designationService.createAwards(designation);
        return "redirect:/employee/awards";
    }

    @GetMapping("/delete/{id}")
    public String deleteAwards(@PathVariable Long id) {
        designationService.deleteAwards(id);
        return "redirect:/employee/awards";
    }
}
