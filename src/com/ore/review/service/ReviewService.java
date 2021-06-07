package com.ore.review.service;

import java.util.List;

import com.ore.review.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList();
	List<ReviewVO> reviewSelectList(String id);
	ReviewVO reviewSelect(ReviewVO vo);
	int insertReview(ReviewVO vo);
	int updateReview(ReviewVO vo);
	int deleteReview(ReviewVO vo);
}
