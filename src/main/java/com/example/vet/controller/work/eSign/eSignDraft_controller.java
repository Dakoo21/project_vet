package com.example.vet.controller.work.eSign;

import com.example.vet.model.SignDocument;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("eSignDraft/*")
@Slf4j
public class eSignDraft_controller {

    // private final Abandon_Pet_Service abandon_pet_service;
    // public eSignDraft_controller(Abandon_Pet_Service abandon_pet_service){this.abandon_pet_service = abandon_pet_service;}

    @GetMapping("draftInsertPage")
    public String draftInsertPage(){
        // List<MissedAnimal> mAnimalList = abandon_pet_service.Select();
        return "pages/esignbox/esignInsert";
    }
    @GetMapping("draftInsert")
    public String draftInsert(SignDocument signDocument){
        return "pages/esignbox/docsBox";
    }

}
