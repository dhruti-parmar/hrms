package com.my.hrms.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.hrms.dto.RoleDto;
import com.my.hrms.entity.Role;
import com.my.hrms.repository.RoleRepository;
import com.my.hrms.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

    private static final Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<RoleDto> findAllRoles() {
        List<Role> roles = roleRepository.findAll();
        return roles.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    @Override
    public RoleDto findRoleById(Long id) {
        Role role = roleRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Role not found with id: " + id));
        return convertToDto(role);
    }

    @Override
    public RoleDto createRole(RoleDto roleDto) {
        Role role = new Role();
        role.setName(roleDto.getName());
        Role savedRole = roleRepository.save(role);
        return convertToDto(savedRole);
    }

    @Override
    public RoleDto updateRole(RoleDto roleDto) {
        try {
            logger.info("Updating role with ID: {}", roleDto.getId());
            Role role = roleRepository.findById(roleDto.getId())
                    .orElseThrow(() -> new RuntimeException("Role not found with id: " + roleDto.getId()));
            
            role.setName(roleDto.getName());
            Role updatedRole = roleRepository.save(role);
            return convertToDto(updatedRole);
        } catch (Exception e) {
            logger.error("Error updating role: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public void deleteRole(Long id) {
        try {
            logger.info("Deleting role with ID: {}", id);
            roleRepository.deleteById(id);
        } catch (Exception e) {
            logger.error("Error deleting role: {}", e.getMessage());
            throw e;
        }
    }

    private RoleDto convertToDto(Role role) {
        RoleDto roleDto = new RoleDto();
        roleDto.setId(role.getId());
        roleDto.setName(role.getName());
        return roleDto;
    }

	@Override
	public Role findByName(String name) {
		// TODO Auto-generated method stub
		return roleRepository.findByName(name);
	}
}