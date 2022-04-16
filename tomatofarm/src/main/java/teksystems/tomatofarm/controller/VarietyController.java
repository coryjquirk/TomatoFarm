package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.VarietyDAO;
import teksystems.tomatofarm.database.entity.Variety;
import teksystems.tomatofarm.formbean.VarietyFormBean;

import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
public class VarietyController {

    @Autowired
    private VarietyDAO varietyDAO;

    @RequestMapping(value = "/varieties/allVarieties", method = RequestMethod.GET)
    public ModelAndView varieties() throws Exception {
        ModelAndView response = new ModelAndView();
        List<Variety> allVarieties = varietyDAO.findAll();
        response.setViewName("varieties/allVarieties");
        response.addObject("allVarieties", allVarieties);
        return response;
    }
    @RequestMapping(value = "/varieties/addVariety", method = RequestMethod.GET)
    public ModelAndView addVariety() throws Exception {
        ModelAndView response = new ModelAndView();
        List<String> categories = varietyDAO.findDistinctCategory();
        response.setViewName("varieties/addVariety");
        response.addObject("categories", categories);
        return response;
    }

    @RequestMapping(value = "/variety/varietySubmit", method = RequestMethod.GET)
    public ModelAndView submit(@Valid VarietyFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        if (bindingResult.hasErrors()) {
            for (FieldError error : bindingResult.getFieldErrors()) {
                log.debug(error.toString());
            }
            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);
        } else {
            Variety variety = new Variety();
            variety.setVarietyName(form.getVarietyName());
            variety.setColor(form.getColor());
            variety.setCategory(form.getCategory());
            varietyDAO.save(variety);
        }
        response.setViewName("redirect:/varieties/allVarieties");
        return response;
    }

//    @RequestMapping(value = "/variety/delete/{id}", method = RequestMethod.GET)
//    public ModelAndView deleteVariety() throws Exception {
//        ModelAndView response = new ModelAndView();
//        response.setViewName("variety");
//        return response;
//    }
}
