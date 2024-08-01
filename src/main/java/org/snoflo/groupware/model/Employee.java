package org.snoflo.groupware.model;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "employee")
public class Employee {
   
    @Id
    private Long id;

    private int code;

    private String name;

    private int departmentCode;

    private int jobPositionCode;

    private int jobTypeCode;

    private int managerCode;

    private String status;

}
