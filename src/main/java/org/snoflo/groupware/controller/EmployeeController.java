package org.snoflo.groupware.controller;

import java.util.Collection;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.dto.EmployeeDto;
import org.snoflo.groupware.model.Account;
import org.snoflo.groupware.repository.AccountRepository;
import org.snoflo.groupware.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class EmployeeController {

    private final EmployeeService employeeService;
    private final AccountRepository accountRepository;

    public EmployeeController(EmployeeService employeeService, AccountRepository accountRepository) {
        this.employeeService = employeeService;
        this.accountRepository = accountRepository;
    }

    @GetMapping("/employeeList")
    public String findAllEmployees(Model model) {
        Collection<EmployeeDto> employees = employeeService.findAllEmployee();
        model.addAttribute("employees", employees);
        return "admin/employeeList";
    }

    @GetMapping("/search")
    public String findEmployeeByName(@RequestParam(name = "name") String name, Model model) {

        Collection<EmployeeDto> employee = employeeService.findEmployeeByName(name);
        model.addAttribute("employees", employee);
        return "admin/employeeListByName";
    }

    @GetMapping("/account")
    public String findAccount(Model model) {
       
        Collection<AccountDto> accounts = accountRepository.findAllAccount();
        model.addAttribute("accounts", accounts);
        return "admin/account";
    }
   
    @GetMapping("/registerEmployee")
    public String addEmployee(EmployeeDto employeeDto) {
        return "admin/registerEmployee";
    }
    

}
