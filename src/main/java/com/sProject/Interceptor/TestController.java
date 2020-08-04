package com.sProject.Interceptor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
@Controller
public class TestController {
	
    @RequestMapping(value="/interceptorTest")
    public ModelAndView interceptorTest() throws Exception{
        System.out.println("test");
        ModelAndView mv = new ModelAndView("");
         
        return mv;
    }
     
}


