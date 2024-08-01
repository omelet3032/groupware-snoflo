package org.snoflo.groupware.service;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.dto.LoginResult;
import org.snoflo.groupware.repository.LoginRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginService {

    private LoginRepository loginRepository;

    public LoginService(LoginRepository loginRepository) {
        this.loginRepository = loginRepository;
    }

    @Transactional(readOnly = true)
    public LoginResult login(String email, String password) {

        AccountDto account = loginRepository.findByEmailAndPassword(email, password);
        
        if (account == null) {
            return new LoginResult(false);
        }
        
        boolean isAdmin = account.getRole().equals("관리자");
        
        return isAdmin ? new LoginResult( true, "관리자") : new LoginResult( true, "사원");
    }

}
