package com.example.vet.controller.board;

import com.example.vet.model.Notice;
import com.example.vet.service.board.Notice_Board_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@Slf4j
public class Notice_Board_Controller {

    private final Notice_Board_Service notice_board_service;

    public Notice_Board_Controller(Notice_Board_Service notice_board_service) {
        this.notice_board_service = notice_board_service;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 페이지 접속 & 공지사항 리스트 호출
     **********************************************************************************/

    @GetMapping("/notice")
    public String noticePage (Model model, Notice notice) {


        return "pages/notice/noticeList";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 등록 기능
     **********************************************************************************/

    @GetMapping("/noticeInsertPage")
    public String noticeInsertPage () {
        return "pages/notice/noticeDetail";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 등록 기능
     **********************************************************************************/

    @PostMapping("/noticeInsert")
    public String noticeInsert (Notice notice) {
        int result;
        String path;

        result = notice_board_service.noticeInsert(notice);
        if (result == 1) {
            path = "pages/notice/noticeList";
        } else {
            path = "error";
        }
        return path;
    }
}
