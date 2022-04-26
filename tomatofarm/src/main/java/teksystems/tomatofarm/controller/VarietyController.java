package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import teksystems.tomatofarm.database.dao.VarietyDAO;
import teksystems.tomatofarm.database.entity.Variety;
import teksystems.tomatofarm.formbean.VarietyFormBean;

import javax.validation.Valid;
import java.util.List;

@PreAuthorize("hasAnyAuthority('ADMIN', 'USER')")
@Slf4j
@Controller
public class VarietyController {

    @Autowired
    private VarietyDAO varietyRepository;


    @GetMapping(value = "/varieties/allVarieties")
    public ModelAndView allVarieties() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("varieties/allVarieties");
        List<Variety> allVarieties = varietyRepository.findAll();
        response.addObject("allVarieties", allVarieties);
        VarietyFormBean form = new VarietyFormBean();
        response.addObject("form", form);
        return response;
    }
    @GetMapping(value = "/varieties/grid")
    public ModelAndView varietiesGrid() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("varieties/grid");
        List<Variety> allVarieties = varietyRepository.findAll();
        response.addObject("varieties", allVarieties);
        VarietyFormBean form = new VarietyFormBean();
        response.addObject("form", form);
        return response;
    }
    @GetMapping(value = "/varieties/list")
    public ModelAndView varietiesList() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("varieties/list");
        List<Variety> allVarieties = varietyRepository.findAll();
        response.addObject("varieties", allVarieties);
        VarietyFormBean form = new VarietyFormBean();
        response.addObject("form", form);
        return response;
    }
    @GetMapping(value = "/varieties/addVariety")
    public ModelAndView addVariety() throws Exception {
        ModelAndView response = new ModelAndView();
        List<String> categories = varietyRepository.findDistinctCategory();
        response.addObject("categories", categories);
        response.setViewName("varieties/addVariety");
        return response;
    }
    @PostMapping(value = "/variety/varietySubmit")
    public ModelAndView submitVariety(@Valid VarietyFormBean form, BindingResult bindingResult) throws Exception {
        ModelAndView response = new ModelAndView();
        String newVarietyName = form.getVarietyName();
        if (bindingResult.hasErrors()) {
            for (FieldError error : bindingResult.getFieldErrors()) {
                log.debug(error.toString());
            }
            response.addObject("form", form);
            response.addObject("bindingResult", bindingResult);
            List<String> categories = varietyRepository.findDistinctCategory();
            response.addObject("categories", categories);
            //redirects to addVariety page with relevant error messages
            response.setViewName("varieties/addVariety");
            return response;
        } else if (varietyRepository.findByVarietyName(newVarietyName)!=null) {
            log.info(newVarietyName + " already exists in the database.");
        } else {
            Variety newVariety = new Variety();
            String newVarietyUrl = form.getImageUrl();
            newVariety.setVarietyName(newVarietyName);
            newVariety.setColor(form.getColor());
            newVariety.setCategory(form.getCategory());
            if (newVarietyUrl!=null){
                newVariety.setImageUrl(newVarietyUrl);
            }
            varietyRepository.save(newVariety);
        }
        response.setViewName("redirect:/varieties/grid");
        return response;
    }
}
