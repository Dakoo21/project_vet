package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MasterVO {
    private int master_pk;
    private String master_nm;
    private String master_username;
    private  String master_gender;
    private String master_pw;
    private String master_email;
    private String master_pnumber;
    private String master_address;
    private String master_bdate;


    @Builder
    public MasterVO(int master_pk,  String master_nm, String master_username, String master_pw, String master_email,
                    String master_pnumber, String master_address, String master_bdate, String master_gender) {
        this.master_pk = master_pk;
        this.master_nm = master_nm;
        this.master_username = master_username;
        this.master_pw = master_pw;
        this.master_email = master_email;
        this.master_pnumber = master_pnumber;
        this.master_address = master_address;
        this.master_bdate = master_bdate;
        this.master_gender = master_gender;
    }
}