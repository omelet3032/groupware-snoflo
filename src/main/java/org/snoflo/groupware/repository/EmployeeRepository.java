package org.snoflo.groupware.repository;

import java.util.Collection;

import org.snoflo.groupware.dto.EmployeeDto;
import org.springframework.dao.DataAccessException;

public interface EmployeeRepository {

    Collection<EmployeeDto> findAll() throws DataAccessException;

}


