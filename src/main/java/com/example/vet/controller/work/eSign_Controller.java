// package com.example.vet.controller.work;
//
// import com.example.vet.model.QnaVO;
// import com.example.vet.service.board.QA_Service;
// import com.example.vet.service.work.eSign_Service;
// import org.slf4j.Logger;
// import org.slf4j.LoggerFactory;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RequestParam;
//
// import java.util.List;
// import java.util.Map;
//
// @Controller
// @RequestMapping("QnA/*")
// public class eSign_Controller {
//
//     private static final Logger logger = LoggerFactory.getLogger(eSign_Controller.class);
//
//     private final eSign_Service esService;
//     public eSign_Controller(eSign_Service esService) {
//         this.esService = esService;
//     }
//
//     // 문서보관함
//     @GetMapping("noticeList")
//     public String list(Model model){
//         QnaVO qnaVO = null;
//         List<Map<String,Object>> nList = esService.Select(qnaVO);
//         logger.info(nList.toString());
//         model.addAttribute("nList", nList);
//         return "pages/qna/qnaList";
//     }
//     // 진행중인 문서보관함
//     @GetMapping("noticeDetail")
//     public String listDetail(@RequestParam int qnaPK, Model model) {
//
//         QnaVO qnaVO = new QnaVO();
//         qnaVO.setQaPk(qnaPK);
//         logger.info(qnaVO.toString());
//         List<Map<String,Object>> nList = esService.Select(qnaVO);
//
//         model.addAttribute("nList", nList);
//         return "pages/qna/qnaDetail";
//     }
//     // 취소보관함
//
//     //
//
//     // @PostMapping("qnaUpdate")
//     // public String update(@RequestParam Map<String, Object> rmap) {
//     //     QnaVO qnaVO = new QnaVO();
//     //     Integer qaPk = Integer.parseInt(rmap.get("QA_PK").toString());
//     //     qnaVO.setQaPk(qaPk);
//     //
//     //     // 제목
//     //     String qaTitle = (String) rmap.get("QA_TITLE");
//     //     qnaVO.setQaTitle(qaTitle);
//     //
//     //     // 작성자
//     //     String qaWriter = (String) rmap.get("QA_WRITER");
//     //     qnaVO.setQaWriter(qaWriter);
//     //
//     //     // 조회수
//     //     Integer qaHits = Integer.parseInt(rmap.get("QA_HITS").toString());
//     //     qnaVO.setQaHits(qaHits);
//     //
//     //     // 작성시각
//     //     String qaTime = (String) rmap.get("QA_TIME");
//     //     qnaVO.setQaTime(qaTime);
//     //
//     //     // 내용
//     //     String qaContent = (String) rmap.get("QA_CONTENT");
//     //     qnaVO.setQaContent(qaContent);
//     //
//     //     // 첨부 PK
//     //     Integer attachedPk = Integer.parseInt(rmap.get("ATTACHED_PK").toString());
//     //     qnaVO.setAttachedPk(attachedPk);
//     //
//     //     // 두 번째 첨부 PK
//     //     Integer attachedPk2 = Integer.parseInt(rmap.get("ATTACHED_PK2").toString());
//     //     qnaVO.setAttachedPk2(attachedPk2);
//     //
//     //     logger.info(qnaVO.toString());
//     //
//     //     int updated = qaService.Update(qnaVO);
//     //
//     //     if (updated == 1) {
//     //         return "redirect:noticeList";
//     //     } else {
//     //         return "error";
//     //     }
//     // }
//     public String insert(@RequestParam Map<String, Object> rmap) {
//         QnaVO qnaVO = new QnaVO();
//         Integer qaPk = Integer.parseInt(rmap.get("QA_PK").toString());
//         qnaVO.setQaPk(qaPk);
//
//         // 제목
//         String qaTitle = (String) rmap.get("QA_TITLE");
//         qnaVO.setQaTitle(qaTitle);
//
//         // 작성자
//         String qaWriter = (String) rmap.get("QA_WRITER");
//         qnaVO.setQaWriter(qaWriter);
//
//         // 조회수
//         Integer qaHits = Integer.parseInt(rmap.get("QA_HITS").toString());
//         qnaVO.setQaHits(qaHits);
//
//         // 작성시각
//         String qaTime = (String) rmap.get("QA_TIME");
//         qnaVO.setQaTime(qaTime);
//
//         // 내용
//         String qaContent = (String) rmap.get("QA_CONTENT");
//         qnaVO.setQaContent(qaContent);
//
//         // 첨부 PK
//         Integer attachedPk = Integer.parseInt(rmap.get("ATTACHED_PK").toString());
//         qnaVO.setAttachedPk(attachedPk);
//
//
//         logger.info(rmap.toString());
//         int inserted = qaService.Insert(qnaVO);
//
//         if (inserted == 1) {
//             return "redirect:qnaList";
//         } else {
//             return "error";
//         }
//     }
//
//
//     @PostMapping("qnaDelete")
//     public String Delete(int qnaPK) {
//
//         int deleted = qaService.Delete(qnaPK);
//
//         if(deleted == 1) {
//             return "redirect:qnaList";
//         }
//         else{
//             return "error";
//         }
//     }
//
//
// }
