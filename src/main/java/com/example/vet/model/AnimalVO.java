package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AnimalVO {
    private int animalPk;
    private String animalNm;
    private String animalBdate;
    private String animalSpecies;
    private String animalBreed;
    private long animalWeight;
    private int userPk;
    private String animalSex;
    private String animalNeut;
    private int masterPk;


    @Builder
    public AnimalVO(int animalPk, String animalNm, String animalBdate, String animalSpecies, String animalBreed, long animalWeight, int userPk, String animalSex, String animalNeut, int masterPk){
        this.animalPk=animalPk;
        this.animalNm=animalNm;
        this.animalBdate=animalBdate;
        this.animalSpecies=animalSpecies;
        this.animalBreed=animalBreed;
        this.animalWeight=animalWeight;
        this.userPk=userPk;
        this.animalSex=animalSex;
        this.animalNeut=animalNeut;
        this.masterPk=masterPk;

    }
}
