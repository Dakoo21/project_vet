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
    private int animalPk;

    @Builder
    public BookingVO(int bookingPk, String bookingType, String bookingStart, String bookingEnd, int animalPk) {
        this.bookingPk = bookingPk;
        this.bookingType = bookingType;
        this.bookingStart = bookingStart;
        this.bookingEnd = bookingEnd;
        this.animalPk = animalPk;
    }
}