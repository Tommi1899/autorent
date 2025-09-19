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


    public String reservationInit(User user) {
        Repository repo = new Repository();
        try(Connection conn = repo.openConnect()){
            String sqlrequest = "INSERT INTO reservation(name, phone, email, car, date1) VALUES('"+ user.getName() + "', '"+ user.getPhone() + "', '"+ user.getEmail() + "', '"+ user.getCar() + "', '"+ user.getDate() + "');";
            PreparedStatement pstmt = conn.prepareStatement(sqlrequest);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPhone());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getCar());
            pstmt.setString(5, user.getDate());

            int row = pstmt.executeUpdate();

            System.out.println("Добавлено строк: " + row);
            System.out.println("Записаны данные: " + user.getName() + " " + user.getPhone() + " " + user.getEmail() + " " + user.getCar() + " " + user.getDate());

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Бронь оформлена";
    }

    public String registrationInit(User user) {
        Repository repo = new Repository();
        try (Connection conn = repo.openConnect()){
            String sqlrequest = "INSERT INTO users(name, email, password) VALUES(?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sqlrequest);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());


            int row = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Ура победа");
        return "Пользователь сохранен";
    }
}
