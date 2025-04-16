package com.my.hrms.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.hrms.dto.UserDto;
import com.my.hrms.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }
//
//    @Autowired
//    private UserRepository userRepository;
//
//    @Autowired
//    private RoleRepository roleRepository;
//
//    @Autowired
//    private PasswordEncoder passwordEncoder;

//    @GetMapping("/login")
//    public String login() {
//        return "login"; // JSP page for login
//    }

//    @GetMapping("/register")
//    public String register() {
//        return "register"; // JSP page for registration
//    }

//    @PostMapping("/register")
//    public String registerUser (User user) {
//        user.setPassword(passwordEncoder.encode(user.getPassword()));
//        user.setRoles(Collections.singletonList(roleRepository.findByName("ROLE_EMPLOYEE"))); // Assign default role
//        userRepository.save(user);
//        return "redirect:/login"; // Redirect to login after registration
//    }

//    @GetMapping("/")
//    public String home(Model model) {
//        return "index"; // JSP page for home
//    }
//
//    @GetMapping("/admin")
//    public String adminHome(Model model) {
//        return "admin"; // JSP page for admin home
//    }
    
 // handler method to handle list of users
    @GetMapping("/users")
    public String users(Model model) {
        logger.info("Accessing users page");
        
        List<UserDto> users = userService.findAllUsers();
        
        model.addAttribute("users",users);
        
        return "admin/users";
    }

    @GetMapping("/users/{id}")
    @ResponseBody
    public ResponseEntity<UserDto> getUser(@PathVariable Long id) {
        UserDto user = userService.findUserById(id);
        return ResponseEntity.ok(user);
    }

    @PostMapping("/users/add")
    public String addUser(UserDto userDto) {
        userService.createUser(userDto);
        return "redirect:/admin/users";
    }

    @PutMapping("/users/update")
    @ResponseBody
    public ResponseEntity<?> updateUser(@RequestBody UserDto userDto) {
        try {
            logger.info("Updating user with ID: {}", userDto.getId());
            // Get the existing user
            UserDto existingUser = userService.findUserById(userDto.getId());
            if (existingUser == null) {
                return ResponseEntity.badRequest().body("User not found");
            }
            
            // Only update the fields that are provided
            if (userDto.getName() != null) {
                existingUser.setName(userDto.getName());
            }
            if (userDto.getEmail() != null) {
                existingUser.setEmail(userDto.getEmail());
            }
            if (userDto.getRole() != null) {
                existingUser.setRole(userDto.getRole());
            }
            
            // Update the user
            userService.updateUser(existingUser);
            return ResponseEntity.ok().build();
        } catch (RuntimeException e) {
            logger.error("Error updating user: {}", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            logger.error("Unexpected error updating user: {}", e.getMessage());
            return ResponseEntity.badRequest().body("An unexpected error occurred");
        }
    }

    @DeleteMapping("/users/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteUser(@PathVariable Long id) {
        try {
            logger.info("Deleting user with ID: {}", id);
            userService.deleteUser(id);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            logger.error("Error deleting user: {}", e.getMessage());
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}