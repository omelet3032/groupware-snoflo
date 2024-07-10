package org.snoflo.groupware.employee;

import org.snoflo.groupware.model.NamedEntity;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "job_types")
public class JobType extends NamedEntity {

}
