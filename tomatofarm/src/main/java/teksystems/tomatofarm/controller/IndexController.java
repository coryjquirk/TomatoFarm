package teksystems.tomatofarm.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.entity.User;

import java.util.List;

@Slf4j
@Controller
public class IndexController {


    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() throws Exception {
        ModelAndView response = new ModelAndView();

        List<User> allUsers = userDao.findAll();

        for( User user : allUsers ) {
            log.debug(user.toString());
        }

        response.setViewName("index");

        return response;
    }


}

