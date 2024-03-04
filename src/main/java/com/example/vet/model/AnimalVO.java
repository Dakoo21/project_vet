package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AnimalVO {
    private int animal_Pk;
    private String animal_Nm;
    private String animal_bdate;
    private String animal_species;
    private String animal_breed;
    private long animal_weight;
    private String animal_sex;
    private String  animal_neut;
    private int masterPk;
    private int userPk;


    @Builder
    public AnimalVO(int animal_Pk, String animalNm, String animalBdate, String animalSpecies, String animalBreed, long animalWeight, int userPk, String animalSex, String animalNeut, int masterPk){
        this.animal_Pk=animal_Pk;
        this.animal_Nm=animalNm;
        this.animal_bdate=animalBdate;
        this.animal_species=animalSpecies;
        this.animal_breed=animalBreed;
        this.animal_weight=animalWeight;
        this.userPk=userPk;
        this.animal_sex=animalSex;
        this.animal_neut=animalNeut;
        this.masterPk=masterPk;

    }
}
g