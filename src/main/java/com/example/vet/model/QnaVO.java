package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QnaVO {
    private int qaPk;
    private String qaWriter;
    private String qaTitle;
    private String qaContent;
    private Integer attachedPk;
    private int qaHits;
    private String qaTime;
    private Integer attachedPk2;

    @Builder
    public QnaVO(int qaPk, String qaWriter, String qaTitle, String qaContent, Integer attachedPk, int qaHits, String qaTime, Integer attachedPk2) {
        this.qaPk = qaPk;
        this.qaWriter = qaWriter;
        this.qaTitle = qaTitle;
        this.qaContent = qaContent;
        this.attachedPk = attachedPk;
        this.qaHits = qaHits;
        this.qaTime = qaTime;
        this.attachedPk2 = attachedPk2;
    }
}
