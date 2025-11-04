package org.example.admin_module.order_module.controller;

import org.example.Users.User;
import org.example.Users.UserDtos.UserIdDto;
import org.example.admin_module.order_module.order.Order;
import org.example.admin_module.order_module.orderDto.OrderRequestDto;
import org.example.admin_module.order_module.service.OrderService;
import org.example.car_module.CarDto.CarIdDto;
import org.example.car_module.cars.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {
    private OrderService service;

    @Autowired
    public OrderController(OrderService service) {
        this.service = service;
    }

    @PostMapping("/order_save")
    public String saveOrder(@RequestBody OrderRequestDto dto) {
        return service.saveOrder(dto);
    }
}


