package com.example.vet.repository.work;

import com.example.vet.model.AnimalVO;
import com.example.vet.model.BookingVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Booking_Repository {
    Logger logger = LoggerFactory.getLogger(Booking_Repository.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public Booking_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> bookingSelect() {
        List<Map<String, Object>> bList = sqlSessionTemplate.selectList("bookingSelect");
        logger.info(bList.toString());
        return bList;
    }

    public List<Map<String, Object>> selectBookingDetail(int bookingPK) {
        List<Map<String, Object>> nList = sqlSessionTemplate.selectList("bookingDetail", bookingPK);
        logger.info(nList.toString());
        return nList;
    }

    public int bookingUpdate(Map<String, Object> rmap) {
        int rowsAffected = sqlSessionTemplate.update("bookingUpdate", rmap);
        return rowsAffected > 0 ? 1 : 0;
    }

    public int bookingInsert(Map<String, Object> rmap) {
        int rowsInserted = sqlSessionTemplate.insert("bookingInsert", rmap);
        return rowsInserted > 0 ? 1 : 0;
    }

    public int bookingDelete(int bookingPK) {
        int rowsDeleted = sqlSessionTemplate.delete("bookingDelete", bookingPK);
        return rowsDeleted > 0 ? 1 : 0;
    }

    public List<Map<String, Object>> SelectAnimal() {
        List<Map<String, Object>> aList = sqlSessionTemplate.selectList("animalSelect");
        logger.info(aList.toString());
        return aList;
    }

    public List<Map<String, Object>> selectAnimalsByName(String animalNm) {
        List<Map<String, Object>> animList = sqlSessionTemplate.selectList("animalSelectByName", animalNm);
        logger.info(animList.toString());
        return animList;
    }
}
