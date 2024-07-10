package org.snoflo.groupware.employee;

import java.time.LocalDateTime;
import java.time.LocalTime;

import org.snoflo.groupware.model.BasedEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "attendance_record")
public class AttendanceRecord extends BasedEntity {
    
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

    @Column(name = "clock_in")
    private LocalDateTime clockIn;

    @Column(name = "clock_out")
    private LocalDateTime clockOut;

    @Column(name = "work_hours")
    private LocalTime workHours;
}
