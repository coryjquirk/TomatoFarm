package teksystems.tomatofarm.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class UserService {
    public boolean changePasswordValidator(String password, String confirmPassword){
        if (password.equals(confirmPassword)) {
            log.info("New passwords match.");
            return true;
        } else{
            log.info("New passwords don't match.");
            return false;
        }
    }
}
