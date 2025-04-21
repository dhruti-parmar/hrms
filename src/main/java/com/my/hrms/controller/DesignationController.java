package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.Designation;
import com.my.hrms.service.DesignationService;

@Controller
@RequestMapping("/admin/designation")
public class DesignationController {

    @Autowired
    private DesignationService designationService;

    @GetMapping
    public String viewDesignationsPage(Model model) {
        model.addAttribute("designations", designationService.getAllDesignations());
        return "admin/designation";
    }

    @GetMapping("/create-designation")
    public String createDesignationPage(Model model) {
        model.addAttribute("designation", new Designation());
        return "admin/create-designation";
    }

    @PostMapping("/create-designation")
    public String createDesignation(@ModelAttribute Designation designation) {
        designationService.createDesignation(designation);
        return "redirect:/admin/designation";
    }
    
    @PostMapping("/update-designation")
    public String updateDesignation(@ModelAttribute Designation designation) {
        designationService.updateDesignation(designation);
        return "redirect:/admin/designation";
    }

    @GetMapping("/delete-designation/{id}")
    public String deleteDesignation(@PathVariable Long id) {
        designationService.deleteDesignation(id);
        return "redirect:/admin/designation";
    }
}
