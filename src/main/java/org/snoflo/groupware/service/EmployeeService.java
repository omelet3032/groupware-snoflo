package org.snoflo.groupware.service;

import java.util.Collection;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.dto.EmployeeDto;

public interface EmployeeService {
    
    Collection<EmployeeDto> findAllEmployee();
    
    Collection<EmployeeDto> findEmployeeByName(String name);

/*     Collection<AccountDto> findAllAccount();
 */}
