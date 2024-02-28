package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Member {
    private Integer MEMBER_PK;
    private String MEMBER_ID;
	private String MEMBER_PW;
	private String MEMBER_MEMBERNAME;
	private String MEMBER_EMAIL;
	private String MEMBER_ROLE;
    private String MEMBER_CREATEDATE;
	private String MEMBER_POSTCODE;
	private String MEMBER_ADDRESS;
	private String MEMBER_PHONE;
	private String PROVIDER;
	private String PROVIDERID;

	@Builder
	public Member(Integer MEMBER_PK, String MEMBER_ID, String MEMBER_PW, String MEMBER_MEMBERNAME, String MEMBER_EMAIL, String MEMBER_ROLE, String MEMBER_CREATEDATE, String MEMBER_POSTCODE, String MEMBER_ADDRESS, String MEMBER_PHONE, String PROVIDER, String PROVIDERID) {
		this.MEMBER_PK = MEMBER_PK;
		this.MEMBER_ID = MEMBER_ID;
		this.MEMBER_PW = MEMBER_PW;
		this.MEMBER_MEMBERNAME = MEMBER_MEMBERNAME;
		this.MEMBER_EMAIL = MEMBER_EMAIL;
		this.MEMBER_ROLE = MEMBER_ROLE;
		this.MEMBER_CREATEDATE = MEMBER_CREATEDATE;
		this.MEMBER_POSTCODE = MEMBER_POSTCODE;
		this.MEMBER_ADDRESS = MEMBER_ADDRESS;
		this.MEMBER_PHONE = MEMBER_PHONE;
		this.PROVIDER = PROVIDER;
		this.PROVIDERID = PROVIDERID;
	}
	// 사용자 이름을 반환하는 메서드 추가
	public String getMemberName() {
		return MEMBER_MEMBERNAME;
	}

}
