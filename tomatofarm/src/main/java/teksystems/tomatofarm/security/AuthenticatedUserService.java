package teksystems.tomatofarm.security;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import teksystems.tomatofarm.database.entity.User;

import javax.servlet.http.HttpSession;

@Component
public class AuthenticatedUserService {
    public static User getCurrentUser() {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User user = (User) session.getAttribute("user");
        return user;
    }
}
