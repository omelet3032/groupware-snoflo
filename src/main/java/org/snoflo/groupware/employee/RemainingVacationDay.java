package org.snoflo.groupware.employee;

import java.time.Year;

import jakarta.persistence.Table;

@Table(name = " remaining_vacation_days")
public class RemainingVacationDay {

    private Long employeeId;

    private Long typeId;

    private Year year;

    private int remainingDays;

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

    public Year getYear() {
        return year;
    }

    public void setYear(Year year) {
        this.year = year;
    }

    public int getRemainingDays() {
        return remainingDays;
    }

    public void setRemainingDays(int remainingDays) {
        this.remainingDays = remainingDays;
    }

    
}

