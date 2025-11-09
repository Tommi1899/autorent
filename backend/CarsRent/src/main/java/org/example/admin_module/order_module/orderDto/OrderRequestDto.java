package org.example.admin_module.order_module.orderDto;


import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import lombok.Getter;
import org.example.admin_module.order_module.orderEnum.OrderStatus;
import org.example.admin_module.order_module.orderEnum.PaymentType;

@Getter
public class OrderRequestDto {
    private Long clientId;
    private Long carId;

    private String comment;
}
