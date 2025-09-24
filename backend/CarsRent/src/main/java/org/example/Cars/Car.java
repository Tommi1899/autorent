package org.example.Cars;


import org.springframework.stereotype.Component;

@Component
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

    public Car() {}

    public String getBrandName() {
        return brandName;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getTransmission() {
        return transmission;
    }

    public String getColor() {
        return color;
    }

    public String getModelYear() {
        return modelYear;
    }

    public int getPrice() {
        return price;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setModelYear(String modelYear) {
        this.modelYear = modelYear;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
