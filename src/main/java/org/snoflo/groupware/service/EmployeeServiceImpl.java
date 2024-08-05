package org.snoflo.groupware.service;

import java.util.Collection;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.dto.EmployeeDto;
import org.snoflo.groupware.repository.AccountRepository;
import org.snoflo.groupware.repository.EmployeeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    private final EmployeeRepository employeeRepository;

    public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Collection<EmployeeDto> findAllEmployee() {
        return employeeRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public Collection<EmployeeDto> findEmployeeByName(String name) {
        return employeeRepository.findByName(name);
    }

    /* @Override
    @Transactional(readOnly = true)
    public Collection<AccountDto> findAllAccount() {
        return accountRepository.findAllAccount();
    } */
    
    
}
