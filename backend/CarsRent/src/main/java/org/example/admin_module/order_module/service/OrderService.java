package org.example.admin_module.order_module.service;

import jakarta.transaction.Transactional;
import org.example.Users.User;
import org.example.Users.UserDtos.UserIdDto;
import org.example.admin_module.order_module.order.Order;
import org.example.admin_module.order_module.orderDto.OrderRequestDto;
import org.example.admin_module.order_module.orderEnum.OrderStatus;
import org.example.car_module.CarDto.CarIdDto;
import org.example.car_module.cars.Car;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.*;

@Transactional
@Service
public class OrderService {
    private final SessionFactory sessionFactory;

    @Autowired
    public OrderService(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public String saveOrder(OrderRequestDto dto) {
        Session session = sessionFactory.openSession();
        try {

            session.beginTransaction();

            User client = session.find(User.class, dto.getClientId());
            if (client == null) {
                throw new RuntimeException("Клиент не найден");
            }

            Car car = session.find(Car.class, dto.getCarId());
            if (car == null) {
                throw new RuntimeException("Авто не найдено");
            }

            Order order = new Order(client, car, dto.getComment());
            session.persist(order);
            session.getTransaction().commit();

            return "Заявка сохранена";
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            session.close();
        }
    }

    public String updateStatus(Long id, OrderStatus newStatus) {
        Session session = sessionFactory.openSession();

        try {
            Order order = session.find(Order.class, id);
            if (order == null) {
                throw new RuntimeException("Ордер не найден!");
            }

            order.setStatus(newStatus);

            return "Статус успешно изменен!";
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            session.close();
        }
    }

    public String deleteOrder(Long id) {
        Session session = sessionFactory.openSession();

        try {
            session.beginTransaction();
            Order orderById = session.find(Order.class, id);
            if (orderById != null) {
                session.remove(orderById);
            } else {
                return "Ордер пустой!";
            }
            session.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            session.close();
        }

        return "Ордер не найден!";
    }
}
