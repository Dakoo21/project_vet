package com.example.vet.repository.work;

import com.example.vet.model.StockCommonVO;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Slf4j
public class Stock_Repository {
    
    private final SqlSessionTemplate sqlSessionTemplate;

    public Stock_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> StockList(StockCommonVO stockCommonVO) {
        log.info("재고 조회 Repository 시작");
        List<Map<String, Object>> stockList = null;
        stockList = sqlSessionTemplate.selectList("stockList", stockList);
        return stockList;
    }

    public int stockInsert(StockCommonVO stockCommonVO) {
        log.info("재고 등록 레포");
        int result;
        result = sqlSessionTemplate.insert("stockInsert", stockCommonVO);
        return result;
    }

    public int StockDelete(int stock_common_pk) {
        int result;
        result = sqlSessionTemplate.delete("stockDelete", stock_common_pk);
        return result;
    }

    public int stockUpdate(StockCommonVO stockCommonVO) {
        int result;
        result = sqlSessionTemplate.update("stockUpdate", stockCommonVO);
        return result;
    }
}
