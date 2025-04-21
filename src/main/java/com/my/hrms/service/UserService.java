package com.my.hrms.service;

import java.util.List;

import com.my.hrms.dto.UserDto;

public interface UserService {
    void saveUser(UserDto userDto);

    UserDto findUserByEmail(String email);

    List<UserDto> findAllUsers();
    
    UserDto findUserById(Long id);

    UserDto createUser(UserDto userDto);

    UserDto updateUser(UserDto userDto);

    void deleteUser(Long id);
    
    List<UserDto> findUsersWithRoleUser();
}