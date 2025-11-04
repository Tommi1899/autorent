package org.example.car_module.cars;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.admin_module.order_module.order.Order;
import org.springframework.stereotype.Component;

import java.util.List;


@Setter
@Getter
@NoArgsConstructor
@Component
@Entity
@Table(name = "cars")
public class Car {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String brandName;
    private String name;
    private String type;
    private String transmission;
    private String color;
    private String modelYear;
    private int price;

    @OneToMany(mappedBy = "car")
    private List<Order> orders;

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
