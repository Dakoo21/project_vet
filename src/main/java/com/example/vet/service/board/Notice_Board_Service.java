//package com.example.vet.service.board;
//
//import com.example.vet.model.Notice;
//import com.example.vet.repository.board.Notice_Board_Repository;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Service;
//
//@Service
//@Slf4j
//public class Notice_Board_Service {
//
//    private final Notice_Board_Repository notice_board_repository;
//
//    public Notice_Board_Service(Notice_Board_Repository notice_board_repository) {
//        this.notice_board_repository = notice_board_repository;
//    }
//
//    public int noticeInsert(Notice notice) {
//        int result;
//        result = notice_board_repository.noticeInsert(notice);
//        return result;
//    }
//}
