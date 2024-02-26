package com.example.vet.controller.board;

import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.service.board.Abandon_Pet_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("aAnimals/*")
@Slf4j
public class Abandon_Pet_Controller {
    private final Abandon_Pet_Service abandon_pet_service;
    public Abandon_Pet_Controller(Abandon_Pet_Service abandonPetService) {
        abandon_pet_service = abandonPetService;
    }

    @GetMapping("selectList")
    @ResponseBody
    public List<MissedAnimal> docsBoxList(){
        List<MissedAnimal> mAnimalList = abandon_pet_service.Select();
        log.info(mAnimalList.toString());
        // model.addAttribute("mAnimalList", mAnimalList);
        return abandon_pet_service.Select();
    }
}
