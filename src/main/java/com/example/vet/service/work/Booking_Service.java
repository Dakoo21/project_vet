package com.example.vet.service.work;

import com.example.vet.model.AnimalVO;
import com.example.vet.model.BookingVO;
import com.example.vet.repository.work.Booking_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class Booking_Service {
    Logger logger = LoggerFactory.getLogger(Booking_Service.class);
    private final Booking_Repository bookingRepository;

    public Booking_Service(Booking_Repository bookingRepository) {
        this.bookingRepository = bookingRepository;
    }

    public List<Map<String, Object>> bookingSelect() {
        return bookingRepository.bookingSelect();
    }

    public List<Map<String, Object>> selectBookingDetail(int bookingPK) {
        return bookingRepository.selectBookingDetail(bookingPK);
    }

    public int bookingUpdate(Map<String, Object> rmap) {
        return bookingRepository.bookingUpdate(rmap);
    }

    public int bookingInsert(Map<String, Object> rmap) {
        return bookingRepository.bookingInsert(rmap);
    }

    public int bookingDelete(int bookingPK) {
        return bookingRepository.bookingDelete(bookingPK);
    }

    public List<Map<String, Object>> SelectAnimal() {
        return bookingRepository.SelectAnimal();
    }

    public List<Map<String, Object>> selectAnimalsByName(String animalNm) {
        return bookingRepository.selectAnimalsByName(animalNm);
    }
}
