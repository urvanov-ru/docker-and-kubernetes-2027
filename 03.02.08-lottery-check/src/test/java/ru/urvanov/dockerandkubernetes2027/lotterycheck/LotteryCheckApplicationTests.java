package ru.urvanov.dockerandkubernetes2027.lotterycheck;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.web.server.ResponseStatusException;

@SpringBootTest
class LotteryCheckApplicationTests {

    @Autowired
    private LotteryCheckApplication lotteryCheckApplication;

    @Autowired
    private LotteryTicketRepository lotteryTicketRepository;

    @Test
    void checkReturnsWinningsForExistingTicket() {
        LotteryTicket ticket = new LotteryTicket();
        ticket.setNumber("12345");
        ticket.setWinnings("12.50");
        lotteryTicketRepository.save(ticket);

        LotteryTicket result = lotteryCheckApplication.check("12345");

        assertNotNull(result);
        assertEquals("12345", result.getNumber());
        assertEquals("12.50", result.getWinnings());
    }

    @Test
    void checkDoesNotFindMissingTicket() {
        ResponseStatusException exception = assertThrows(ResponseStatusException.class,
                () -> lotteryCheckApplication.check("99999"));

        assertEquals(HttpStatus.NOT_FOUND, exception.getStatusCode());
    }
}