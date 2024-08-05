package org.snoflo.groupware.repository.jdbc;

import java.util.Collection;
import java.util.List;

import javax.sql.DataSource;

import org.snoflo.groupware.dto.EmployeeDto;
import org.snoflo.groupware.repository.EmployeeRepository;
import org.springframework.context.annotation.Profile;
import org.springframework.dao.DataAccessException;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;

@Repository
@Profile("jdbc")
public class JdbcEmployeeRepositoryImpl implements EmployeeRepository {

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public JdbcEmployeeRepositoryImpl(DataSource dataSource) {

        this.namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);

    }

    /*
     * 1. employee 전체를 조회하는 쿼리를 작성
     * 2. 쿼리의 반환값을 객체로 매핑
     * 3. 매핑된 객체를 반환
     */
    @Override
    public Collection<EmployeeDto> findAll() throws DataAccessException {

        String sql = """
                SELECT e.code, e.name, d.name AS department_name, jp.name AS job_position_name, jt.name AS job_type_name, e.manager_code, e.status
                FROM employee e
                JOIN department d ON d.code = e.department_code
                JOIN job_position jp ON jp.code = e.job_position_code
                JOIN job_type jt ON jt.code = e.job_type_code
                ORDER BY e.code ASC;
                """;

        List<EmployeeDto> employees = this.namedParameterJdbcTemplate.query(sql,
                BeanPropertyRowMapper.newInstance(EmployeeDto.class));
        return employees;
    }

    @Override
    public Collection<EmployeeDto> findByName(@Param("name") String name) throws DataAccessException {

        String sql = """
                SELECT e.code, e.name, d.name AS department_name, jp.name AS job_position_name, jt.name AS job_type_name, e.manager_code, e.status
                FROM employee e
                JOIN department d ON d.code = e.department_code
                JOIN job_position jp ON jp.code = e.job_position_code
                JOIN job_type jt ON jt.code = e.job_type_code
                WHERE e.name = :name
                ORDER BY e.code ASC;
                """;
        EmployeeDto employeeDto = new EmployeeDto();
        employeeDto.setName(name);
        SqlParameterSource params = new BeanPropertySqlParameterSource(employeeDto);

        List<EmployeeDto> employees = this.namedParameterJdbcTemplate.query(sql, params,
                BeanPropertyRowMapper.newInstance(EmployeeDto.class));
        return employees;
    }

    
}
