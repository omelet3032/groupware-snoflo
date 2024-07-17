package org.snoflo.groupware.employee;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "accounts")
public class Account {
    
    @Id
    private Long id;
    
    private Long employeeId;
    
    private String email;
    
    private String password;
    
    private String role;

    public Long getId() {
        return id;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    
}
