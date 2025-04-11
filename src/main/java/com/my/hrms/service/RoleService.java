package com.my.hrms.service;

import java.util.List;

import com.my.hrms.dto.RoleDto;

public interface RoleService {

    List<RoleDto> findAllRoles();
    RoleDto findRoleById(Long id);
    RoleDto createRole(RoleDto roleDto);
    RoleDto updateRole(RoleDto roleDto);
    void deleteRole(Long id);
}