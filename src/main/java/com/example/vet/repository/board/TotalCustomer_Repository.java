package com.example.vet.repository.board;

import com.example.vet.model.MasterVO;
import com.example.vet.model.TotalCustomerUpdateVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Repository
public class TotalCustomer_Repository {
    Logger logger = LoggerFactory.getLogger(TotalCustomer_Repository.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public TotalCustomer_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> Select (MasterVO masterVO){
        List<Map<String, Object>>cList = sqlSessionTemplate.selectList("masterSelect", masterVO);
        logger.info(cList.toString());
        return cList;
    }

    public MasterVO Detail(MasterVO masterVO){
        MasterVO masterVO1 = sqlSessionTemplate.selectOne("masterDetail", masterVO);
        logger.info(masterVO1.toString());
        logger.info("============");
        return masterVO1;
    }

    public int Insert(MasterVO masterVO) {
        int rowsInserted = sqlSessionTemplate.insert("masterInsert", masterVO);
        return rowsInserted>0 ? 1 : 0;
    }

    public void update(TotalCustomerUpdateVO totalCustomerUpdateVO) {
        sqlSessionTemplate.update("masterUpdate", totalCustomerUpdateVO);
    }

}
