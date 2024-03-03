package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Sign {
    private int sign_pk;
    private String sign_title;
    private String sign_content;
    private String sign_date;
    private String sign_reserv_year;
    private String sign_type;
    private int member_pk;
	private int adopt_pk;
    private String selectedValue;


    @Builder
    public Sign(int sign_pk, String sign_title, String sign_content,
                String sign_date, String sign_reserv_year, String sign_type, int member_pk, int adopt_pk, String selectedValue){
        this.sign_pk = sign_pk;
        this.sign_title = sign_title;
        this.sign_content = sign_content;
        this.sign_date = sign_date;
        this.sign_reserv_year = sign_reserv_year;
        this.sign_type = sign_type;
        this.member_pk = member_pk;
        this.adopt_pk = adopt_pk;
        this.selectedValue = selectedValue;

    }
}
