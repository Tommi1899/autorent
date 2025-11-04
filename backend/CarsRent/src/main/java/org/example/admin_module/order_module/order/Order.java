package org.example.admin_module.order_module.order;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.Users.User;
import org.example.car_module.cars.Car;

import javax.annotation.processing.Generated;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private User client;

    @ManyToOne
    @JoinColumn(name = "car_id", referencedColumnName = "id")
    private Car car;

//    private LocalDateTime createAt;
//    private LocalDateTime confirmedAt;
//    private LocalDateTime canceledAt;
//    private LocalDateTime completedAt;
//
//    private BigDecimal carPrice;
//    private BigDecimal discount; // скидка если есть
//    private BigDecimal totalPrice;

    @Column(length = 500)
    private String comment;

    public Order(User client, Car car, String comment) {
        this.client = client;
        this.car = car;
        this.comment = comment;
    }
}
