package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
    private int paymentPk;
    private String paymentOauthnum;
    private int paymentPrice;
    private String paymentType;
    private String paymentMethod;
    private String paymentUid;
    private String paymentNm;
    private String buyerEmail;
    private String buyerName;
    private String buyerTel;
    private String buyerAddress;

    @Builder
    public PaymentVO(int paymentPk, String paymentOauthnum, int paymentPrice,
                     String paymentType, String paymentMethod, String paymentUid,
                     String paymentNm, String buyerEmail, String buyerName,
                     String buyerTel, String buyerAddress) {
        this.paymentPk = paymentPk;
        this.paymentOauthnum = paymentOauthnum;
        this.paymentPrice = paymentPrice;
        this.paymentType = paymentType;
        this.paymentMethod = paymentMethod;
        this.paymentUid= paymentUid;
        this.paymentNm= paymentNm;
        this.buyerEmail= buyerEmail;
        this.buyerName = buyerName;
        this.buyerTel = buyerTel;
        this.buyerAddress = buyerAddress;
    }
}