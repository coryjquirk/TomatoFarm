package teksystems.tomatofarm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import teksystems.tomatofarm.security.UserDetailsServiceImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration //this is key for component scan
@EnableWebSecurity //"turns on" Spring Security
@EnableGlobalMethodSecurity(prePostEnabled=true) //enables us to put security on controllers
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Override
    protected void configure(final HttpSecurity http) throws Exception{
        http
            .csrf().disable()
                .authorizeRequests()
                //TODO: these will need to correspond with my pages.
                .antMatchers("/pub/**", "/error/**", "/login/**", "/index").permitAll()
                .antMatchers("/admin/**", "/plots/**", "/user/**", "/varieties/**").authenticated()
                .and()
            .formLogin()
                .loginPage("/login/login")
                .loginProcessingUrl("/login/loginSubmit")
                .defaultSuccessUrl("/index")
                .and()
            .logout()
                .invalidateHttpSession(true)
                .logoutUrl("/login/logout")
                .logoutSuccessUrl("/index")
                .and()
            .exceptionHandling()
                .accessDeniedPage("/error/404");
    }

    @Bean
    public DaoAuthenticationProvider getAuthenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService);
        authProvider.setPasswordEncoder(getPasswordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService);
        auth.authenticationProvider(getAuthenticationProvider());
    }

    @Bean(name="passwordEncoder")
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
