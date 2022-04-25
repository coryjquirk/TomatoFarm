package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.dao.UserRoleDAO;
import teksystems.tomatofarm.database.dao.VarietyDAO;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;
import teksystems.tomatofarm.database.entity.Variety;
import teksystems.tomatofarm.formbean.AccountEditFormBean;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class SearchController {
    @Autowired
    private UserDAO userRepository;
    @Autowired
    private PlotDAO plotRepository;
    @Autowired
    private VarietyDAO varietyRepository;

    @GetMapping(value = "/search/searchIndex")
    public ModelAndView searchIndex() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("search/searchIndex");
        return response;
    }

    @GetMapping(value = "/search/users")
    public ModelAndView userSearch(
            @RequestParam(value = "firstName", required = false) String firstName,
            @RequestParam(value = "lastName", required = false) String lastName,
            @RequestParam(value = "emailAddress", required = false) String emailAddress) {
        ModelAndView response = new ModelAndView();
        response.setViewName("search/users");
        List<User> users = new ArrayList<>();
        if (!StringUtils.isEmpty(firstName)) {
            users = userRepository.findByFirstNameIgnoreCaseContaining(firstName);
        }
        if (!StringUtils.isEmpty(lastName)) {
            users = userRepository.findByLastNameIgnoreCaseContaining(lastName);
        }
        if (!StringUtils.isEmpty(emailAddress)) {
            users = userRepository.findByEmailIgnoreCaseContaining(emailAddress);
        }
        response.addObject("userResults", users);
        response.addObject("firstName", firstName);
        response.addObject("lastName", lastName);
        response.addObject("emailAddress", emailAddress);
        return response;
    }

    @GetMapping(value = "/search/plots")
    public ModelAndView plotSearch(
            @RequestParam(value = "soilMakeup", required = false) String soilMakeup,
            @RequestParam(value = "cultivationStyle", required = false) String cultivationStyle,
            @RequestParam(value = "userId", required = false) Integer userId) {
        ModelAndView response = new ModelAndView();
        response.setViewName("search/plots");
        List<String> allSoils = plotRepository.findDistinctSoil();
        List<String> allCultivationStyles = plotRepository.findDistinctCultivationStyle();
        List<User> allUsers = userRepository.findAll();
        List<Plot> plotResults = new ArrayList<>();
        if (soilMakeup != null) {
            log.info("soilMakeup received: " + soilMakeup);
            plotResults = plotRepository.findBySoilMakeup(soilMakeup);
            log.info("plotResults by soil: " + plotResults.toString());
        }
        if (cultivationStyle != null) {
            log.info("cultivationStyle received: " + cultivationStyle);
            plotResults = plotRepository.findByCultivationStyle(cultivationStyle);
            log.info("plotResults by cultivation style: " + plotResults.toString());
        }
        if (userId != null) {
            log.info("userId received: " + userId);
            plotResults = plotRepository.findByUserId(userId);
            log.info("plotResults by user: " + plotResults.toString());
        }
        response.addObject("plotResults", plotResults);
        response.addObject("allSoils", allSoils);
        response.addObject("allCultivationStyles", allCultivationStyles);
        response.addObject("allUsers", allUsers);
        return response;
    }

    @GetMapping(value = "/search/varieties")
    public ModelAndView varietySearch(
            @RequestParam(value = "varietyName", required = false) String varietyName,
            @RequestParam(value = "category", required = false) String category) {
        ModelAndView response = new ModelAndView();
        response.setViewName("search/varieties");
        List<Variety> varietyResults = new ArrayList<>();
        List<String> allCategories = varietyRepository.findDistinctCategory();
        if (!StringUtils.isEmpty(varietyName)) {
            log.info("varietyName received: " + varietyName);
            varietyResults = varietyRepository.findAllByVarietyNameContaining(varietyName);
            log.info("varietyResults by name: " + varietyResults.toString());
        }
        if (!StringUtils.isEmpty(category)) {
            log.info("category received: " + category);
            varietyResults = varietyRepository.findAllByCategory(category);
            log.info("varietyResults by category: " + varietyResults.toString());
        }
        //TODO: button which shows all plots containing resulting varieties.
        response.addObject("allCategories", allCategories);
        response.addObject("varietyResults", varietyResults);
        return response;
    }
}