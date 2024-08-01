package org.snoflo.groupware.repository.jdbc;

import javax.sql.DataSource;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.repository.LoginRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Profile("jdbc")
public class JdbcLoginRepositoryImpl implements LoginRepository {

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public JdbcLoginRepositoryImpl(DataSource dataSource) {
        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
    }

    @Override
    @Transactional(readOnly = true)
    public AccountDto findByEmailAndPassword(@Param("email") String email, @Param("password") String password) {

        String sql = "SELECT employee_code FROM account WHERE email = :email AND password = :password";

        AccountDto accountDto = new AccountDto();
        accountDto.setEmail(email);
        accountDto.setPassword(password);

        SqlParameterSource params = new BeanPropertySqlParameterSource(accountDto);
        // accountDto = namedParameterJdbcTemplate.queryForObject(sql, params, new
        // BeanPropertyRowMapper<>(AccountDto.class));
        accountDto = namedParameterJdbcTemplate.queryForObject(sql, params, (rs, rowNum) -> {
            AccountDto account = new AccountDto();
            account.setEmployeeCode(rs.getInt("employee_code"));
            return account;
        });

        return accountDto;
    }

}
