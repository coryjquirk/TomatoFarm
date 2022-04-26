package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.dao.UserRoleDAO;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;
import teksystems.tomatofarm.formbean.RegisterFormBean;

import javax.validation.Valid;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Slf4j
@Controller
public class RegisterController {

    @Autowired
    private UserDAO userRepository;
    @Autowired
    private UserRoleDAO userRoleRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/register/registerForm", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("register/registerForm");
        RegisterFormBean form = new RegisterFormBean();
        response.addObject("form", form);
        return response;
    }

    @RequestMapping(value = "/register/registerSubmit", method = { RequestMethod.POST, RequestMethod.GET})
    public ModelAndView registerSubmit(@Valid RegisterFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug(((FieldError)error).getField() + " " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("register/registerForm");
            return response;
        }
        User user = userRepository.findById(form.getId());
        if (user == null) {
            user = new User();
        }
        String password = passwordEncoder.encode(form.getPassword());
        user.setEmail(form.getEmail());
        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setPassword(password);
        user.setCreateDate(new Date());
        userRepository.save(user);
        Integer newUserId = userRepository.findByEmail(user.getEmail()).getId();
        UserRole newUserRole = new UserRole();
        newUserRole.setUserRole("USER");
        newUserRole.setUserId(newUserId);
        userRoleRepository.save(newUserRole);
        response.setViewName("redirect:/login/login");
        try {
            boolean deletesuccess = (new File("registerlog.txt")).delete();
            if (deletesuccess){
                log.info("registerlog.txt deleted.");
            }
            BufferedWriter output = new BufferedWriter(new FileWriter("registerlog.txt", true));
            List<User> allUsers = userRepository.findAll();
            output.write("Last updated: "+new Date()+"\n");
            allUsers.forEach((User)-> {
                try {
                    output.write("ID: "+User.getId()+" "+User.getFirstName()+" "+User.getLastName()+" "+User.getEmail()+" "+User.getCreateDate()+"\n");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
            output.flush();
            output.close();
        } catch (IOException e) {
            e.printStackTrace();
            log.error("Register output has failed.");
        }
        return response;
    }
}