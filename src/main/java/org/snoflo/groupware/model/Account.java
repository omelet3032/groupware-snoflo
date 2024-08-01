package org.snoflo.groupware.model;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "account")
public class Account {
    
    @Id
    private Long id;

    private int employeeCode;

    private String email;

    private String password;

    private String role;
}

