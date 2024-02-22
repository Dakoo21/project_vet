package com.example.vet.service.work;

import com.example.vet.model.BookingVO;
import com.example.vet.model.QnaVO;
import com.example.vet.repository.board.QA_Repository;
import com.example.vet.repository.work.Booking_Repository;
import com.example.vet.service.board.QA_Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class Booking_Service {
    Logger logger = LoggerFactory.getLogger(Booking_Service.class);
    private final Booking_Repository bookingRepository;

    public Booking_Service(Booking_Repository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public List<Map<String, Object>> Select(BookingVO bookingVO) {
        List<Map<String,Object>> nList = new ArrayList<>();
        nList = bookingRepository.Select(bookingVO);
        logger.info(nList.toString());
        return nList;
    }

    public int Insert(BookingVO bookingVO) {
        return bookingRepository.Insert(bookingVO);
    }

    public int Delete(int bookingPK) {
        return bookingRepository.Delete(bookingPK);
    }

    public int Update(BookingVO bookingVO) {
        return bookingRepository.Update(bookingVO);
    }
}
