package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class attachedVO {
    private int attachedPk;
    private String attachedNm;
    private String attachedRoute;
    private String attachedOriginalName;
    private String attachedType;
    private int attachedByte;


    @Builder
    public attachedVO(int attachedPk, String attachedNm, String attachedRoute, String attachedOriginalName, String attachedType, int attachedByte) {
        this.attachedPk = attachedPk;
        this.attachedNm = attachedNm;
        this.attachedRoute = attachedRoute;
        this.attachedOriginalName = attachedOriginalName;
        this.attachedType = attachedType;
        this.attachedByte = attachedByte;
    }
}
