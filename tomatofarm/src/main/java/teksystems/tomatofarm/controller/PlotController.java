package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.*;
import teksystems.tomatofarm.database.entity.*;
import teksystems.tomatofarm.formbean.PlotEditFormBean;
import teksystems.tomatofarm.formbean.PlotFormBean;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.ArrayList;
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
    @Autowired
    private PlantDAO plantRepository;
    @Autowired
    PlotsPlantsDAO plotsPlantsRepository;

    @GetMapping(value = "/plots/allPlots")
    public ModelAndView allPlots() throws Exception {
        ModelAndView response = new ModelAndView();
        List<Plot> allPlots = plotRepository.findAll();
        response.setViewName("/plots/allPlots");
        response.addObject("allPlots", allPlots);
        return response;
    }

    @GetMapping(value = "/plots/addPlot")
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

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping(value = "/plots/plotSubmit")
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
        List<PlotsPlants> plotsPlants = plotsPlantsRepository.findPlotsPlantsByPlotId(plotId);
        List<Plant> plantsInThisPlot = new ArrayList<>();
        for (PlotsPlants plotPlantInPlot : plotsPlants){
            Plant actualPlant = plotPlantInPlot.getPlant();
            Variety actualVariety = varietyRepository.findById(actualPlant.getVarietyId());
            actualPlant.setVarietyName(actualVariety.getVarietyName());
            actualPlant.setImageUrl(actualVariety.getImageUrl());
            actualPlant.setCategory(actualVariety.getCategory());
            plantsInThisPlot.add(actualPlant);
        }
        response.addObject("plants", plantsInThisPlot);
        response.addObject("allVarieties", allVarieties);
        response.addObject("plot", plotToDetail);
        return response;
    }
    @GetMapping("/plots/detail/addPlantSubmit")
    public ModelAndView addPlantSubmit(@RequestParam("plotId") Integer plotId, @RequestParam("varietyId") Integer varietyId, @RequestParam("plantsQty") Integer plantsQty) throws Exception{
        ModelAndView response = new ModelAndView();
        Variety variety = varietyRepository.findById(varietyId);
        Plot plot = plotRepository.findById(plotId);
        Integer spacesTaken = plot.getSpacesTaken();
        //TODO: add BindingResult that restricts user from adding more plants than there are spaces available.
        for (int i = 0; i < plantsQty; i++){
            PlotsPlants newPlotsPlants = new PlotsPlants();
            Plant newPlant = new Plant();
            newPlant.setVarietyId(varietyId);
            newPlant.setVarietyName(variety.getVarietyName());
            newPlant.setImageUrl(variety.getImageUrl());
            newPlant.setImageUrl(variety.getCategory());
            newPlotsPlants.setPlant(newPlant);
            newPlotsPlants.setPlot(plot);
            plantRepository.save(newPlant);
            plotsPlantsRepository.save(newPlotsPlants);
            log.info("New plant: " + newPlant);
            log.info("New plotsPlants object: " + newPlotsPlants);
        }
        plot.setSpacesTaken(spacesTaken + plantsQty);
        plotRepository.save(plot);
        response.setViewName("redirect:/plots/detail/"+plotId);
        return response;
    }

    //TODO: Delete plant. need to delete plot_plant and plant object simultaneously.

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
        Integer newId = form.getUserId();
        User newUser = userRepository.findById(newId);
        String newFullName = (newUser.getFirstName()+" "+newUser.getLastName());
        plotToEdit.setUserId(newId);
        plotToEdit.setUserFullname(newFullName);
        plotToEdit.setSoilMakeup(form.getSoilMakeup());
        plotToEdit.setCultivationStyle(form.getCultivationStyle());
        if (newSpaces >= plotToEdit.getSpacesTaken()){
          plotToEdit.setSpacesTotal(newSpaces);
        } else {
            log.info("New spaces total must be greater than spaces taken.");
        }
        plotRepository.save(plotToEdit);
        response.setViewName("redirect:/plots/allPlots");
        return response;
    }
}