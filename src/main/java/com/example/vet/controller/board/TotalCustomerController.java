package com.example.vet.controller.board;

import com.example.vet.model.BookingVO;
import com.example.vet.model.MasterVO;
import com.example.vet.service.board.TotalCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("TotalCustomer/*")
public class TotalCustomerController {

    private static final Logger logger = LoggerFactory.getLogger(TotalCustomerController.class);

    private final TotalCustomerService totalCustomerService;


    public TotalCustomerController(TotalCustomerService totalCustomerService) {
        this.totalCustomerService = totalCustomerService;
    }

    @GetMapping("CustomerList")
    public String list(Model model) {
        MasterVO masterVO = null;
        List<Map<String, Object>> cList = totalCustomerService.Select(masterVO);
        logger.info(cList.toString());
        model.addAttribute("cList", cList);
        return "pages/customerDB/TotalCustomerList";
    }
}