package com.my.hrms;

import org.springframework.boot.ApplicationRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.my.hrms.entity.Role;
import com.my.hrms.repository.RoleRepository;
@Configuration
public class RoleInitConfig {

//    @Bean
//    ApplicationRunner init(RoleRepository roleRepository) {
//        return args -> {
//            if (roleRepository.findByName("ROLE_ADMIN") == null) {
//                Role adminRole = new Role();
//                adminRole.setName("ROLE_ADMIN");
//                roleRepository.save(adminRole);
//            }
//            if (roleRepository.findByName("ROLE_EMPLOYEE") == null) {
//                Role employeeRole = new Role();
//                employeeRole.setName("ROLE_EMPLOYEE");
//                roleRepository.save(employeeRole);
//            }
//        };
//    }
}