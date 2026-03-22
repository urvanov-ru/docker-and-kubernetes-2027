package ru.urvanov.dockerandkubernetes2027.jlink;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class JavaexamplesJlinkApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaexamplesJlinkApplication.class, args);
    }
    
    @GetMapping("/")
    public String hello() {
        return "Hello, JLink example!";
    }

}
