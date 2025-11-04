package org.example.car_module.controller;

import org.example.car_module.CarDto.CarDto;
import org.example.car_module.CarDto.CarIdDot;
import org.example.car_module.CarDto.CarIdDto;
import org.example.car_module.cars.Car;
import org.example.car_module.service.Car_Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class Car_Controller {

    private Car_Service service;

    @Autowired
    public Car_Controller(Car_Service service) {
        this.service = service;
    }

    @PostMapping("/adminPanel/addCar")
    public String addCar(@RequestBody CarDto carDto) {
        Car car = new Car();
        car.setBrandName(carDto.getBrandName());
        car.setName(carDto.getName());
        car.setType(carDto.getType());
        car.setTransmission(carDto.getTransmission());
        car.setColor(carDto.getColor());
        car.setModelYear(carDto.getModelYear());
        car.setPrice(carDto.getPrice());

        return service.implementCar(car);
    }

    @DeleteMapping("/adminPanel/delete")
    public String deleteCar(@RequestBody Car id) {
        String result = service.deleteCar(id.getId());

        return String.valueOf(ResponseEntity.ok(result));
    }

    @PutMapping("/adminPanel/update/{id}")
    public String updateCar(@PathVariable("id") Long id, @RequestBody CarDto carDto) {
        return service.updateCar(id, carDto);
    }
}
