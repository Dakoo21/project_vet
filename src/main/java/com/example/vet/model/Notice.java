package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Notice {

    private Integer NOTICE_PK;
    private String NOTICE_TITLE;
    private String NOTICE_CONTENT;
    private Integer NOTICE_HITS;
    private String NOTICE_TIME;
    private Integer NOTICE_HIGHLIGHTED;
    private Integer MEMBER_PK;
    private String MEMBER_MEMBERNAME;

    @Builder
    public Notice(Integer NOTICE_PK, String NOTICE_TITLE, String NOTICE_CONTENT, Integer NOTICE_HITS, String NOTICE_TIME, Integer NOTICE_HIGHLIGHTED, Integer MEMBER_PK, String MEMBER_MEMBERNAME) {
        this.NOTICE_PK = NOTICE_PK;
        this.NOTICE_TITLE = NOTICE_TITLE;
        this.NOTICE_CONTENT = NOTICE_CONTENT;
        this.NOTICE_HITS = NOTICE_HITS;
        this.NOTICE_TIME = NOTICE_TIME;
        this.NOTICE_HIGHLIGHTED = NOTICE_HIGHLIGHTED;
        this.MEMBER_PK = MEMBER_PK;
        this.MEMBER_MEMBERNAME = MEMBER_MEMBERNAME;
    }
}
