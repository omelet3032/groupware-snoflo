package org.snoflo.groupware.service;

import java.util.Collection;

import org.snoflo.groupware.dto.EmployeeDto;

public interface EmployeeService {
    
    Collection<EmployeeDto> findAllEmployee();
}
