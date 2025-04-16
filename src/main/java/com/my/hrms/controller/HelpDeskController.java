package com.my.hrms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.my.hrms.entity.HelpDesk;
import com.my.hrms.service.HelpDeskService;

@Controller
@RequestMapping("/employee/helpdesk")
public class HelpDeskController {

    @Autowired
    private HelpDeskService helpDeskService;

    @GetMapping
    public String viewHelpDesksPage(Model model) {
        model.addAttribute("helpDeskItems", helpDeskService.getAllHelpDesks());
        return "employee/helpdesk";
    }

    @PostMapping("/create")
    public String createHelpDesks(@ModelAttribute HelpDesk helpDesk) {
        helpDeskService.createHelpDesk(helpDesk);
        return "redirect:/admin/helpdesk";
    }

    @GetMapping("/delete-helpDesk/{id}")
    public String deleteHelpDesks(@PathVariable Long id) {
        helpDeskService.deleteHelpDesk(id);
        return "redirect:/admin/helpdesk";
    } 
}
