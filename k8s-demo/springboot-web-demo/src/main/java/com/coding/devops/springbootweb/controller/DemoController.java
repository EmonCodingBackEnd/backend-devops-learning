package com.coding.devops.springbootweb.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {
    private static final Logger log = LoggerFactory.getLogger(DemoController.class);

    @RequestMapping("/hello")
    public String sayHello(@RequestParam String name) {
        String msg = "Hello " + name + "! I'm springboot-web-demo controller!";
        log.info(msg);
        return msg;
    }
}
