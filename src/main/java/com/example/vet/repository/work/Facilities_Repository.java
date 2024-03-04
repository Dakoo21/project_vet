package com.example.vet.repository.work;

import com.example.vet.model.FacilitiesVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class Facilities_Repository {
    Logger logger = LoggerFactory.getLogger(Facilities_Repository.class);
    private SqlSessionTemplate sqlSessionTemplate;

    public Facilities_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
    //예약리스트
    public List<Map<String, Object>> reserveList(FacilitiesVO facilitiesVO) {

        List<Map<String, Object>> rList= sqlSessionTemplate.selectList("reserveList",facilitiesVO);
        logger.info(rList.toString());
        return rList;
    }
    //예약리스트 mine

    public List<Map<String, Object>> reserveMyList( FacilitiesVO facilitiesVO) {

        List<Map<String, Object>> myList= sqlSessionTemplate.selectList("reserveMyList",facilitiesVO);
        logger.info(myList.toString());
        return myList;
    }
    //모든 리스트
    public List<Map<String, Object>> reserveListAll( String facilityReserveDt) {

        List<Map<String, Object>> allList= sqlSessionTemplate.selectList("reserveListAll",facilityReserveDt);
        logger.info(allList.toString());
        return allList;
    }
    //등록 -예약 시퀀스 뽑고 등록하기
    public Map<String, Object> SelectReserveId() {
        logger.info("예약등록id Insert");
        Map<String, Object> resultMap= sqlSessionTemplate.selectOne("createReserveId");
        logger.info("id채번"+resultMap.toString());
        return resultMap;
    }
    public int insertReserve(Map<String, Object> Imap) {
        logger.info("예약마스터등록 Insert");
        int result = 0;//기억이 안나네`~~
        result = sqlSessionTemplate.insert("insertReserve",Imap);
        return result;
    }
    public int insertReserveDetail(Map<String, Object> Imap) {
        logger.info("예약등록디테일 Insert");
        int result = 0;//기억이 안나네`~~
        result = sqlSessionTemplate.insert("insertReserveDetail",Imap);
        return result;
    }
    //수정 유효성 체크 1 이라면 안된다.
    public int checkImpossibleUpdate(Map<String, Object> checkMap) {
        logger.info("예약업데이트id 유효성 체크");
        Map<String, Object> result= sqlSessionTemplate.selectOne("checkImpossibleUpdate",checkMap);
        logger.info("id채번"+result);
        int possible = result != null ? 1: 0;
        return possible;

    }
    // 수정 처리
    public int updateReserve(Map<String, Object> uMap) {
        logger.info("예약- 수정처리");
        int result = 0;
        result = sqlSessionTemplate.update("updateReserve", uMap);
        logger.info("result : " + result);
        return result;

    }
    //삭제
    public int DeleteReserve(int facilityReserveId) {
        logger.info("reserveDelete - 삭제처리");
        int result = 0;
        result = sqlSessionTemplate.delete("deleteReserve", facilityReserveId);
        logger.info("result : " + result);
        return result;
    }
    public int DeleteReserveDetail(int facilityReserveId) {
        logger.info("reserveDelete - 삭제처리");
        int result = 0;
        result = sqlSessionTemplate.delete("deleteReserveDetail", facilityReserveId);
        logger.info("result : " + result);
        return result;
    }
    //동물 리스트
    public List<Map<String, Object>> animalList(String animalNm) {// gubun:n_title, keyword:휴관
        logger.info("animalList");
        // JAVA -> MyBatis -> Oracle
        List<Map<String, Object>> list = sqlSessionTemplate.selectList("selectAnimalID",animalNm);
        logger.info(list.toString());
        return list;
    }
    //예약가능확인
    public List<Map<String, Object>> checkImpossible(Map<String, Object> cMap) {

        List<Map<String, Object>> cList= sqlSessionTemplate.selectList("checkImpossible",cMap);
        logger.info(cList.toString());
        return cList;
    }
    //디테일 1개의 값에대한 값
    public Map<String, Object> detailList(int facilityReserveId) {
        logger.info("facilityReserveId:"+facilityReserveId);
        // JAVA -> MyBatis -> Oracle
        Map<String, Object> oneMap = sqlSessionTemplate.selectOne("detailList",facilityReserveId);
        logger.info(oneMap.toString());
        return oneMap;
    }
}

//com.example.demo.FacilitiesMapper


//List<FacilitiesVO> rList= sqlSessionTemplate.selectList("com.example.demo.FacilitiesMapper.reserveList",facilitiesVO);