package com.example.vet.repository.board;

import com.example.vet.model.adopt.MissedAnimal;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Abandon_Pet_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;
    public Abandon_Pet_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
    public List<MissedAnimal> Select() {
        List<MissedAnimal> mAnimalList = sqlSessionTemplate.selectList("selectAnimals");
        return mAnimalList;
    }
}
