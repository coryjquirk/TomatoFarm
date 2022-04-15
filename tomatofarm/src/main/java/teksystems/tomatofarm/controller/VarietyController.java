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

@Slf4j
@Controller
public class VarietyController {

    @Autowired
    private VarietyDAO varietyDAO;

    @RequestMapping(value="/variety", method= RequestMethod.GET)
    public ModelAndView userList() throws Exception{
        ModelAndView response = new ModelAndView();
        response.setViewName("variety");
        return response;
    }

    @RequestMapping(value="/variety/varietySubmit", method = RequestMethod.GET)
    public ModelAndView submit(VarietyFormBean form, BindingResult bindingResult) throws Exception{
        ModelAndView response = new ModelAndView();

        response.setViewName("variety");

        if(bindingResult.hasErrors()){
            for(FieldError error : bindingResult.getFieldErrors()){
                log.debug(error.toString());
            }

            response.addObject("bindingResult", bindingResult);

            response.addObject("form", form);
        } else{
            Variety variety = new Variety();

            variety.setVarietyName(form.getVarietyName());
            variety.setColor(form.getColor());
            variety.setCategory(form.getCategory());

            varietyDAO.save(variety);
        }

        return response;
    }

    @RequestMapping(value = "/variety/delete/{id}", method = RequestMethod.GET)
    public ModelAndView variety() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("variety");
        return response;
    }
}
