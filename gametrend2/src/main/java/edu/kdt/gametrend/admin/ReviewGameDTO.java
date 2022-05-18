package edu.kdt.gametrend.admin;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.review.ReviewDTO;

public class ReviewGameDTO {

	ReviewDTO reviewDTO;
	GameDTO gameDTO;
	public ReviewDTO getReviewDTO() {
		return reviewDTO;
	}
	public void setReviewDTO(ReviewDTO reviewDTO) {
		this.reviewDTO = reviewDTO;
	}
	public GameDTO getGameDTO() {
		return gameDTO;
	}
	public void setGameDTO(GameDTO gameDTO) {
		this.gameDTO = gameDTO;
	}
	
}
