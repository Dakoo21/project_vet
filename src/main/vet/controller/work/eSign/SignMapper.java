package com.example.vet.controller.work.eSign;

import com.example.vet.model.Sign;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
@Mapper
public interface SignMapper {
    //
    // @Insert("INSERT INTO SIGN2_TEST (SIGN_PK, SIGN_TITLE, SIGN_CONTENT) " +
    //         "VALUES (SIGN_PK_SEQ.nextval, #{sign_title}, #{sign_content})")
    // @Options(useGeneratedKeys = true, keyProperty = "sign_pk")
    void insertSign(Sign sign);

    // 다양한 메서드 추가 가능
}