package edu.kdt.gametrend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import edu.kdt.gametrend.calendar.CalendarController;
import edu.kdt.gametrend.calendar.CalendarDAO;
import edu.kdt.gametrend.carousel.CarouselController;
import edu.kdt.gametrend.carousel.CarouselDAO;
import edu.kdt.gametrend.game.GameController;
import edu.kdt.gametrend.game.GameDAO;
import edu.kdt.gametrend.member.MemberController;
import edu.kdt.gametrend.member.MemberDAO;
import edu.kdt.gametrend.promotion.PromotionController;
import edu.kdt.gametrend.promotion.PromotionDAO;
import edu.kdt.gametrend.review.ReviewController;
import edu.kdt.gametrend.review.ReviewDAO;

@SpringBootApplication
@ComponentScan // 같은 패키지
@ComponentScan(basePackageClasses = GameController.class)
@ComponentScan(basePackageClasses = CarouselController.class)
@ComponentScan(basePackageClasses = MemberController.class)
@ComponentScan(basePackageClasses = PromotionController.class)
@ComponentScan(basePackageClasses = CalendarController.class)
@ComponentScan(basePackageClasses = ReviewController.class)

@MapperScan(basePackageClasses = GameDAO.class)
@MapperScan(basePackageClasses = CarouselDAO.class)
@MapperScan(basePackageClasses = MemberDAO.class)
@MapperScan(basePackageClasses = PromotionDAO.class)
@MapperScan(basePackageClasses = CalendarDAO.class)
@MapperScan(basePackageClasses = ReviewDAO.class)
public class Gametrend2Application {

	public static void main(String[] args) {
		SpringApplication.run(Gametrend2Application.class, args);
	}

}
