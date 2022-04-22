package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
import teksystems.tomatofarm.formbean.AccountEditFormBean;
import teksystems.tomatofarm.formbean.RegisterFormBean;
import teksystems.tomatofarm.service.UserService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class UserController {

    @Autowired
    private UserDAO userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserService userService;
    @Autowired
    private UserRoleDAO userRoleRepository;

    @GetMapping("/user/edit/{userId}")
    public ModelAndView editUser(@PathVariable("userId") Integer userId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/edit");

        User user = userRepository.findById(userId);

        RegisterFormBean form = new RegisterFormBean();

        form.setId(Math.toIntExact(user.getId()));
        form.setEmail(user.getEmail());
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        form.setPassword(user.getPassword());
        form.setConfirmPassword(user.getPassword());
        response.addObject("user", user);
        response.addObject("form", form);

        return response;
    }

    @GetMapping(value="/user/search")
    public ModelAndView search(@RequestParam(value = "firstName", required = false) String firstName) {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/search");

        List<User> users = new ArrayList<>();

        if (!StringUtils.isEmpty(firstName)) {
            users = userRepository.findByFirstNameIgnoreCaseContaining(firstName);
        }

        response.addObject("usersModelKey", users);
        response.addObject("firstName", firstName);

        return response;
    }
    @GetMapping(value="/user/accountEditForm")
    public ModelAndView accountEdit() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("user/accountEditForm");

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User user = userRepository.findByEmail(username);
        List<UserRole> userRoles = userRoleRepository.findByUserId(user.getId());

        AccountEditFormBean form = new AccountEditFormBean();
        form.setFirstName(user.getFirstName());
        form.setLastName(user.getLastName());
        response.addObject("user", user);
        response.addObject("form", form);
        response.addObject("userRoles", userRoles);
        return response;
    }

    @RequestMapping(value = "/user/accountEditSubmit", method = { RequestMethod.POST, RequestMethod.GET})
    public ModelAndView accountEditSubmit(@Valid AccountEditFormBean form, BindingResult bindingResult) throws Exception{
        ModelAndView response = new ModelAndView();

        log.info(form.toString());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();
        User authenticatedUser = userRepository.findByEmail(username);
        if (bindingResult.hasErrors()){
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug( ((FieldError)error).getField() + " " +  error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("/user/accountEditForm");
            return response;
        }
        Integer authenticatedUserID = authenticatedUser.getId();
        User userToEdit = userRepository.findById(authenticatedUserID);
        String newPassword = form.getNewPassword();
        String confirmNewPassword = form.getConfirmPassword();

        String newFirstName = form.getFirstName();
        String newLastName = form.getLastName();
        if (newPassword!=null){
            if(userService.changePasswordValidator(newPassword, confirmNewPassword)){
                userToEdit.setPassword(passwordEncoder.encode(confirmNewPassword));
            }
        }
        if (newFirstName!=null && !newFirstName.equals(userToEdit.getFirstName())){
            userToEdit.setFirstName(newFirstName);
        }
        if (newLastName!=null && !newLastName.equals(userToEdit.getLastName())){
            userToEdit.setLastName(newLastName);
        }
        userRepository.save(userToEdit);
        response.setViewName("redirect:/index");
        return response;
    }
}
