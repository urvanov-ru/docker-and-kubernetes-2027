package ru.urvanov.javaexamples.springdockercompose;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    private static final Logger logger = LoggerFactory
            .getLogger(HomeController.class);

    @Autowired
    private DataSource dataSource;

    @GetMapping("/")
    public String home() {
        logger.info("Received GET request at /");
        try {
            Connection connection = dataSource.getConnection();
            try (Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT column1 from table1")) {
                if (rs.next()) {
                    return rs.getString(1);
                } else {
                    return "No data found";
                }
            }
        } catch (SQLException e) {
            logger.error("Error executing SQL query", e);
            return "Database error";
        }
    }

}
