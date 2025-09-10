package org.example.repository;


import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Repository {
    private final String url = "jdbc:postgresql://localhost:5432/mydata";
    private final String username = "postgres";
    private final String password = "1234";

    public Connection openConnect() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
