package com.example.vet.repository.work;

import com.example.vet.model.FacilitiesVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Facilities_Repository {
    Logger logger = LoggerFactory.getLogger(Facilities_Repository.class);
    private  SqlSessionTemplate sqlSessionTemplate;

    public Facilities_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    //리스트
    public List<FacilitiesVO> reserveList(FacilitiesVO facilitiesVO) {

        List<FacilitiesVO> rList= sqlSessionTemplate.selectList("reserveList",facilitiesVO);
        logger.info(rList.toString());
        logger.info(String.valueOf(rList.get(0).getFacilityNm()));
        return rList;
    }

    //등록
    public int reserveInsert(FacilitiesVO facilitiesVO) {
        logger.info("boardInsert");
        int result = 0;//기억이 안나네`~~
        result = sqlSessionTemplate.insert("reserveInsert",facilitiesVO);
        return result;
    }

}
//com.example.demo.FacilitiesMapper


//List<FacilitiesVO> rList= sqlSessionTemplate.selectList("com.example.demo.FacilitiesMapper.reserveList",facilitiesVO);