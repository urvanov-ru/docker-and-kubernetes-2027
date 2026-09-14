package ru.urvanov.dockerandkubernetes2027.lotterycheck;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class LotteryTicket {
    @Id
    private String number;
    
    private String winnings;

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getWinnings() {
        return winnings;
    }

    public void setWinnings(String winnings) {
        this.winnings = winnings;
    }

    @Override
    public int hashCode() {
        return Objects.hash(number);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        LotteryTicket other = (LotteryTicket) obj;
        return Objects.equals(number, other.number);
    }

    @Override
    public String toString() {
        return "LotteryTicket [number=" + number + ", winnings=" + winnings
                + "]";
    }
}
