package org.snoflo.groupware.model;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class NamedEntity extends CodedEntity {
    
    @Column(name = "name")
    private String name;
}
