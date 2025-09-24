package org.example.service;


import org.example.Cars.Car;
import org.example.repository.Repository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@Service
public class CarService {
    private final Repository repo;
    public CarService(Repository repo) {
        this.repo = repo;
    }

    private Car car = new Car();


    public String addCar(Car car) {
        try(Connection conn = repo.openConnect()) {
            String sqlRequest = "INSERT INTO cars(brandName, name, type, transmission, color, modelYear, price) VALUES(?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement pstmt = conn.prepareStatement(sqlRequest);
            pstmt.setString(1, car.getBrandName());
            pstmt.setString(2, car.getName());
            pstmt.setString(3, car.getType());
            pstmt.setString(4, car.getTransmission());
            pstmt.setString(5, car.getColor());
            pstmt.setString(6, car.getModelYear());
            pstmt.setInt(7, car.getPrice());

            int row = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Машина успешно добавлена");
        return "Машина успешно добавлена";
    }


}
