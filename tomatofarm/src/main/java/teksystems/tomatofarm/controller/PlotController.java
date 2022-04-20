package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.dao.VarietyDAO;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;
import teksystems.tomatofarm.database.entity.UserRole;
import teksystems.tomatofarm.database.entity.Variety;
import teksystems.tomatofarm.formbean.EditUserFormBean;
import teksystems.tomatofarm.formbean.PlotEditFormBean;
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
    @Autowired
    private VarietyDAO varietyRepository;
    @RequestMapping(value = "/plots/allPlots", method = RequestMethod.GET)
    public ModelAndView allPlots() throws Exception {
        ModelAndView response = new ModelAndView();
        List<Plot> allPlots = plotRepository.findAll();
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

    @RequestMapping(value = "/plots/plotSubmit", method = {RequestMethod.POST, RequestMethod.GET})
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
            User steward = userRepository.findById(form.getUserId());
            newPlot.setUserId(steward.getId());
            newPlot.setUserFullname(steward.getFirstName() + " " + steward.getLastName());
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
    @GetMapping("/plots/detail/{plotId}")
    public ModelAndView plotDetail(@PathVariable("plotId") Integer plotId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("plots/detail");

        Plot plotToDetail = plotRepository.findById(plotId);
        List<Variety> allVarieties = varietyRepository.findAll();
        response.addObject("varieties", allVarieties);
        response.addObject("plot", plotToDetail);
        return response;
    }
    //TODO: write method that serves up plants depending on specified plot.
    @GetMapping("/plots/editPlot/{plotId}")
    public ModelAndView editPlot(@PathVariable("plotId") Integer plotId) throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("plots/editPlot");

        Plot plotToEdit = plotRepository.findById(plotId);
        PlotEditFormBean form = new PlotEditFormBean();
        List<User> allUsers = userRepository.findAll();
        List<String> allSoils = plotRepository.findDistinctSoil();
        List<String> allCultivationStyles = plotRepository.findDistinctCultivationStyle();

        form.setId(plotToEdit.getId());
        form.setUserId(plotToEdit.getUserId());
        form.setSoilMakeup(plotToEdit.getSoilMakeup());
        form.setCultivationStyle(plotToEdit.getCultivationStyle());
        form.setSpacesTotal(plotToEdit.getSpacesTotal());
        form.setSpacesTaken(plotToEdit.getSpacesTaken());

        response.addObject("form", form);
        response.addObject("allSoils", allSoils);
        response.addObject("allUsers", allUsers);
        response.addObject("allCultivationStyles", allCultivationStyles);
        return response;
    }
    @RequestMapping(value = "/plots/plotEditSubmit", method = { RequestMethod.POST, RequestMethod.GET})
    public ModelAndView editPlotSubmit(@Valid PlotEditFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.info(((FieldError) error).getField() + " " + error.getDefaultMessage());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            response.setViewName("/plots/editPlot/{plotId}");
            return response;
        }
        Plot plotToEdit = plotRepository.findById(form.getId());
        Integer newSpaces = form.getSpacesTotal();

        plotToEdit.setUserId(form.getUserId());
        plotToEdit.setSoilMakeup(form.getSoilMakeup());
        plotToEdit.setCultivationStyle(form.getCultivationStyle());
        if (newSpaces >= plotToEdit.getSpacesTaken()){
          plotToEdit.setSpacesTotal(newSpaces);
        } else {
            log.info("New spaces total must be.");
        }
        plotRepository.save(plotToEdit);
        response.setViewName("redirect:/plots/allPlots");
        return response;
    }
}