package com.example.vet.controller.adopt;


import com.example.vet.model.adopt.MissingAnimalResVO;
import com.example.vet.service.adopt.AdoptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/v1/adopt")
@RequiredArgsConstructor
public class AdoptController {

    private AdoptService adoptService;

    @GetMapping("/missed")
    public MissingAnimalResVO getMissedAnimal(){
        return new MissingAnimalResVO();
    }

}
