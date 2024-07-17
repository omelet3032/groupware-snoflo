package org.snoflo.groupware.employee;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "departments")
public class Department {

    @Id
    private Long id;

    private int code;

    private String name;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    
}
