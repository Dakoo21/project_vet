package com.example.vet.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @ToString
@Getter
public class TotalCustomerUpdateVO {

    private String master_nm;
    private String master_username;
    private String master_pw;
    private String master_gender;
    private String master_bdate;
    private String master_pnumber;
    private String master_address;
    private String master_email;
    private int masterPk;
}
