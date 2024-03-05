package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AnimalVO {
    private int animalPk;
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
    public AnimalVO(int animalPk, String animal_Nm, String animal_bdate, String animal_species, String animal_breed, long animal_weight, int userPk, String animal_sex, String animal_neut, int masterPk){
        this.animalPk = animalPk;
        this.animal_Nm = animal_Nm;
        this.animal_bdate = animal_bdate;
        this.animal_species = animal_species;
        this.animal_breed = animal_breed;
        this.animal_weight = animal_weight;
        this.userPk = userPk;
        this.animal_sex = animal_sex;
        this.animal_neut = animal_neut;
        this.masterPk = masterPk;

    }
}
