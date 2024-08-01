package org.snoflo.groupware.dto;

public class EmployeeDto {

    private int code;
    
    private String name;
    
    private String departmentName;
    
    private String jobPositionName;
    
    private String jobTypeName;

    private int managerCode;

    private String status;

    public EmployeeDto() {} 

    public EmployeeDto(int code, String name, String departmentName, String jobPositionName, String jobTypeName,
            int managerCode, String status) {
        this.code = code;
        this.name = name;
        this.departmentName = departmentName;
        this.jobPositionName = jobPositionName;
        this.jobTypeName = jobTypeName;
        this.managerCode = managerCode;
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getJobPositionName() {
        return jobPositionName;
    }

    public void setJobPositionName(String jobPositionName) {
        this.jobPositionName = jobPositionName;
    }

    public String getJobTypeName() {
        return jobTypeName;
    }

    public void setJobTypeName(String jobTypeName) {
        this.jobTypeName = jobTypeName;
    }

    public int getManagerCode() {
        return managerCode;
    }

    public void setManagerCode(int managerCode) {
        this.managerCode = managerCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    


    
}
