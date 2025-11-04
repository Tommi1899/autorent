package org.example.car_module.CarDto;


import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class CarDto {
    private String brandName;
    private String name;
    private String type;
    private String transmission;
    private String color;
    private String modelYear;
    private int price;
}
