package org.snoflo.groupware.employee;

import java.time.LocalDate;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "leave_of_absence_grant_history")
public class LeaveOfAbsenceGrantHistory {
    
    @Id
    private Long id;

    private Long employeeId;

    private Long typeId;

    private LocalDate date;

    private Integer grantDays;

    private String summary;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Integer getGrantDays() {
        return grantDays;
    }

    public void setGrantDays(Integer grantDays) {
        this.grantDays = grantDays;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    
}
