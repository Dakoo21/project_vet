package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class StockCommonVO {
    private Integer stock_common_pk;
    private String stock_common_nm;
    private Integer stock_common_sellprice;
    private String stock_common_code;
    private String stock_common_type;
    private Integer attached_pk;

    @Builder
    public StockCommonVO(Integer stock_common_pk, String stock_common_nm, Integer stock_common_sellprice, String stock_common_code, String stock_common_type, Integer attached_pk) {
        this.stock_common_pk = stock_common_pk;
        this.stock_common_nm = stock_common_nm;
        this.stock_common_sellprice = stock_common_sellprice;
        this.stock_common_code = stock_common_code;
        this.stock_common_type = stock_common_type;
        this.attached_pk = attached_pk;
    }
}