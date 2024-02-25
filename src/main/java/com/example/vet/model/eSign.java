package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class eSign {
    private int sign_pk;
	private String sign_writer;
    private String sign_no;
    private String sign_title;
    private String sign_content;
    private String sign_date;
    private String sign_state;
    private String sign_type;
    private int user_pk;
	private int adopt_pk;


    @Builder
    public eSign(int sign_pk, String sign_writer, String sign_no, String sign_title, String sign_content,
                 String sign_date, String sign_state, String sign_type, int user_pk, int adopt_pk){
        this.sign_pk = sign_pk;
        this.sign_writer = sign_writer;
        this.sign_no = sign_no;
        this.sign_title = sign_title;
        this.sign_content = sign_content;
        this.sign_date = sign_date;
        this.sign_state = sign_state;
        this.sign_type = sign_type;
        this.user_pk = user_pk;
        this.adopt_pk = adopt_pk;

    }
}
