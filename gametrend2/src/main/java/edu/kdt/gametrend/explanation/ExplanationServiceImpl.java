package edu.kdt.gametrend.explanation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("ExplanationServiceImpl")
public class ExplanationServiceImpl implements ExplanationService {
	
	@Autowired
	@Qualifier("ExplanationDAO") 
	ExplanationDAO dao; 
	
	@Override 
	public ExplanationDTO loadExplanation(ExplanationDTO dto) { 
		
		return dao.loadExplanation(dto);
		
	}; 
	
}
