package org.example.service;


import org.example.Users.User;
import org.example.repository.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

@Service
public class UserService {

    private User user;

    public UserService(User user) {
        this.user = user;
    }

    public UserService() {}


    public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());

            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();

        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

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
            pstmt.setString(3, hashPassword(user.getPassword()));


            int row = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Ура победа");
        return "Пользователь сохранен";
    }

    public String loginAcces(User user) {
        Repository repo = new Repository();
        try(Connection conn = repo.openConnect()) {
            String quary = "SELECT email, password FROM users WHERE email = ?";
            PreparedStatement pstmt = conn.prepareStatement(quary);
            pstmt.setString(1, user.getEmail());

            System.out.println("SQL-запрос: SELECT email, password FROM users WHERE email = '"
                    + user.getEmail() + "'");
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String storeEmail = rs.getString("email");
                String storeHash = rs.getString("password");

                String enteredHash = hashPassword(user.getPassword().trim());

                System.out.println("=== DEBUG LOGIN ===");
                System.out.println("Email введённый:   " + user.getEmail());
                System.out.println("Email из БД:       " + storeEmail);
                System.out.println("Хэш введённый:     " + enteredHash);
                System.out.println("Хэш из БД:         " + storeHash);
                System.out.println("===================");

                // 5. Сравнение
                if (storeHash.equals(enteredHash) &&
                        storeEmail.equalsIgnoreCase(user.getEmail().trim())) {
                    return "Вход успешен";
                } else {
                    return "Неверный email или пароль";
                }
            } else {
                return "Пользователь не найден";
            }


        }catch (SQLException e) {
            e.printStackTrace();
            return "Ошибка со стороны сервера или ничего не найдено" + e.getMessage();
        }

    }
}
