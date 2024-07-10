package org.snoflo.groupware.employee;

import org.snoflo.groupware.model.NamedEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "vacation_types")
public class VacationType extends NamedEntity {
    
}
