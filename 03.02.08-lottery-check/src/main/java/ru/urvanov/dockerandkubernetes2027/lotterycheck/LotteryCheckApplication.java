package ru.urvanov.dockerandkubernetes2027.lotterycheck;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

@SpringBootApplication
@RestController
public class LotteryCheckApplication {

    @Autowired
    private LotteryTicketRepository lotteryTicketRepository;

    public static void main(String[] args) {
        SpringApplication.run(LotteryCheckApplication.class, args);
    }

    @GetMapping(value = "/check/{number}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public LotteryTicket check(@PathVariable("number") String number) {
        return lotteryTicketRepository.findById(number).orElseThrow(
                () -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

}
