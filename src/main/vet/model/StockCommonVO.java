package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StockCommonVO {
    private int stockCommonPk;
    private String stockCommonNm;
    private int stockCommonSellPrice;
    private String stockCommonCode;
    private String stockCommonType;
    private int attachedPk;

    @Builder
    public StockCommonVO(int stockCommonPk, String stockCommonNm, int stockCommonSellPrice, String stockCommonCode, String stockCommonType, int attachedPk) {
        this.stockCommonPk = stockCommonPk;
        this.stockCommonNm = stockCommonNm;
        this.stockCommonSellPrice = stockCommonSellPrice;
        this.stockCommonCode = stockCommonCode;
        this.stockCommonType = stockCommonType;
        this.attachedPk = attachedPk;
    }
}