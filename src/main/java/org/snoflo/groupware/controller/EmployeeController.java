package org.snoflo.groupware.controller;

import java.util.Collection;

import org.snoflo.groupware.dto.EmployeeDto;
import org.snoflo.groupware.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/employeeList")
    public String findAllEmployees(Model model) {
        Collection<EmployeeDto> employees = employeeService.findAllEmployee();
        model.addAttribute("employees", employees);
        return "admin/employeeList";
    }

    
}
