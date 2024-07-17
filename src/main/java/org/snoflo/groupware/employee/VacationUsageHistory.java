package org.snoflo.groupware.employee;

import java.time.LocalDate;

import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Table(name = "vacation_usage_history")
public class VacationUsageHistory {
    
    @Id
    private Long id;

    private Long employeeId;

    private Long typeId;

    private LocalDate startDate;
    
    private LocalDate endDate;
    
    private Integer usageDays;
    
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

    public Integer getUsageDays() {
        return usageDays;
    }

    public void setUsageDays(Integer usageDays) {
        this.usageDays = usageDays;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    
}
