package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
    private int paymentPK;
    private String paymentOauthnum;
    private int paidAmount;
    private int applyNum;
    private String merchantUid;
    private String impUid;
    private String paymentType;
    private String paymentMethod;
    private String paymentNm;
    private String buyerEmail;
    private String buyerName;
    private String buyerTel;
    private String buyerAddress;
    private String name;
    private String amount;

    @Builder
    public PaymentVO(int paymentPK, String paymentOauthnum, int paidAmount,
                     String paymentType, String paymentMethod, String merchantUid,
                     int applyNum, String impUid, String paymentNm, String buyerEmail,
                     String buyerName, String buyerTel, String buyerAddress,
                     String name, String amount) {
        this.paymentPK = paymentPK;
        this.paymentOauthnum = paymentOauthnum;
        this.paidAmount = paidAmount;
        this.paymentType = paymentType;
        this.paymentMethod = paymentMethod;
        this.merchantUid = merchantUid;
        this.applyNum = applyNum;
        this.impUid = impUid;
        this.paymentNm = paymentNm;
        this.buyerEmail = buyerEmail;
        this.buyerName = buyerName;
        this.buyerTel = buyerTel;
        this.buyerAddress = buyerAddress;
        this.name = name;
        this.amount = amount;
    }
}