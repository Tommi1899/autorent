package org.example.car_module.cars;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;


@Setter
@Getter
@Component
@Entity
@Table(name = "cars")
public class Car {
    private String brandName;
    private String name;
    private String type;
    private String transmission;
    private String color;
    private String modelYear;
    private int price;

    public Car(String brandName, String name, String type, String transmission, String color, String modelYear, int price) {
        this.brandName = brandName;
        this.name = name;
        this.type = type;
        this.transmission = transmission;
        this.color = color;
        this.modelYear = modelYear;
        this.price = price;
    }

}
