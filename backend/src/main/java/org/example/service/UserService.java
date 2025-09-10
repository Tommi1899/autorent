package org.example.service;


import org.example.Users.User;
import org.example.repository.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

@Component
public class UserService {

    private User user;

    public UserService(User user) {
        this.user = user;
    }

    public UserService() {}

    @Autowired
    public String pushSql(User user) {
        Repository repo = new Repository();
        try(Connection conn = repo.openConnect()){
            Statement stmt = conn.createStatement();
            String sqlrequest = "INSERT INTO reservation(name, phone, email, car, date1) VALUES('"+ user.getName() + "', '"+ user.getPhone() + "', '"+ user.getEmail() + "', '"+ user.getCar() + "', '"+ user.getDate() + "');";
            int row = stmt.executeUpdate(sqlrequest);
            System.out.println("Добавлено строк: " + row);
            System.out.println("Записаны данные: " + user.getName() + " " + user.getPhone() + " " + user.getEmail() + " " + user.getCar() + " " + user.getDate());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Бронь оформлена";
    }
}
