package com.example.vet.service.board;

import com.example.vet.model.Member;
import com.example.vet.repository.board.EmployeeManagement_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class EmployeeManagement_Service {

    private final EmployeeManagement_Repository employeeManagement_repository;

    public EmployeeManagement_Service(EmployeeManagement_Repository employeeManagement_repository) {
        this.employeeManagement_repository = employeeManagement_repository;
    }



    public List<Map<String, Object>> employeeList(Map<String, Object> employeeMap) {
        List<Map<String, Object>> employList = null;
        employList = employeeManagement_repository.employList(employeeMap);
        return employList;
    }
    public int employeeDelete(int MEMBER_PK) {
        int result;
        result = employeeManagement_repository.employeeDelete(MEMBER_PK);
        return result;
    }
}
