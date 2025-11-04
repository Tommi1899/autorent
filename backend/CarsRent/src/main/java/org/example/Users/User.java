package org.example.Users;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.example.admin_module.order_module.order.Order;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "user_name", nullable = false)
    private String name;
    @Column(name = "user_email", unique = true)
    private String email;
    @Column(name = "user_birth")
    private String birth;
    @Column(name = "user_password")
    private String password;

    @OneToMany(mappedBy = "client")
    private List<Order> orders;


    public User(String name, String email, String birth, String password) {
        this.name = name;
        this.email = email;
        this.birth = birth;
        this.password = password;
    }
}
