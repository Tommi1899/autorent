package org.example.admin_module.order_module.controller;

import org.example.Users.User;
import org.example.Users.UserDtos.UserIdDto;
import org.example.admin_module.order_module.order.Order;
import org.example.admin_module.order_module.orderDto.OrderRequestDto;
import org.example.admin_module.order_module.orderEnum.OrderStatus;
import org.example.admin_module.order_module.service.OrderService;
import org.example.car_module.CarDto.CarIdDto;
import org.example.car_module.cars.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class OrderController {
    private OrderService service;

    @Autowired
    public OrderController(OrderService service) {
        this.service = service;
    }

    @PostMapping("/adminPanel/order_save")
    public String saveOrder(@RequestBody OrderRequestDto dto) {
        return service.saveOrder(dto);
    }

    @PutMapping("/adminPanel/order_put/{id}")
    public String updateStatus(@PathVariable("id") Long id, @RequestBody OrderStatus newStatus) {
        return service.updateStatus(id, newStatus);
    }

    @DeleteMapping("/adminPanel/order_delete")
    public String deleteOrder(@RequestBody Long id) {
        return service.deleteOrder(id);
    }
}


