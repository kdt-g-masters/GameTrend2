package edu.kdt.gametrend.carousel;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("carouseldao")
public interface CarouselDAO {
	
	//전체 조회
	public List<CarouselDTO> carousellist();
	//추가
//	public int insertcarousel(CarouselDTO dto) {
//		return session.insert("insertcarousel", dto);
//	}
//	//수정
//	public int updatecarousel(CarouselDTO dto) {
//		return session.update("updatecarousel", dto);
//	}
//	//삭제
//	public int deletecarousel(int carouselNo) {
//		return session.delete("deletecarousel", carouselNo);
//	}
}
