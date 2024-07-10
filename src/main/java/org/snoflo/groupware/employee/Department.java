package org.snoflo.groupware.employee;

import org.snoflo.groupware.model.TypedEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "departments")
public class Department extends TypedEntity{

    @JoinColumn(name = "manager_id")
    private Employee manager;
    
}
