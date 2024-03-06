package com.example.vet.model.adopt;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MissedAnimal {
    private Integer desertion_no;
    private String filename;
    private String happendate;
    private String happenplace;
    private String kindcd;
    private String colorcd;
    private String age;
    private String weight;
    private String notice_no;
    private String noticestartdate;
    private String noitceenddate;
    private String popfile;
    private String processstate;
    private String sex;
    private String neuteral_yesorno;
    private String specialmark;
    private String care_nm;
    private String care_tel;
    private String care_address;
    private String org_nm;
    private String charge_nm;
    private String office_tel;

    @Builder
    public MissedAnimal(Integer desertion_no, String filename, String happendate,
                        String happenplace, String kindcd, String colorcd, String age,
                        String weight, String notice_no, String noticestartdate,
                        String noitceenddate, String popfile, String processstate,
                        String sex, String neuteral_yesorno, String specialmark,
                        String care_nm, String care_tel, String care_address, String org_nm,
                        String charge_nm, String office_tel) {
        this.desertion_no = desertion_no;
        this.filename = filename;
        this.happendate = happendate;
        this.happenplace = happenplace;
        this.kindcd = kindcd;
        this.colorcd = colorcd;
        this.age = age;
        this.weight = weight;
        this.notice_no = notice_no;
        this.noticestartdate = noticestartdate;
        this.noitceenddate = noitceenddate;
        this.popfile = popfile;
        this.processstate = processstate;
        this.sex = sex;
        this.neuteral_yesorno = neuteral_yesorno;
        this.specialmark = specialmark;
        this.care_nm = care_nm;
        this.care_tel = care_tel;
        this.care_address = care_address;
        this.org_nm = org_nm;
        this.charge_nm = charge_nm;
        this.office_tel = office_tel;
    }

}
