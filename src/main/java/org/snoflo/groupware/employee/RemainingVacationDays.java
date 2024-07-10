package org.snoflo.groupware.employee;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "remaining_vacation_days")
public class RemainingVacationDays {

    private Employee employee;

    private VacationType vacationType;
}
