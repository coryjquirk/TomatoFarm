package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.formbean.RegisterFormBean;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userDao;

    @GetMapping("/user/edit/{userId}")
    public ModelAndView editUser(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/edit");

        User user = userDao.findById(userId);

        RegisterFormBean form = new RegisterFormBean();

        form.setId(Math.toIntExact(user.getId()));
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setPassword(user.getPassword());
        form.setConfirmPassword(user.getPassword());

        response.addObject("form", form);

        return response;
    }

    @RequestMapping(value="/user/search", method= RequestMethod.GET )
    public ModelAndView search(@RequestParam(value = "firstName", required = false) String firstName) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = new ArrayList<>();

        if (!StringUtils.isEmpty(firstName)) {
            users = userDao.findByFirstNameIgnoreCaseContaining(firstName);
        }

        response.addObject("usersModelKey", users);
        response.addObject("firstName", firstName);

        return response;
    }
}
