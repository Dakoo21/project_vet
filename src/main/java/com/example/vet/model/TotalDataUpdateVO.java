package com.example.vet.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @ToString
@Getter
public class TotalDataUpdateVO {

    private String master_nm;
    private int animalPk;
    private String master_pnumber;
    private String master_address;
    private String master_email;
    private String animal_nm;
    private String animal_breed;
    private String animal_sex;
    private String  animal_bdate;
    private String animal_neut;
    private String animal_species;
    private long animal_weight;
    private int masterpk;
}
