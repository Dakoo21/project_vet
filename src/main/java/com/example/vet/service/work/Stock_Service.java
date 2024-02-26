package com.example.vet.service.work;

import com.example.vet.model.StockCommonVO;
import com.example.vet.repository.work.Stock_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class Stock_Service {

    private final Stock_Repository stock_repository;

    public Stock_Service(Stock_Repository stock_repository) {
        this.stock_repository = stock_repository;
    }

    public List<Map<String, Object>> stockList(StockCommonVO stockCommonVO) {
        log.info("재고 전체 조회 service 시작");
        List<Map<String, Object>> stockList = null;
        stockList = stock_repository.StockList(stockCommonVO);
        return stockList;
    }

    public int stockInsert(StockCommonVO stockCommonVO) {
        log.info("재고 등록 서비스");
        int result;
        result = stock_repository.stockInsert(stockCommonVO);
        return result;
    }

    public int StockDelete(int stock_common_pk) {
        int result;
        result = stock_repository.StockDelete(stock_common_pk);
        return result;
    }

    public int stockUpdate(StockCommonVO stockCommonVO) {
        int result;
        result = stock_repository.stockUpdate(stockCommonVO);
        return result;
    }
}
