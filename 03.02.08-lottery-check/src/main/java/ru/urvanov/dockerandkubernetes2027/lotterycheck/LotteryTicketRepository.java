package ru.urvanov.dockerandkubernetes2027.lotterycheck;

import org.springframework.data.jpa.repository.JpaRepository;

public interface LotteryTicketRepository extends JpaRepository<LotteryTicket, String> {

}
