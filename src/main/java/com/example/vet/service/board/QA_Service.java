package com.example.vet.service.board;

import com.example.vet.model.qnaVO;
import com.example.vet.repository.board.QA_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class QA_Service {

    Logger logger = LoggerFactory.getLogger(QA_Service.class);
    private final QA_Repository qaRepository;


    public QA_Service(QA_Repository qaRepository) {
        this.qaRepository = qaRepository;
    }

    public List<Map<String,Object>> Select(qnaVO qnaVO) {

        List<Map<String,Object>> nList = new ArrayList<>();
        nList = qaRepository.Select(qnaVO);
        logger.info(nList.toString());
        return nList;
    }


    public int Insert(qnaVO qnaVO) {

        return qaRepository.Insert(qnaVO);
    }

    public int Update(qnaVO qnaVO) {

        return qaRepository.Update(qnaVO);
    }

    public int Delete(int qnaPK) {

        return qaRepository.Delete(qnaPK);
    }
}
