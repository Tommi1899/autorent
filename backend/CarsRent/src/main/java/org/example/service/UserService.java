package org.example.service;


import jakarta.persistence.NoResultException;
import lombok.NoArgsConstructor;
import org.example.Users.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Service
@NoArgsConstructor
public class UserService {

    private User user;
    private SessionFactory sessionFactory;

    public UserService(User user) {
        this.user = user;
    }

    @Autowired
    public UserService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

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


    public String registrationInit(User user) {

        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(user);
            session.getTransaction().commit();

        }


        System.out.println("Ура победа");
        return "Пользователь сохранен";
    }

    public String loginAcces(User user) {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            User userParam = session.createQuery(
                            "FROM User u WHERE u.email = :email", User.class)
                    .setParameter("email", user.getEmail())
                    .getSingleResult();

            if (userParam.getEmail().equals(user.getEmail())
                    && userParam.getPassword().equals(user.getPassword())) {

                return "вход успешен!";
            } else {
                return "неверный email или пароль";
            }

        } catch (NoResultException e) {
            return "Пользователь не найден";
        }
    }
}
