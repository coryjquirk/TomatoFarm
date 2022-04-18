package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.dao.UserRoleDAO;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class AdminController {

    @Autowired
    private UserDAO userRepository;
    @Autowired
    private UserRoleDAO userRoleRepository;

    @RequestMapping(value = "admin/userAdmin", method = RequestMethod.GET)
    public ModelAndView userAdmin() throws Exception {
        ModelAndView response = new ModelAndView();

        response.setViewName("/admin/userAdmin");

        return response;
    }

    @RequestMapping(value = "/admin/directory", method = RequestMethod.GET)
    public ModelAndView directory() throws Exception {
        ModelAndView response = new ModelAndView();

        List<User> allUsers = userRepository.findAll();
        List<UserRole> allUserRoles = userRoleRepository.findAll();

        response.setViewName("/admin/directory");
        response.addObject("allUsers", allUsers);
        return response;
    }
}