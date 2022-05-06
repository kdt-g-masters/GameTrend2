package edu.kdt.gametrend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan // 같은 패키지
public class Gametrend2Application {

	public static void main(String[] args) {
		SpringApplication.run(Gametrend2Application.class, args);
	}

}
