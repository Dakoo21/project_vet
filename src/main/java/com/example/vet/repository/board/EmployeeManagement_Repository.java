package com.example.vet.repository.board;

import com.example.vet.model.Member;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Slf4j
public class EmployeeManagement_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    public EmployeeManagement_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> employList(Map<String, Object> employeeMap) {
        List<Map<String, Object>> employList = null;
        log.info(employeeMap.toString());
        employList = sqlSessionTemplate.selectList("employeeList", employeeMap);
        return employList;
    }

    public int employeeDelete(int MEMBER_PK) {
        int result;
        result = sqlSessionTemplate.delete("employeeDelete", MEMBER_PK);
        return result;
    }
}
