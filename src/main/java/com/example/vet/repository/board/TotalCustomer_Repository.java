package com.example.vet.repository.board;

import com.example.vet.model.MasterVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

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
        MasterVO masterVO1 = sqlSessionTemplate.selectOne("detailSelect", masterVO);
        logger.info(masterVO1.toString());
        return masterVO1;
    }

    public int Insert(MasterVO masterVO) {
        int rowsInserted = sqlSessionTemplate.insert("masterInsert", masterVO);
        return rowsInserted>0 ? 1 : 0;
    }

    public int Update(MasterVO masterVO) {
        int rowsUpdated = sqlSessionTemplate.update("masterUpdate", masterVO);
        return rowsUpdated>0 ? 1 : 0;
    }
}
