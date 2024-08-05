package org.snoflo.groupware.repository;

import java.util.Collection;

import org.snoflo.groupware.dto.EmployeeDto;
import org.springframework.dao.DataAccessException;
import org.springframework.data.repository.query.Param;

public interface EmployeeRepository {

    Collection<EmployeeDto> findAll() throws DataAccessException;
    
    Collection<EmployeeDto> findByName(@Param("name") String name) throws DataAccessException;

}


