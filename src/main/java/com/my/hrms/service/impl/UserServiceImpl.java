package com.my.hrms.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.my.hrms.dto.UserDto;
import com.my.hrms.entity.Role;
import com.my.hrms.entity.User;
import com.my.hrms.repository.RoleRepository;
import com.my.hrms.repository.UserRepository;
import com.my.hrms.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void saveUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        // encrypt the password using spring security
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));

        // Set role based on user input
        Role role;
        if ("ROLE_ADMIN".equals(userDto.getRole())) {
            role = roleRepository.findById(1L)
                    .orElseGet(() -> {
                        Role newRole = new Role();
                        newRole.setName("ROLE_ADMIN");
                        return roleRepository.save(newRole);
                    });
        } else {
            role = roleRepository.findById(2L)
                    .orElseGet(() -> {
                        Role newRole = new Role();
                        newRole.setName("ROLE_USER");
                        return roleRepository.save(newRole);
                    });
        }
        user.setRoles(Set.of(role));
        userRepository.save(user);
    }

    @Override
    public UserDto findUserByEmail(String email) {
        User user = userRepository.findByEmail(email);
        return user != null ? convertToDto(user) : null;
    }

    @Override
    public List<UserDto> findAllUsers() {
        List<User> users = userRepository.findAll();
        return users.stream()
                .map(this::convertToDto)
                .collect(Collectors.toList());
    }

    @Override
    public Page<UserDto> findAllUsers(String search, Pageable pageable) {
        Page<User> users;
        if (search != null && !search.isEmpty()) {
            users = userRepository.findByNameContainingOrEmailContaining(search, pageable);
        } else {
            users = userRepository.findAll(pageable);
        }
        return users.map(this::convertToDto);
    }

    @Override
    public UserDto findUserById(Long id) {
        User user = userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
        return convertToDto(user);
    }

    @Override
    public UserDto createUser(UserDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));

        // Set role based on user input
        Role role;
        if ("ROLE_ADMIN".equals(userDto.getRole())) {
            role = roleRepository.findById(1L)
                    .orElseGet(() -> {
                        Role newRole = new Role();
                        newRole.setName("ROLE_ADMIN");
                        return roleRepository.save(newRole);
                    });
        } else {
            role = roleRepository.findById(2L)
                    .orElseGet(() -> {
                        Role newRole = new Role();
                        newRole.setName("ROLE_USER");
                        return roleRepository.save(newRole);
                    });
        }
        user.setRoles(Set.of(role));
        
        User savedUser = userRepository.save(user);
        return convertToDto(savedUser);
    }

    @Override
    public UserDto updateUser(UserDto userDto) {
        try {
            logger.info("Starting update for user: {}", userDto);
            
            User user = userRepository.findById(userDto.getId())
                    .orElseThrow(() -> {
                        logger.error("User not found with id: {}", userDto.getId());
                        return new RuntimeException("User not found with id: " + userDto.getId());
                    });
            
            logger.info("Found existing user: {}", user);
            
            user.setName(userDto.getName());
            user.setEmail(userDto.getEmail());
            
            // Update password if provided
            if (userDto.getPassword() != null && !userDto.getPassword().isEmpty()) {
                logger.info("Updating password for user: {}", userDto.getId());
                user.setPassword(passwordEncoder.encode(userDto.getPassword()));
            }
            
            // Update role if changed
            if (userDto.getRole() != null) {
                logger.info("Updating role for user: {} to {}", userDto.getId(), userDto.getRole());
                Role role;
                if ("ROLE_ADMIN".equals(userDto.getRole())) {
                    role = roleRepository.findById(1L)
                            .orElseGet(() -> {
                                logger.info("Creating new ADMIN role");
                                Role newRole = new Role();
                                newRole.setName("ROLE_ADMIN");
                                return roleRepository.save(newRole);
                            });
                } else {
                    role = roleRepository.findById(2L)
                            .orElseGet(() -> {
                                logger.info("Creating new USER role");
                                Role newRole = new Role();
                                newRole.setName("ROLE_USER");
                                return roleRepository.save(newRole);
                            });
                }
                user.setRoles(new HashSet<>(Set.of(role)));
            }
            
            logger.info("Saving updated user: {}", user);
            User updatedUser = userRepository.save(user);
            logger.info("User updated successfully: {}", updatedUser);
            
            return convertToDto(updatedUser);
        } catch (Exception e) {
            logger.error("Error in updateUser: {}", e.getMessage(), e);
            throw e;
        }
    }

    @Override
    public void deleteUser(Long id) {
        try {
            logger.info("Starting deletion of user with ID: {}", id);
            
            // First find the user to get their roles
            User user = userRepository.findById(id)
                    .orElseThrow(() -> {
                        logger.error("User not found with id: {}", id);
                        return new RuntimeException("User not found with id: " + id);
                    });
            
            logger.info("Found user to delete: {}", user);
            
            // Remove the user from all roles
            user.getRoles().clear();
            userRepository.save(user);
            logger.info("Cleared user's roles");
            
            // Now delete the user
            userRepository.deleteById(id);
            logger.info("User deleted successfully");
            
        } catch (Exception e) {
            logger.error("Error in deleteUser: {}", e.getMessage(), e);
            throw e;
        }
    }
 
    private UserDto convertToDto(User user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setName(user.getName());
        userDto.setEmail(user.getEmail());
        
        // Safely get the role, defaulting to ROLE_USER if no roles exist
        if (user.getRoles() != null && !user.getRoles().isEmpty()) {
            userDto.setRole(user.getRoles().iterator().next().getName());
        } else {
            userDto.setRole("ROLE_USER"); // Default role
        }
        
        return userDto;
    }
}