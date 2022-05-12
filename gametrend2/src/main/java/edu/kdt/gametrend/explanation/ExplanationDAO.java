package edu.kdt.gametrend.explanation;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("ExplanationDAO")
public interface ExplanationDAO {
	
	public ExplanationDTO loadExplanation(ExplanationDTO dto); 

}
	