package teksystems.tomatofarm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;


@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
public class TomatofarmApplication {

	public static void main(String[] args) {
		SpringApplication.run(TomatofarmApplication.class, args);
	}
//	TODO: DONE:
//			- Spring Security access levels, sign-in, and registration.
//			- functionality to add new plots and tomato varieties to DB.
//			- baseline front end bootstrap design
//			- add plants to plot with table of plants for each plot (specify variety).
//		PRIORITY TO-DO:
//			- check rubric requirements for anything missing
//			- link from plot detail to assigned user
//			- finish search method to find plots, plants, and users.
//			- comb app for potential errors/vulnerabilities
//			- Junit test coverage
//		EXTRAS/POLISHING:
//			- bring in an API to bring in additional data
//			- front end: add more photos, JavaScript tricks
//    		- personalize with stuff from real life farm/garden experience.
}
