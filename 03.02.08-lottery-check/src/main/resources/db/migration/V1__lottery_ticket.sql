CREATE TABLE lottery_ticket(
  number varchar(5) NOT NULL,
  winnings numeric(6,2) NOT NULL
);

ALTER TABLE lottery_ticket
ADD CONSTRAINT pk_lottery_ticket PRIMARY KEY (number);