package org.example.admin_module.order_module.orderDto;


import lombok.Getter;

@Getter
public class OrderRequestDto {
    private Long clientId;
    private Long carId;
    private String comment;
}
