package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class User {

    private String authority;
    private Integer USER_PK;
    private String USER_NM; //아이디
    private String USER_USERNAME; //유저이름
    private String USER_PW;
    private String USER_EMAIL;
    private String USER_PNUMBER;
    private String USER_ADDRESS;
    private Integer COMMON_CODE_PK;
    private String USER_BDATE;
    private String USER_PROVIDER;
    private String USER_PROVIDERID;

    @Builder
    public User(Integer USER_PK, String USER_NM, String USER_USERNAME, String USER_PW, String USER_EMAIL, String USER_PNUMBER, String USER_ADDRESS, Integer COMMON_CODE_PK, String USER_BDATE, String USER_PROVIDER, String USER_PROVIDERID, String authority) {
        this.USER_PK = USER_PK;
        this.USER_NM = USER_NM;
        this.USER_USERNAME = USER_USERNAME;
        this.USER_PW = USER_PW;
        this.USER_EMAIL = USER_EMAIL;
        this.USER_PNUMBER = USER_PNUMBER;
        this.USER_ADDRESS = USER_ADDRESS;
        this.COMMON_CODE_PK = COMMON_CODE_PK;
        this.USER_BDATE = USER_BDATE;
        this.USER_PROVIDER = USER_PROVIDER;
        this.USER_PROVIDERID = USER_PROVIDERID;
        this.authority = authority;
    }
}
