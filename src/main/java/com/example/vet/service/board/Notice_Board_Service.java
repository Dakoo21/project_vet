package com.example.vet.service.board;

import com.example.vet.model.Notice;
import com.example.vet.repository.board.Notice_Board_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class Notice_Board_Service {

    private final Notice_Board_Repository notice_board_repository;

    public Notice_Board_Service(Notice_Board_Repository notice_board_repository) {
        this.notice_board_repository = notice_board_repository;
    }

    public List<Notice> noticeList(Notice notice) {
        List<Notice> noticeList;
        noticeList = notice_board_repository.noticeList(notice);
        return noticeList;
    }

    public List<Notice> noticeDetail(Notice notice) {
        List<Notice> noticeDetail;
        noticeDetail = notice_board_repository.noticeList(notice);

        if (noticeDetail.size() == 1) {
            //만일 updqte를 하다가 SQLException( 부적합한 식별자 ) 발동하면 에러페이지를 보여달라 - 요구사항 이라면...
            //
            try {
                notice_board_repository.hitCount(notice);
            } catch (Exception e) {
                log.info(e.toString());
                //e.printStackTrace();
            }
        }
        return noticeDetail;
    }

    public int noticeInsert(Notice notice) {
        int result;
        result = notice_board_repository.noticeInsert(notice);
        return result;
    }

    public int noticeUpdate(Notice notice) {
        int result;
        result = notice_board_repository.noticeUpdate(notice);
        return result;
    }

    public int noticeDelete(int notice_pk) {
        int result;
        result = notice_board_repository.noticeDelete(notice_pk);
        return result;
    }

}
