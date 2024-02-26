package com.example.vet.service.board;

import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.repository.board.Abandon_Pet_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class Abandon_Pet_Service {
    private final Abandon_Pet_Repository abandon_pet_repository;
    public Abandon_Pet_Service(Abandon_Pet_Repository abandon_pet_repository){
        this.abandon_pet_repository=abandon_pet_repository;
    }
    public List<MissedAnimal> Select(){
        List<MissedAnimal> mAnimalList = new ArrayList<>();
        mAnimalList = abandon_pet_repository.Select();
        log.info(mAnimalList.toString());
        return mAnimalList;
    }
}
