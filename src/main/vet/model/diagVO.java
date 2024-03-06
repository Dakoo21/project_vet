package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class diagVO {
    private int diagPk;
    private String diagPrescription;
    private int bookingPk;
    private String digestiveSystem;
    private String circulatorySystem;
    private String respiratorySystem;
    private String nervousSystem;
    private String endocrineSystem;
    private String eyes;
    private String dermatology;
    private String orthopedics;
    private String thoracicSurgery;
    private String neurosurgery;
    private String abdominalSurgery;
    private String dental;

    @Builder
    public diagVO(int diagPk, String diagPrescription, int bookingPk, String digestiveSystem, String circulatorySystem,
                      String respiratorySystem, String nervousSystem, String endocrineSystem, String eyes,
                      String dermatology, String orthopedics, String thoracicSurgery, String neurosurgery,
                      String abdominalSurgery, String dental) {
        this.diagPk = diagPk;
        this.diagPrescription = diagPrescription;
        this.bookingPk = bookingPk;
        this.digestiveSystem = digestiveSystem;
        this.circulatorySystem = circulatorySystem;
        this.respiratorySystem = respiratorySystem;
        this.nervousSystem = nervousSystem;
        this.endocrineSystem = endocrineSystem;
        this.eyes = eyes;
        this.dermatology = dermatology;
        this.orthopedics = orthopedics;
        this.thoracicSurgery = thoracicSurgery;
        this.neurosurgery = neurosurgery;
        this.abdominalSurgery = abdominalSurgery;
        this.dental = dental;
    }
}
