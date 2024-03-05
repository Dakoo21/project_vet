package com.example.vet.controller.board;

import com.example.vet.model.Notice;
import com.example.vet.service.board.Notice_Board_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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
        log.info(notice.toString());
        List<Notice> noticeList;
        noticeList = notice_board_service.noticeList(notice);
        log.info(noticeList.toString());
        model.addAttribute("noticeList", noticeList);
        return "pages/notice/noticeList";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 상세내용 호출
     **********************************************************************************/

    @GetMapping("/noticeDetail")
    public String noticeDetail (Model model, Notice notice) {
        log.info(notice.toString());
        List<Notice> noticeDetail;
        noticeDetail = notice_board_service.noticeDetail(notice);
        log.info(noticeDetail.toString());
        model.addAttribute("noticeDetail", noticeDetail);
        return "pages/notice/noticeDetail";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 등록 페이지 연결
     **********************************************************************************/

    @GetMapping("/noticeInsertPage")
    public String noticeInsertPage () {
        return "pages/notice/noticeInsertPage";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 등록 기능
     **********************************************************************************/

    @PostMapping("/noticeInsert")
    public String noticeInsert (Notice notice) {
        log.info("공지사항 등록 시작");
        log.info(notice.toString());
        int result;
        String path;

        result = notice_board_service.noticeInsert(notice);
        log.info(String.valueOf(result));
        if (result == 1) {
            path = "redirect:/notice";
        } else {
            path = "error";
        }
        return path;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 수정 기능
     **********************************************************************************/

    @PostMapping("/noticeUpdate")
    public String noticeUpdate (Notice notice) {
        log.info("공지사항 수정 시작");
        log.info(notice.toString());
        int result;
        String path;

        result = notice_board_service.noticeUpdate(notice);
        if (result == 1) {
            path = "redirect:/notice";
        } else {
            path = "error";
        }
        return path;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 04.03.24
     기능 : 공지사항 삭제 기능
     **********************************************************************************/

    @GetMapping("/noticeDelete")
    public String noticeDelete (int notice_pk) {
        log.info("공지사항 수정 시작");
        log.info(String.valueOf(notice_pk));
        int result;
        String path;

        result = notice_board_service.noticeDelete(notice_pk);
        if (result == 1) {
            path = "redirect:/notice";
        } else {
            path = "error";
        }
        return path;
    }
}
