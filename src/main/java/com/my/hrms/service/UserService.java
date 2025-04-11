package com.my.hrms.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.my.hrms.dto.UserDto;

public interface UserService {
    void saveUser(UserDto userDto);

    UserDto findUserByEmail(String email);

    List<UserDto> findAllUsers();
    
    Page<UserDto> findAllUsers(String search, Pageable pageable);
    
    UserDto findUserById(Long id);

    UserDto createUser(UserDto userDto);

    UserDto updateUser(UserDto userDto);

    void deleteUser(Long id);
}