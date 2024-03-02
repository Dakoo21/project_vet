package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
    private Integer paymentPK;
    private String paymentOauthnum;
    private Integer paid_amount;
    private Integer amount;
    private Integer applyNum;
    private String merchantUid;
    private String impUid;
    private String pg_tid;
    private String paymentType;
    private String paymentMethod;
    private String paymentNm;
    private String buyerEmail;
    private String buyer_name;
    private String buyer_tel;
    private String buyerAddress;
    private String name;
    private Integer common_code_pk;
    private Integer drugPrescription_pk;

    @Builder
    public PaymentVO(int paymentPK, String paymentOauthnum, int paid_amount, int amount,
                     int applyNum, String merchantUid, String impUid, String pg_tid,
                     String paymentType, String paymentMethod, String paymentNm,
                     String buyerEmail, String buyer_name, String buyer_tel, String buyerAddress,
                     String name, int common_code_pk, int drugPrescription_pk) {
        this.paymentPK = paymentPK;
        this.paymentOauthnum = paymentOauthnum;
        this.paid_amount = paid_amount;
        this.amount = amount;
        this.applyNum = applyNum;
        this.merchantUid = merchantUid;
        this.impUid = impUid;
        this.pg_tid = pg_tid;
        this.paymentType = paymentType;
        this.paymentMethod = paymentMethod;
        this.paymentNm = paymentNm;
        this.buyerEmail = buyerEmail;
        this.buyer_name = buyer_name;
        this.buyer_tel = buyer_tel;
        this.buyerAddress = buyerAddress;
        this.name = name;
        this.common_code_pk = common_code_pk;
        this.drugPrescription_pk = drugPrescription_pk;
    }
}