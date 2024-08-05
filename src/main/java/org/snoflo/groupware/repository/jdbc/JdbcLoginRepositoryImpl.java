package org.snoflo.groupware.repository.jdbc;

import javax.sql.DataSource;

import org.snoflo.groupware.dto.AccountDto;
import org.snoflo.groupware.repository.LoginRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
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

        String sql = "SELECT employee_code, email, password, role FROM account WHERE email = :email AND password = :password";

        AccountDto accountDto = new AccountDto();
        accountDto.setEmail(email);
        accountDto.setPassword(password);

        SqlParameterSource params = new BeanPropertySqlParameterSource(accountDto);
        
        try {
            return namedParameterJdbcTemplate.queryForObject(sql, params, (rs, rowNum) -> {
                AccountDto account = new AccountDto();
                account.setEmployeeCode(rs.getInt("employee_code"));
                account.setEmail(rs.getString("email"));
                account.setEmail(rs.getString("password"));
                account.setRole(rs.getString("role"));
                return account;
            });
        } catch (EmptyResultDataAccessException e) {
            return null; // 결과가 없을 경우 null 반환
        }

        // accountDto = namedParameterJdbcTemplate.queryForObject(sql, params, new
        // BeanPropertyRowMapper<>(AccountDto.class));

        /*
         * accountDto = namedParameterJdbcTemplate.queryForObject(sql, params, (rs,
         * rowNum) -> {
         * AccountDto account = new AccountDto();
         * account.setEmployeeCode(rs.getInt("employee_code"));
         * account.setEmail(rs.getString("email"));
         * account.setPassword(rs.getString("password"));
         * account.setRole(rs.getString("role"));
         * return account;
         * });
         * 
         * return accountDto;
         */

    }

}
