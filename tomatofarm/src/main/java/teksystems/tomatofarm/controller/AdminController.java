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
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.dao.UserRoleDAO;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;
import teksystems.tomatofarm.formbean.EditUserFormBean;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
public class AdminController {

    @Autowired
    private UserDAO userRepository;
    @Autowired
    private UserRoleDAO userRoleRepository;
    @Autowired
    private PlotDAO plotRepository;

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
        List<Plot> userPlots = plotRepository.findByUserId(userId);
        List<Plot> allPlots = plotRepository.findAll();
        log.info(userPlots.toString());

        EditUserFormBean form = new EditUserFormBean();

        form.setId(userToEdit.getId());
        form.setEmail(userToEdit.getEmail());
        form.setFirstName(userToEdit.getFirstName());
        form.setLastName(userToEdit.getLastName());
        log.info("User's roles: ");
        for (UserRole userRole : userRoles){
            log.info(userRole.getUserRole());
            if(userRole.getUserRole().equals("ADMIN")){
                form.setAdmin(true);
            }
        }
        response.addObject("user", userToEdit);
        response.addObject("userRoles", userRoles);
        response.addObject("allPlots", allPlots);
        response.addObject("userPlots", userPlots);
        response.addObject("form", form);
        return response;
    }

    @RequestMapping(value = "/admin/assignPlot", method = RequestMethod.GET)
    public ModelAndView index(@RequestParam(name="userId") Integer userId, @RequestParam(name="plotId") Integer plotId) throws Exception{
        ModelAndView response = new ModelAndView();
        User userToAssign = userRepository.findById(userId);
        Plot plotToAssign = plotRepository.findById(plotId);
        plotToAssign.setUserId(userId);
        plotToAssign.setUserFullname(userToAssign.getFirstName()+" "+userToAssign.getLastName());
        plotRepository.save(plotToAssign);
        response.setViewName("redirect:/admin/userEdit/"+userId);
        return response;
    }

    //TODO: protect this method with authorization so only ADMIN can access this.
    @Transactional
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
        Integer userToEditId = userToEdit.getId();
        List<UserRole> userRoles = userRoleRepository.findByUserId(userToEditId);
        List<String> roleStrings = new ArrayList<>();
        List<Plot> userPlots = plotRepository.findByUserId(userToEditId);
        for(UserRole userRole : userRoles){
            //adds user role strings to ArrayList of userRoles defined above.
            roleStrings.add(userRole.getUserRole());
        }
        log.debug("Current roles: "+roleStrings);
        String newFirstName = form.getFirstName();
        String newLastName = form.getLastName();
        if (newFirstName!=null){
            userToEdit.setFirstName(newFirstName);
        }
        if (newLastName!=null){
            userToEdit.setLastName(newLastName);
        }
        if (newLastName != null || newLastName != null){
            String firstNameForPlot = userToEdit.getFirstName();
            String lastNameForPlot = userToEdit.getLastName();
            for (Plot plot : userPlots){
                if (newLastName != null){
                    firstNameForPlot = newFirstName;
                }
                if (newLastName != null){
                    lastNameForPlot = newLastName;
                }
                plot.setUserFullname(firstNameForPlot + " " + lastNameForPlot);
                log.debug("New full name for plot: "+firstNameForPlot + " " + lastNameForPlot);
            }
        }
        Boolean adminChecked = form.isAdmin();
        Boolean isAlreadyAdmin = roleStrings.contains("ADMIN");
        log.info("Contains ADMIN?: " + isAlreadyAdmin);
        if (adminChecked) {
            if (isAlreadyAdmin){
                log.info("User " + userToEdit.getEmail() + " is already an admin.");
            } else {
                UserRole newUserRole = new UserRole();
                newUserRole.setUserRole("ADMIN");
                newUserRole.setUserId(userToEditId);
                log.info(userToEdit.getEmail() + " now has role ADMIN.");
                userRoleRepository.save(newUserRole);
            }
        } else if (!adminChecked){
            if (isAlreadyAdmin) {
                userRoleRepository.deleteByUserRoleAndUserId("ADMIN", userToEditId);
                log.info(userToEdit.getEmail() + " is no longer an ADMIN.");
            } else {
                log.info(userToEdit.getEmail() + " wasn't an ADMIN, and still isn't.");
            }
        }
        userRepository.save(userToEdit);
        log.info("Updated user info: "+form);
        response.setViewName("redirect:/admin/directory");
        return response;
    }
}