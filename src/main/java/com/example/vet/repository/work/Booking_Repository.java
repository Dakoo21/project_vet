package com.example.vet.repository.work;

import com.example.vet.model.BookingVO;
import com.example.vet.repository.board.QA_Repository;
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

    public List<Map<String, Object>> Select(BookingVO bookingVO) {
        List<Map<String, Object>> bList= sqlSessionTemplate.selectList("bookingSelect", bookingVO);
        logger.info(bList.toString());
        return bList;
    }

    public int Insert(BookingVO bookingVO) {
        int rowsInserted = sqlSessionTemplate.insert("bookingInsert", bookingVO);
        return rowsInserted> 0 ? 1 : 0;
    }

    public int Update(int bookingVO) {
        int rowsAffected = sqlSessionTemplate.update("bookingUpdate", bookingVO);
        return rowsAffected > 0 ? 1 : 0;
    }

    public int Delete(BookingVO bookingVO) {
        int rowDeleted = sqlSessionTemplate.delete("bookingDelete", bookingVO);
        return rowDeleted>0 ? 1 : 0;
    }
}
