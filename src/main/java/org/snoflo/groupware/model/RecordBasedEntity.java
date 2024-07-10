package org.snoflo.groupware.model;

import jakarta.persistence.Column;
import jakarta.persistence.MappedSuperclass;
import java.time.LocalDate;


@MappedSuperclass
public abstract class RecordBasedEntity extends BasedEntity {

    @Column(name = "employee_id", nullable = false)
    private Long employeeId;

    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "summary", length = 500)
    private String summary;
}
