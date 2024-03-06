package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignAdopt {
    private int adopt_pk;
    private String adopt_nm;
    private int desertion_no;
    private String adopt_bdate;
    private String adopt_species;
    private String adopt_breed;
    private String adopt_weight;
    private String adopt_sex;
    private String  adopt_neut;
    private int masterpk;

    @Builder
    public SignAdopt(int adopt_pk, String adopt_nm, String adopt_bdate,
                   String adopt_species, String adopt_breed, String adopt_weight,
                   String adopt_sex, String adopt_neut, int masterpk){
        this.adopt_pk=adopt_pk;
        this.adopt_nm=adopt_nm;
        this.adopt_bdate=adopt_bdate;
        this.adopt_species=adopt_species;
        this.adopt_breed=adopt_breed;
        this.adopt_weight=adopt_weight;
        this.adopt_sex=adopt_sex;
        this.adopt_neut=adopt_neut;
        this.masterpk=masterpk;
    }
}
