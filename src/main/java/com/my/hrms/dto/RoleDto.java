package com.my.hrms.dto;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoleDto
{
    private Long id;
    
    @NotEmpty(message = "Role name should not be empty")
    private String name;
}