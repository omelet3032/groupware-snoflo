package org.snoflo.groupware.employee;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.snoflo.groupware.model.NamedEntity;
import org.snoflo.groupware.model.PersonEntity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Pattern;

@Entity
@Table(name = "Employee")
public class Employee extends PersonEntity {

    @Column(name = "phone", nullable = false, length = 20)
    private String phone;

    @Column(name = "birth_date", nullable = false)
    private LocalDate birthDate;

    @Column(name = "photo")
    private String photo;

    @ManyToOne
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @ManyToOne
    @JoinColumn(name = "position_id", nullable = false)
    private Position position;

    @ManyToOne
    @JoinColumn(name = "job_type_id", nullable = false)
    private JobType jobType;

    @Column(name = "status", nullable = false, length = 20)
    @Pattern(regexp = "재직|퇴사|휴직", message = "사원 상태값은 재직, 퇴사, 휴직중 하나여야 합니다.")
    private String status;

    @Column(name = "hire_date", nullable = false)
    private LocalDate hireDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @OneToMany(mappedBy = "employee")
    private List<JobHistory> jobHistorys = new ArrayList<>();

    @OneToMany(mappedBy = "employee")
    private List<AttendanceRecord> attendanceRecords = new ArrayList<>();


    private List<RemainingVacationDays> remainingVacationDays = new ArrayList<>();

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public JobType getJobType() {
        return jobType;
    }

    public void setJobType(JobType jobType) {
        this.jobType = jobType;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDate getHireDate() {
        return hireDate;
    }

    public void setHireDate(LocalDate hireDate) {
        this.hireDate = hireDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }


}
