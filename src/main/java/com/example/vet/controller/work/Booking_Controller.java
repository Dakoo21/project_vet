package com.example.vet.controller.work;

import com.example.vet.model.AnimalVO;
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

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("booking")

public class Booking_Controller {

    private static final Logger logger = LoggerFactory.getLogger(Booking_Controller.class);

    private final Booking_Service bookingService;


    public Booking_Controller(Booking_Service bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("bookingList")
    public String list(Model model){
        BookingVO bookingVO = null;
        List<Map<String,Object>> bList = bookingService.Select(bookingVO);
        logger.info(bList.toString());
        model.addAttribute("bList", bList);
        return "pages/docbook/bookingMainAdmin";
    }
    @GetMapping("bookingDetail")
    public String listDetail(@RequestParam int bookingPK, Model model) {

        BookingVO bookingVO = new BookingVO();
        bookingVO.setBookingPk(bookingPK);

        List<Map<String,Object>> nList = bookingService.Select(bookingVO);
        logger.info(nList.toString());
        model.addAttribute("nList", nList);
        return "pages/docbook/bookingDetail";
    }

    @PostMapping("bookingUpdate")
    public String update(@RequestParam Map<String, Object> rmap) throws ParseException {
        BookingVO bookingVO = new BookingVO();

        //pk
        Integer bookingPk = Integer.parseInt(rmap.get("bookingPk").toString());
        bookingVO.setBookingPk(bookingPk);
        // 시작시간
        String bookingstart = (String) rmap.get("bookingStart");
        bookingVO.setBookingStart(bookingstart);

        // 종료시간
        String bookingEnd = (String) rmap.get("bookingEnd");
        bookingVO.setBookingEnd(bookingEnd);

        //서비스종류
        String bookingtype = (String) rmap.get("bookingType");
        bookingVO.setBookingType(bookingtype);

        String bookingDate = (String) rmap.get("bookingDate");

        bookingVO.setBookingDate(bookingDate);

        //동물 pk
        Integer animalPK = Integer.parseInt(rmap.get("animalPk").toString());
        bookingVO.setAnimalPk(animalPK);

        //직원, 서비스 담당자
        Integer userPK = Integer.parseInt(rmap.get("userPk").toString());
        bookingVO.setAnimalPk(userPK);

        //상태 - 무조건 '예약됨' 으로
        Integer commonCodePk = 123;
        bookingVO.setCommonCodePk(commonCodePk);



        logger.info(bookingVO.toString());

        int updated = bookingService.Update(bookingVO);

        if (updated == 1) {
            return "redirect:bookingList";
        } else {
            return "error";
        }
    }

    @PostMapping("bookingInsert")
    public String insert(@RequestParam Map<String, Object> rmap) throws ParseException {
        BookingVO bookingVO = new BookingVO();

        // 시작시간
        String bookingStart = (String) rmap.get("bookingStart");
        bookingVO.setBookingStart(bookingStart);

        // 종료시간
        String bookingEnd = (String) rmap.get("bookingEnd");
        bookingVO.setBookingEnd(bookingEnd);

        //서비스종류
        String bookingType = (String) rmap.get("bookingType");
        bookingVO.setBookingType(bookingType);


        String bookingDate = (String) rmap.get("bookingDate");
        logger.info(bookingDate);
        // 기존 형식의 날짜 포맷 지정

        bookingVO.setBookingDate(bookingDate);

        //동물 pk
        Integer animalPK = Integer.parseInt(rmap.get("animalPk").toString());
        bookingVO.setAnimalPk(animalPK);

        //직원, 서비스 담당자
        Integer userPK = Integer.parseInt(rmap.get("userPk").toString());
        bookingVO.setUserPk(userPK);

        //상태 - 무조건 '예약됨' 으로
        Integer commonCodePk = 123;
        bookingVO.setCommonCodePk(commonCodePk);



        logger.info(bookingVO.toString());

        int inserted = bookingService.Insert(bookingVO);

        if (inserted == 1) {
            return "redirect:bookingList";
        } else {
            return "error";
        }
    }


    @PostMapping("bookingDelete")
    public String Delete(int bookingPK) {

        int deleted = bookingService.Delete(bookingPK);

        if(deleted == 1) {
            return "redirect:bookingList";
        }
        else{
            return "error";
        }
    }
    @GetMapping("bookingRegister")
    public String Reg(Model model){
        AnimalVO animalVO = new AnimalVO();
        List<Map<String,Object>> aList = bookingService.SelectAnimal(animalVO);
        logger.info(aList.toString());
        model.addAttribute("aList", aList);

        return "pages/docbook/bookingRegister";
    }

}
