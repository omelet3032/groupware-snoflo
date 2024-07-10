package org.snoflo.groupware.employee;

import org.snoflo.groupware.model.NamedEntity;
import org.snoflo.groupware.model.TypedEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "positions")
public class Position extends TypedEntity {

}
