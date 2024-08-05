package org.snoflo.groupware.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "account")
public class Account {
    
    @Id
    private Long id;

    private int employeeCode;

    private String email;

    private String password;

    private String role;
}

