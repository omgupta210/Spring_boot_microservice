package com.example.hello;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Value("${name1}")
    private String name1;

    @GetMapping("/")
    public String hello() {
        return "Hello World " + name1;
    }

    @GetMapping("/hello")
    public String helloPath() {
        return "Hello World " + name1;
    }
}
