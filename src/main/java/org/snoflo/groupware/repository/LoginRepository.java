package org.snoflo.groupware.repository;

import org.snoflo.groupware.dto.AccountDto;
import org.springframework.dao.DataAccessException;

public interface LoginRepository {

    AccountDto findByEmailAndPassword(String email, String password) throws DataAccessException;

}
    

