package com.example.vet.controller.work;

import com.example.vet.service.work.Booking_Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("booking/")
public class Booking_Controller {

    private static final Logger logger = LoggerFactory.getLogger(Booking_Controller.class);

    private final Booking_Service bookingService;

    public Booking_Controller(Booking_Service bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping("bookingList")
    public String list(Model model) {
        List<Map<String, Object>> bList = bookingService.bookingSelect();
        logger.info(bList.toString());
        model.addAttribute("bList", bList);
        return "pages/docbook/bookingMainAdmin";
    }

    @GetMapping("bookingDetail")
    public String listDetail(@RequestParam int bookingPK, Model model) {
        List<Map<String, Object>> nList = bookingService.selectBookingDetail(bookingPK);
        logger.info(nList.toString());
        model.addAttribute("nList", nList);
        return "pages/docbook/bookingDetail";
    }

    @PostMapping("bookingUpdate")
    public String update(@RequestParam Map<String, Object> rmap) {
        int updated = bookingService.bookingUpdate(rmap);
        if (updated == 1) {
            return "redirect:bookingList";
        } else {
            return "error";
        }
    }

    @PostMapping("bookingInsert")
    public String insert(@RequestParam Map<String, Object> rmap) {
        int inserted = bookingService.bookingInsert(rmap);
        if (inserted == 1) {
            return "redirect:bookingList";
        } else {
            return "error";
        }
    }

    @PostMapping("bookingDelete")
    public String delete(@RequestParam int bookingPK) {
        int deleted = bookingService.bookingDelete(bookingPK);
        if (deleted == 1) {
            return "redirect:bookingList";
        } else {
            return "error";
        }
    }

    @GetMapping("bookingRegister")
    public String registration(Model model) {
        List<Map<String, Object>> aList = bookingService.SelectAnimal();
        logger.info(aList.toString());
        model.addAttribute("aList", aList);
        return "pages/docbook/bookingRegister";
    }

    @ResponseBody
    @GetMapping("GetAnimals")
    public List<Map<String, Object>> getAnimals(@RequestParam("animalNm") String animalNm) {
        logger.info(animalNm);
        List<Map<String, Object>> animList = bookingService.selectAnimalsByName(animalNm);
        logger.info(animList.toString());
        return animList;
    }
}



