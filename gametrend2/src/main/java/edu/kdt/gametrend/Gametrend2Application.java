package edu.kdt.gametrend;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import edu.kdt.gametrend.game.GameController;
import edu.kdt.gametrend.game.GameDAO;

@SpringBootApplication
@ComponentScan // 같은 패키지
@ComponentScan(basePackageClasses = GameController.class)
@MapperScan(basePackageClasses = GameDAO.class)
public class Gametrend2Application {

	public static void main(String[] args) {
		SpringApplication.run(Gametrend2Application.class, args);
	}

}
