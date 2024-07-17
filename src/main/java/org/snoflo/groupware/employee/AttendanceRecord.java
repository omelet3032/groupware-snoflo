package org.snoflo.groupware.employee;

import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.time.Duration;
import java.time.LocalDateTime;

@Table(name = "attendance_record")
public class AttendanceRecord {
    
    @Id
    private Long id;

    private Long employeeId;

    private LocalDateTime clockIn;

    private LocalDateTime clockOut;

    private Duration workHours;

    public void calculateWorkHours() {
        if (clockIn != null && clockOut != null) {
            this.workHours = Duration.between(clockIn, clockOut);
        }
    }

    // workHours를 보기 좋게 표현하는 메서드
    public String getFormattedWorkHours() {
        if (workHours == null) return "00:00";
        long hours = workHours.toHours();
        long minutes = workHours.toMinutesPart();
        return String.format("%02d:%02d", hours, minutes);
    }

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

    public LocalDateTime getClockIn() {
        return clockIn;
    }

    public void setClockIn(LocalDateTime clockIn) {
        this.clockIn = clockIn;
    }

    public LocalDateTime getClockOut() {
        return clockOut;
    }

    public void setClockOut(LocalDateTime clockOut) {
        this.clockOut = clockOut;
    }

    public Duration getWorkHours() {
        return workHours;
    }

    public void setWorkHours(Duration workHours) {
        this.workHours = workHours;
    }

    
}

