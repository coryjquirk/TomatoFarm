package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.PlotDAO;
import teksystems.tomatofarm.database.dao.UserDAO;
import teksystems.tomatofarm.database.entity.Plot;
import teksystems.tomatofarm.database.entity.User;

import java.util.List;

@Slf4j
@Controller
public class PlotsController {

    @Autowired
    private PlotDAO plotDao;

    @Autowired
    private UserDAO userDao;

    @RequestMapping(value = "/plots/allPlots", method = RequestMethod.GET)
    public ModelAndView allPlots() throws Exception {
        ModelAndView response = new ModelAndView();

        List<Plot> allPlots = plotDao.findAll();

        response.setViewName("/plots/allPlots");
        response.addObject("allPlots", allPlots);

        return response;
    }

    @RequestMapping(value = "/plots/addPlot", method = RequestMethod.GET)
    public ModelAndView addPlot() throws Exception {
        ModelAndView response = new ModelAndView();

        List<String> userNames = userDao.findDistinctUserFirstLastName();
        List<String> soils = plotDao.findDistinctSoil();
        List<String> cultivationStyles = plotDao.findDistinctCultivationStyle();

        response.setViewName("/plots/addPlot");
        response.addObject("soils", soils);
        response.addObject("userNames", userNames);
        response.addObject("cultivationStyles", cultivationStyles);

        return response;
    }
}