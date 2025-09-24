package org.example.repository;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

@Configuration
public class Repository {
    private final String url = "jdbc:postgresql://localhost:5432/mydata";
    private final String username = "postgres";
    private final String password = "1234";

    @Bean
    public Connection openConnect() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
