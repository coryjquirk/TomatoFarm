package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.formbean.PlotFormBean;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
public class PlotController {

    @Autowired
    private PlotDAO plotRepository;

    @Autowired
    private UserDAO userRepository;

    @RequestMapping(value = "/plots/allPlots", method = RequestMethod.GET)
    public ModelAndView allPlots() throws Exception {
        ModelAndView response = new ModelAndView();

        List<Plot> allPlots = plotRepository.findAll();
        List<User> allUsers = userRepository.findAll();
        response.setViewName("/plots/allPlots");
        response.addObject("allPlots", allPlots);

        return response;
    }

    @RequestMapping(value = "/plots/addPlot", method = RequestMethod.GET)
    public ModelAndView addPlot() throws Exception {
        ModelAndView response = new ModelAndView();

        List<User> allUsers = userRepository.findAll();
        List<String> allSoils = plotRepository.findDistinctSoil();
        List<String> allCultivationStyles = plotRepository.findDistinctCultivationStyle();

        response.setViewName("/plots/addPlot");
        response.addObject("allSoils", allSoils);
        response.addObject("allUsers", allUsers);
        response.addObject("allCultivationStyles", allCultivationStyles);

        return response;
    }

    @RequestMapping(value = "/plot/plotSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView submitPlot(@Valid PlotFormBean form, BindingResult bindingResult) throws Exception{
        ModelAndView response = new ModelAndView();
        if (bindingResult.hasErrors()){
            for (FieldError error : bindingResult.getFieldErrors()) {
                log.debug(error.toString());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            List<User> allUsers = userRepository.findAll();
            List<String> allSoils = plotRepository.findDistinctSoil();
            List<String> allCultivationStyles = plotRepository.findDistinctCultivationStyle();
            response.addObject("allSoils", allSoils);
            response.addObject("allUsers", allUsers);
            response.addObject("allCultivationStyles", allCultivationStyles);
            response.setViewName("plots/addPlot");
            return response;
        } else {
            Plot newPlot = new Plot();
            String soilMakeup = form.getSoilMakeup();
            String cultivationStyle = form.getCultivationStyle();
            newPlot.setUserId(form.getUserId());
            if (soilMakeup!=null){
                newPlot.setSoilMakeup(soilMakeup);
            }
            if (cultivationStyle!=null){
                newPlot.setCultivationStyle(cultivationStyle);
            }
            newPlot.setSpacesTaken(0);
            newPlot.setSpacesTotal(form.getSpacesTotal());
            plotRepository.save(newPlot);
        }
        response.setViewName("redirect:/plots/allPlots");
        return response;
    }
}