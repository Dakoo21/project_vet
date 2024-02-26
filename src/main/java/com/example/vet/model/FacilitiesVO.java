package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FacilitiesVO {
    private int facilityReserveId;
    private String facilityNm;
    private String userNm;
    private String animalNm;
    private int animalId;
    private String animalBdate;
    private int masterPk;
    private int memberPk;

    private String facilityReserveDt;
    private String startTime;
    private String endTime;
    private int startInterval;
    private int endInterval;
    private int timeInterval;

    private String facilityRemarks;

    @Builder
    public FacilitiesVO(int facilityReserveId, String facilityNm, String userNm, String animalNm,  int animalId, String animalBdate, int masterPk, int memberPk, String facilityReserveDt,String startTime, String endTime, int startInterval, int endInterval, int timeInterval, String facilityRemarks) {
        this.facilityReserveId = facilityReserveId;
        this.facilityNm = facilityNm;
        this.userNm = userNm;
        this.animalNm = animalNm;
        this.animalId = animalId;
        this.animalBdate = animalBdate;
        this.masterPk= masterPk;
        this.memberPk= memberPk;
        this.facilityReserveDt = facilityReserveDt;
        this.startTime = startTime;
        this.endTime = endTime;
        this.startInterval = startInterval;
        this.endInterval = endInterval;
        this.timeInterval = timeInterval;
        this.facilityRemarks = facilityRemarks;
    }
}
