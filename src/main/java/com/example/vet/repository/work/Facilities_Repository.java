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
    //등록
    //예약 시퀀스 뽑고 등록하기
    public Map<String, Object> SelectReserveId() {
        logger.info("예약등록 Insert");
        Map<String, Object> resultMap= sqlSessionTemplate.selectOne("createReserveId");
        logger.info(resultMap.toString());
        return resultMap;
    }
    public int Insertreserve(FacilitiesVO facilitiesVO) {
        logger.info("예약등록 Insert");
        int result = 0;//기억이 안나네`~~
        result = sqlSessionTemplate.insert("Insertreserve",facilitiesVO);
        return result;
    }
    public int InsertreserveDetail(FacilitiesVO facilitiesVO) {
        logger.info("예약등록 Insert");
        int result = 0;//기억이 안나네`~~
        result = sqlSessionTemplate.insert("InsertreserveDetail",facilitiesVO);
        return result;
    }
    //수정
    public int reserveUpdate(FacilitiesVO facilitiesVO) {
        logger.info("예약- 수정처리");
        int result = 0;
        result = sqlSessionTemplate.update("reserveUpdate", facilitiesVO);// b_no=0이었다면
        logger.info("result : " + result);
        return result;
    }
    //삭제
    public int DeleteReserve(int facilityReserveId) {
        logger.info("reserveDelete - 삭제처리");
        int result = 0;
        result = sqlSessionTemplate.delete("DeleteReserve", facilityReserveId);
        logger.info("result : " + result);
        return result;
    }
    public int DeleteReserveDetail(int facilityReserveId) {
        logger.info("reserveDelete - 삭제처리");
        int result = 0;
        result = sqlSessionTemplate.delete("DeleteReserveDetail", facilityReserveId);
        logger.info("result : " + result);
        return result;
    }
    //동물 리스트
//    public List<Map<String, Object>> animaList(FacilitiesVO facilitiesVO) {
//
//        List<Map<String, Object>> aList= sqlSessionTemplate.selectList("selecteAnimalList",facilitiesVO);
//        logger.info(aList.toString());
//        return aList;
//    }
    public List<Map<String, Object>> animalList(String animalNm) {// gubun:n_title, keyword:휴관
        logger.info("animalList");
        // JAVA -> MyBatis -> Oracle
        List<Map<String, Object>> list = sqlSessionTemplate.selectList("selectAnimalID",animalNm);
        logger.info(list.toString());
        return list;
    }
    //예약가능확인
    public List<Map<String, Object>> checkImpossible(FacilitiesVO facilitiesVO) {

        List<Map<String, Object>> cList= sqlSessionTemplate.selectList("checkImpossible",facilitiesVO);
        logger.info(cList.toString());
        return cList;
    }

}
//com.example.demo.FacilitiesMapper


//List<FacilitiesVO> rList= sqlSessionTemplate.selectList("com.example.demo.FacilitiesMapper.reserveList",facilitiesVO);