package teksystems.tomatofarm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Slf4j
@Controller
public class IndexController {

    @GetMapping(value = "/index")
    public ModelAndView index() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("index");
        return response;
    }
    @GetMapping(value = "/credits")
    public ModelAndView credits() throws Exception {
        ModelAndView response = new ModelAndView();
        response.setViewName("credits");
        return response;
    }
}

