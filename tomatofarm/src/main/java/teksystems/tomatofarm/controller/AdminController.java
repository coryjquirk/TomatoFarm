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
import teksystems.tomatofarm.formbean.EditUserFormBean;

import javax.validation.Valid;
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

        //allUserRoles?
        List<UserRole> allUserRoles = userRoleRepository.findAll();

        response.setViewName("/admin/directory");
        response.addObject("allUsers", allUsers);
        response.addObject("allUserRoles", allUserRoles);
        return response;
    }

    @GetMapping("/admin/userEdit/{userId}")
    public ModelAndView editUser(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("admin/userEdit");

        User userToEdit = userRepository.findById(userId);
        List<UserRole> userRoles = userRoleRepository.findByUserId(userToEdit.getId());
        EditUserFormBean form = new EditUserFormBean();

        form.setId(userToEdit.getId());
        form.setEmail(userToEdit.getEmail());
        form.setFirstName(userToEdit.getFirstName());
        form.setLastName(userToEdit.getLastName());
        for (UserRole userRole : userRoles){
            log.info("User's roles: " + userRole.getUserRole());
            if(userRole.getUserRole().equals("ADMIN")){
                form.setAdmin(true);
            }
        }
        response.addObject("form", form);
        return response;
    }

    @RequestMapping(value = "/admin/userSubmit", method = { RequestMethod.POST, RequestMethod.GET})
    public ModelAndView editUserSubmit(@Valid EditUserFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + " " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("/admin/userEdit/{userId}");
            return response;
        }
        User userToEdit = userRepository.findById(form.getId());
        List<UserRole> userRoles = userRoleRepository.findByUserId(userToEdit.getId());

        UserRole newUserRole = new UserRole();
        String newFirstName = form.getFirstName();
        String newLastName = form.getLastName();
        Boolean isAdmin = form.isAdmin();
        if (newFirstName!=null){
            userToEdit.setFirstName(newFirstName);
        }
        if (newLastName!=null){
            userToEdit.setLastName(newLastName);
        }
        if (isAdmin){
            newUserRole.setUserRole("ADMIN");
            newUserRole.setUserId(userToEdit.getId());
        }

        if (isAdmin) {
            //if this already exists, don't set
            //loop is not the best way to do this. need to check if list contains.
            for (UserRole userRole : userRoles) {
                if (userRole.getUserRole().equals("ADMIN")) {
                    log.info("User is already an admin. Moving on.");
                } else {
                    newUserRole.setUserRole("ADMIN");
                    newUserRole.setUserId(userToEdit.getId());
                    log.info(userToEdit.getEmail() + " now has role ADMIN.");
                    userRoleRepository.save(newUserRole);
                }
            }
        } else if (!isAdmin){
            log.info("Not an admin, add logic to delete potential Admin rows if possible.");
        }
        userRepository.save(userToEdit);
        log.info("Updated user info:"+form);
        response.setViewName("redirect:/admin/directory");
        return response;
    }
}