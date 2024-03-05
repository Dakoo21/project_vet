package com.example.vet.repository.board;

import com.example.vet.model.AnimalInsertMasterVO;
import com.example.vet.model.AnimalVO;
import com.example.vet.model.MasterVO;
import com.example.vet.model.TotalDataUpdateVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TotalData_Repository{
    Logger logger = LoggerFactory.getLogger(TotalData_Repository.class);
    @Autowired
    SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String,Object>>dataList(Map<String, Object>pmap){
        logger.info("dataList");
        List<Map<String, Object>> dList = sqlSessionTemplate.selectList("animalSelect1", pmap);
        logger.info(dList.toString());
        return dList;
    }

    public List<Map<String,Object>>detail(AnimalVO animalVO){
        logger.info("dataList");
        List<Map<String, Object>> dList = sqlSessionTemplate.selectList("selectAnimalDetail", animalVO);
        logger.info(dList.toString());
        return dList;
    }
    public int dataInsert(AnimalVO animalVO) {
        logger.info("dataInsert");
        System.out.println(animalVO);
        int result = 0;
        result = sqlSessionTemplate.insert("animalInsert", animalVO);
        return result;
    }
    public int dataUpdate(TotalDataUpdateVO totalDataUpdateVO) {
        logger.info("dataUpdate");
        int result = 0;
        try {
            //java와 myBatis 연계될때 에러가 발생할 수 있어서 try catch
            System.out.println("*************");
            result = sqlSessionTemplate.update("animalUpdate", totalDataUpdateVO);
            System.out.println(result);
        } catch (Exception e) {
            logger.info(e.toString());
        }
        return result;
    }

    public List<Map<String,Object>> selectDiag(int animalPk) {
        return sqlSessionTemplate.selectList("selectDiag", animalPk);
    }

    public List<AnimalInsertMasterVO> selectMasterInfo() {
        return sqlSessionTemplate.selectList("selectMasterNm");
    }
}

