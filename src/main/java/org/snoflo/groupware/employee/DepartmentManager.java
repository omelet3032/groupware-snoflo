package org.snoflo.groupware.employee;

import jakarta.persistence.Table;

@Table(name = "department_managers")
public class DepartmentManager {
    
    private Long managerId;

    private Long departmentId;

    public Long getManagerId() {
        return managerId;
    }

    public void setManagerId(Long managerId) {
        this.managerId = managerId;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    
}
