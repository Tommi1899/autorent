package org.example.car_module.service;

import lombok.NoArgsConstructor;
import org.example.car_module.CarDto.CarDto;
import org.example.car_module.cars.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLException;

@NoArgsConstructor
@Service
public class Car_Service {
    private SessionFactory sessionFactory;

    public Car_Service(Car car) {
    }

    @Autowired
    public Car_Service(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public String implementCar(Car car) {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(car);
            session.getTransaction().commit();

            return "Машина добавлена";
        }
    }

    public String deleteCar(Long id) {
        try (Session session = sessionFactory.openSession()){
            session.beginTransaction();
            Car carGetId = session.find(Car.class, id);
            if (carGetId == null) {
                return "Машина не найдена";
            }

            session.remove(carGetId);
            session.getTransaction().commit();

            return carGetId.getBrandName() + " был удален из бд";
        }
    }

    public String updateCar(Long id, CarDto carDto) {
        try(Session session = sessionFactory.openSession()) {
            session.beginTransaction();

            Car car = session.find(Car.class, id);
            car.setBrandName(carDto.getBrandName());
            System.out.println(carDto.getBrandName());
            car.setName(carDto.getName());
            car.setType(carDto.getType());
            car.setTransmission(carDto.getTransmission());
            car.setColor(carDto.getColor());
            car.setModelYear(carDto.getModelYear());
            car.setPrice(carDto.getPrice());

            session.getTransaction().commit();

            if (!(car.getBrandName().isEmpty())) {
                return "Данные успешно добавлены";
            }
            else {
                return "Поле пустое!";
            }
        }
    }


}
