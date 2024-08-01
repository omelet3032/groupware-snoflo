package org.snoflo.groupware.dto;

public class AccountDto {
    
    private Long id;

    private int employeeCode;

    private String email;

    private String password;

    private String role;

    public AccountDto() {
    }

    public AccountDto(Long id, int employeeCode, String email, String password, String role) {
        this.id = id;
        this.employeeCode = employeeCode;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getEmployeeCode() {
        return employeeCode;
    }

    public void setEmployeeCode(int employeeCode) {
        this.employeeCode = employeeCode;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    
}

