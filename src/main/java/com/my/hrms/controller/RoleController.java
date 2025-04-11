package com.my.hrms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.hrms.dto.RoleDto;
import com.my.hrms.service.RoleService;

@Controller
public class RoleController {
    
    private static final Logger logger = LoggerFactory.getLogger(RoleController.class);
    private final RoleService roleService;

    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    @GetMapping("/roles")
    public String roles(Model model) {
        logger.info("Accessing roles page");
        model.addAttribute("roles", roleService.findAllRoles());
        return "roles";
    }

    @GetMapping("/roles/{id}")
    @ResponseBody
    public ResponseEntity<RoleDto> getRole(@PathVariable Long id) {
        RoleDto role = roleService.findRoleById(id);
        return ResponseEntity.ok(role);
    }

    @PostMapping("/roles/add")
    public String addRole(RoleDto roleDto) {
        roleService.createRole(roleDto);
        return "redirect:/roles";
    }

    @PutMapping("/roles/update")
    @ResponseBody
    public ResponseEntity<?> updateRole(@RequestBody RoleDto roleDto) {
        try {
            logger.info("Updating role with ID: {}", roleDto.getId());
            roleService.updateRole(roleDto);
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            logger.error("Error updating role: {}", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            logger.error("Unexpected error updating role: {}", e.getMessage());
            return ResponseEntity.badRequest().body("An unexpected error occurred");
        }
    }

    @DeleteMapping("/roles/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteRole(@PathVariable Long id) {
        try {
            logger.info("Deleting role with ID: {}", id);
            roleService.deleteRole(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            logger.error("Error deleting role: {}", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}