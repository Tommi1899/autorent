package org.example.Users;


import org.springframework.stereotype.Component;

@Component
public class User {
    private String name;
    private String  phone;
    private String email;
    private String car;
    private String date;
    private String password;

    public User(String name, String phone, String email, String car, String date, String password) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.car = car;
        this.date = date;
        this.password = password;
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

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setCar(String car) {
        this.car = car;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
}
