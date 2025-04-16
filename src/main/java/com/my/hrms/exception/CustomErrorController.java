package com.my.hrms.exception;

import java.util.Map;

import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class CustomErrorController implements ErrorController {

	private final ErrorAttributes errorAttributes;

    public CustomErrorController(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    @RequestMapping("/error")
    public ModelAndView handleError(WebRequest webRequest) {
        Map<String, Object> errorAttributes = this.errorAttributes.getErrorAttributes(webRequest, ErrorAttributeOptions.defaults());
        Integer status = (Integer) errorAttributes.get("status");
        ModelAndView modelAndView = new ModelAndView();

        if (status != null) {
            switch (status) {
                case 404:
                    modelAndView.setViewName("common/404"); // Return 404.jsp
                    break;
                case 500:
                    modelAndView.setViewName("common/500"); // Return 500.jsp
                    break;
                default:
                    modelAndView.setViewName("common/error"); // Default error page
                    break;
            }
        }
        return modelAndView;
    }
}	