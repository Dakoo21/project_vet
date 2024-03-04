package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
@NoArgsConstructor
public class PaymentVO {
    private Integer payment_pk;
    private String merchant_uid;
    private String pg_provider;
    private Integer paid_at;
    private String status;
    private String pg_tid;
    private String buyer_name;
    private String buyer_tel;
    private Integer paid_amount;
    private String imp_uid;
    private String name;

    @Builder
    public PaymentVO(int payment_pk, String merchant_uid, String pg_provider, int paid_at,
                     String status, String pg_tid, String buyer_name, String buyer_tel,
                     int paid_amount,String imp_uid, String name) {
        log.info("VO빌더입니다");
        this.payment_pk = payment_pk;
        this.merchant_uid = merchant_uid;
        this.pg_provider = pg_provider;
        this.paid_at = paid_at;
        this.status = status;
        this.pg_tid = pg_tid;
        this.buyer_name = buyer_name;
        this.buyer_tel = buyer_tel;
        this.paid_amount = paid_amount;
        this.imp_uid = imp_uid;
        this.name = name;
    }
}