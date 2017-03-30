package com.rupp.assignment.controller;

import com.rupp.assignment.json.JFee;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.Date;


@Controller
@RequestMapping(value = {"fee", "fees" })
public class FeeController {

    private static final Logger LOG = LoggerFactory.getLogger(FeeController.class);

    @Autowired
    private com.rupp.assignment.service.FeeService service;

    /**
     * return all Categories support Header If-Modified-Since is optional, timestamp of last update; use
     * "Sat, 29 Oct 1994 19:43:31 GMT"
     * 
     * @return Iterable<JFeeType>
     */
    @RequestMapping(value = "v1/all", method = RequestMethod.GET)
    @ResponseBody
    public Collection<JFee> getAll(HttpServletRequest request, WebRequest webRequest,
                                   @RequestHeader(required = false, value = "If-Modified-Since") Date since) {

        //LOG.debug(" ============== If-Modified-Since {} ", since);

        return service.getAll();
    }

    @RequestMapping(value = "v1/{id}", method = RequestMethod.GET)
    @ResponseBody
    public JFee getDetails(HttpServletRequest request, @PathVariable int id) {

        return service.getDetails(id);
    }

    @RequestMapping(value = "v1", method = RequestMethod.POST)
    @ResponseBody
    public JFee create(HttpServletRequest request, @ModelAttribute JFee domain) {

        service.create(domain);
        return domain;
    }
    
}
