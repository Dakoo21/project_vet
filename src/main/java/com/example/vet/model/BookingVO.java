package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BookingVO {
    private int bookingPk;
    private String bookingType;
    private String bookingStart;
    private String bookingEnd;
    private String bookingDate;
    private int animalPk;
    private int commonCodePk;
    private int userPk;


    @Builder
    public BookingVO(int bookingPk, String bookingType, String bookingStart, String bookingEnd, String bookingDate,
                     int animalPk, int commonCodePk, int userPk) {
        this.bookingPk = bookingPk;
        this.bookingType = bookingType;
        this.bookingStart = bookingStart;
        this.bookingEnd = bookingEnd;
        this.bookingDate = bookingDate;
        this.animalPk = animalPk;
        this.commonCodePk = commonCodePk;
        this.userPk = userPk;

    }
}