package com.ore.qna.service;

import java.util.List;

import com.ore.qna.vo.QnaVO;

public interface QnaService {
	List<QnaVO> qnaList();
	List<QnaVO> qnaSelectList(String id);
	QnaVO qnaSelect(QnaVO vo);
	int insertQna(QnaVO vo);
	int updateQna(QnaVO vo);
	int deleteQna(QnaVO vo);
}
