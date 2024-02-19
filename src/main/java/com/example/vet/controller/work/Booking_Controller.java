package com.example.vet.controller.work;

import com.example.vet.model.BookingVO;
import com.example.vet.service.work.Booking_Service;
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
@RequestMapping("qna")

public class Booking_Controller {

    private static final Logger logger = LoggerFactory.getLogger(Booking_Controller.class);

    private final Booking_Service bookingService;


    public Booking_Controller(Booking_Service bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("qnaList")
    public String list(Model model){
        BookingVO bookingVO = null;
        List<Map<String,Object>> bList = bookingService.Select(bookingVO);
        logger.info(bList.toString());
        model.addAttribute("bList", bList);
        return "pages/docbook/bookingMainCustomer";
    }
    @GetMapping("qnaDetail")
    public String listDetail(@RequestParam int bookingPK, Model model) {

        BookingVO bookingVO = null;
        bookingVO.setBookingPk(bookingPK);
        logger.info(bookingVO.toString());
        List<Map<String,Object>> nList = bookingService.Select(bookingVO);

        model.addAttribute("nList", nList);
        return "pages/docbook/bookingMainCustomer";
    }

    @PostMapping("qnaUpdate")
    public String update(@RequestParam Map<String, Object> rmap) {
        BookingVO bookingVO = new BookingVO();
        Integer bookingPK = Integer.parseInt(rmap.get("BOOKING_PK").toString());
        bookingVO.setBookingPk(bookingPK);

        // 시작시간
        String bookingstart = (String) rmap.get("BOOKING_START");
        bookingVO.setBookingStart(bookingstart);

        // 종료시간
        String bookingEnd = (String) rmap.get("BOOKING_END");
        bookingVO.setBookingEnd(bookingEnd);

        //서비스종류
        String bookingtype = (String) rmap.get("BOOKING_TYPE");
        bookingVO.setBookingType(bookingtype);

        //동물 pk
        Integer animalPK = Integer.parseInt(rmap.get("ANIMAL_PK").toString());
        bookingVO.setAnimalPk(animalPK);


        logger.info(bookingVO.toString());

        int updated = bookingService.Update(bookingVO);

        if (updated == 1) {
            return "redirect:bookingMainCustomer";
        } else {
            return "error";
        }
    }

    @PostMapping("qnaInsert")
    public String insert(@RequestParam Map<String, Object> rmap) {
        BookingVO bookingVO = new BookingVO();

        // 시작시간
        String bookingstart = (String) rmap.get("BOOKING_START");
        bookingVO.setBookingStart(bookingstart);

        // 종료시간
        String bookingEnd = (String) rmap.get("BOOKING_END");
        bookingVO.setBookingEnd(bookingEnd);

        //서비스종류
        String bookingtype = (String) rmap.get("BOOKING_TYPE");
        bookingVO.setBookingType(bookingtype);

        //동물 pk
        Integer animalPK = Integer.parseInt(rmap.get("ANIMAL_PK").toString());
        bookingVO.setAnimalPk(animalPK);


        logger.info(bookingVO.toString());

        int updated = bookingService.Update(bookingVO);

        if (updated == 1) {
            return "redirect:bookingMainCustomer";
        } else {
            return "error";
        }
    }


    @PostMapping("qnaDelete")
    public String Delete(int bookingPK) {

        int deleted = bookingService.Delete(bookingPK);

        if(deleted == 1) {
            return "redirect:bookingMainCustomer";
        }
        else{
            return "error";
        }
    }

}
