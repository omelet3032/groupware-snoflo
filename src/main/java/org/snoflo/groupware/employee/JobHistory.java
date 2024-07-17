package org.snoflo.groupware.employee;

import java.time.LocalDate;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "job_history")
public class JobHistory {

    @Id
    private Long id;

    private Long employeeId;

    private LocalDate startDate;

    private LocalDate endDate;

    private Long positionId;

    private Long departmentId;

    private Long jobTypeId;

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

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    public Long getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Long departmentId) {
        this.departmentId = departmentId;
    }

    public Long getJobTypeId() {
        return jobTypeId;
    }

    public void setJobTypeId(Long jobTypeId) {
        this.jobTypeId = jobTypeId;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    
}