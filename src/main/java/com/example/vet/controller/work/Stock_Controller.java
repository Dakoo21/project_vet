package com.example.vet.controller.work;


import com.example.vet.model.BookingVO;
import com.example.vet.model.StockCommonVO;
import com.example.vet.service.work.Stock_Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stock")
public class Stock_Controller {
//    Logger logger = LoggerFactory.getLogger(Stock_Controller.class);
//
//    private final Stock_Service stockService;
//
//    public Stock_Controller(Stock_Service stockService) {
//        this.stockService = stockService;
//    }
//
//    @GetMapping("stockList")
//    public String select(Model model){
//        StockCommonVO stockCommonVO = null;
//        List<Map<String,Object>> sList = stockService.Select(stockCommonVO);
//        logger.info(sList.toString());
//        model.addAttribute("sList", sList);
//        return "pages/stock/stockList";
//
//    }
//
//    @GetMapping("stockDetail")
//    public String listDetail(@RequestParam int stockPK, Model model) {
//
//        StockCommonVO stockCommonVO = null;
//        stockCommonVO.setStockCommonPk(stockPK);
//        logger.info(stockCommonVO.toString());
//        List<Map<String,Object>> sList = stockService.Select(stockPK);
//
//        model.addAttribute("sList", sList);
//        return "pages/docbook/bookingMainCustomer";
//    }
//
//    @PostMapping("bookingUpdate")
//    public String update(@RequestParam Map<String, Object> rmap) {
//        BookingVO bookingVO = new BookingVO();
//        Integer bookingPK = Integer.parseInt(rmap.get("BOOKING_PK").toString());
//        bookingVO.setBookingPk(bookingPK);
//
//        // 시작시간
//        String bookingstart = (String) rmap.get("BOOKING_START");
//        bookingVO.setBookingStart(bookingstart);
//
//        // 종료시간
//        String bookingEnd = (String) rmap.get("BOOKING_END");
//        bookingVO.setBookingEnd(bookingEnd);
//
//        //서비스종류
//        String bookingtype = (String) rmap.get("BOOKING_TYPE");
//        bookingVO.setBookingType(bookingtype);
//
//        //동물 pk
//        Integer animalPK = Integer.parseInt(rmap.get("ANIMAL_PK").toString());
//        bookingVO.setAnimalPk(animalPK);
//
//
//        logger.info(bookingVO.toString());
//
//        int updated = bookingService.Update(bookingVO);
//
//        if (updated == 1) {
//            return "redirect:bookingMainCustomer";
//        } else {
//            return "error";
//        }
//    }
//
//    @PostMapping("bookingInsert")
//    public String insert(@RequestParam Map<String, Object> rmap) {
//        BookingVO bookingVO = new BookingVO();
//
//        // 시작시간
//        String bookingstart = (String) rmap.get("BOOKING_START");
//        bookingVO.setBookingStart(bookingstart);
//
//        // 종료시간
//        String bookingEnd = (String) rmap.get("BOOKING_END");
//        bookingVO.setBookingEnd(bookingEnd);
//
//        //서비스종류
//        String bookingtype = (String) rmap.get("BOOKING_TYPE");
//        bookingVO.setBookingType(bookingtype);
//
//        //동물 pk
//        Integer animalPK = Integer.parseInt(rmap.get("ANIMAL_PK").toString());
//        bookingVO.setAnimalPk(animalPK);
//
//
//        logger.info(bookingVO.toString());
//
//        int updated = bookingService.Update(bookingVO);
//
//        if (updated == 1) {
//            return "redirect:bookingMainCustomer";
//        } else {
//            return "error";
//        }
//    }
//
//
//    @PostMapping("bookingDelete")
//    public String Delete(int bookingPK) {
//
//        int deleted = bookingService.Delete(bookingPK);
//
//        if(deleted == 1) {
//            return "redirect:bookingMainCustomer";
//        }
//        else{
//            return "error";
//        }
//    }
}
