package org.example.Users;


import org.springframework.stereotype.Component;

@Component
public class User {
    private String name;
    private String  phone;
    private String email;
    private String car;
    private String date;

    public User(String name, String phone, String email, String car, String date) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.car = car;
        this.date = date;
    }

    public String getPhone() {
        return phone;
    }

    public User() {}

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getCar() {
        return car;
    }

    public String getDate() {
        return date;
    }
}
