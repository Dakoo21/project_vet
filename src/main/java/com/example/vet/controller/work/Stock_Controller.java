package com.example.vet.controller.work;

import com.example.vet.model.StockCommonVO;
import com.example.vet.service.work.Stock_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stock/*")
@Slf4j
public class Stock_Controller {
    private final Stock_Service stock_service;

    public Stock_Controller(Stock_Service stock_service) {
        this.stock_service = stock_service;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 24.02.25
     기능 : 재고 디테일 페이지 연결
     **********************************************************************************/

    @GetMapping("stockInsertPage")
    public String StockInsertPage () {
        return "pages/stock/stockInsert";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 24.02.25
     기능 : 재고 전체 조회
     **********************************************************************************/

    @GetMapping("")
    public String StockList (Model model, StockCommonVO stockCommonVO) {
        log.info("재고 전체 조회 controller 시작");
        List<Map<String, Object>> stockList = null;
        stockList = stock_service.stockList(stockCommonVO);
        model.addAttribute("stockList", stockList);
        return "pages/stock/stockList";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 24.02.25
     기능 : 재고 등록
     **********************************************************************************/

    @PostMapping("stockInsert")
    public String StockInsert(StockCommonVO stockCommonVO) {
        log.info("재고 등록 시작");
        log.info(stockCommonVO.toString());
        int result;
        String path;
        result = stock_service.stockInsert(stockCommonVO);
        if (result == 1) {
            path = "pages/stock/";
        } else {
            path = "stockInsertError.jsp";
        }
        return path;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 24.02.25
     기능 : 재고 삭제
     **********************************************************************************/

    @PostMapping("stockDelete")
    public String StockDelete (int stock_common_pk) {
        int result;
        String path;
        result = stock_service.StockDelete(stock_common_pk);
        if (result == 1) {
            path = "";
        } else {
            path = "";
        }
        return path;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 24.02.25
     기능 : 재고 디테일 조회
     **********************************************************************************/

    @PostMapping("stockUpdate")
    public String StrockUpdate (StockCommonVO stockCommonVO) {
        int result;
        String path;
        result = stock_service.stockUpdate(stockCommonVO);
        if (result == 1) {
            path = "";
        } else {
            path = "";
        }
        return path;
    }
}
