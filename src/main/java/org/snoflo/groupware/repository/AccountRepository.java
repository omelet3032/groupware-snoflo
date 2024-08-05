package org.snoflo.groupware.repository;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.model.Account;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.Collection;
import org.springframework.dao.DataAccessException;

@Repository
public interface AccountRepository extends CrudRepository<Account, Long> {
    
    @Query("SELECT * FROM account")
    @Transactional(readOnly = true)
    Collection<AccountDto> findAllAccount() throws DataAccessException;
}
