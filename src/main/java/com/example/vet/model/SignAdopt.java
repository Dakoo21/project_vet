package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignAdopt {
    private Integer ADOPT_PK;
    private String ADOPT_NM;
    private Integer DESERTION_NO;
    private String ADOPT_BDATE;
    private String ADOPT_SPECIES;
    private String ADOPT_BREED;
    private String ADOPT_WEIGHT;
    private String ADOPT_SEX;
    private String  ADOPT_NEUT;
    private Integer MASTERPK;
    private String ADOPT_REASON;

    @Builder
    public SignAdopt(Integer ADOPT_PK, String ADOPT_NM, Integer DESERTION_NO, String ADOPT_BDATE, String ADOPT_SPECIES, String ADOPT_BREED, String ADOPT_WEIGHT, String ADOPT_SEX, String ADOPT_NEUT, Integer MASTERPK, String ADOPT_REASON) {
        this.ADOPT_PK = ADOPT_PK;
        this.ADOPT_NM = ADOPT_NM;
        this.DESERTION_NO = DESERTION_NO;
        this.ADOPT_BDATE = ADOPT_BDATE;
        this.ADOPT_SPECIES = ADOPT_SPECIES;
        this.ADOPT_BREED = ADOPT_BREED;
        this.ADOPT_WEIGHT = ADOPT_WEIGHT;
        this.ADOPT_SEX = ADOPT_SEX;
        this.ADOPT_NEUT = ADOPT_NEUT;
        this.MASTERPK = MASTERPK;
        this.ADOPT_REASON = ADOPT_REASON;
    }




}
