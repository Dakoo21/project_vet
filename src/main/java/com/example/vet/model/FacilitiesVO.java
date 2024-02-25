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
    private String facilityReserveDt;
    private String startTime;
    private String endTime;

    private String facilityRemarks;

    @Builder
    public FacilitiesVO(int facilityReserveId, String facilityNm, String userNm, String animalNm, String facilityReserveDt, String startTime, String endTime, String facilityRemarks) {
        this.facilityReserveId = facilityReserveId;
        this.facilityNm = facilityNm;
        this.userNm = userNm;
        this.animalNm = animalNm;
        this.facilityReserveDt = facilityReserveDt;
        this.startTime = startTime;
        this.endTime = endTime;
        this.facilityRemarks = facilityRemarks;
    }
}
