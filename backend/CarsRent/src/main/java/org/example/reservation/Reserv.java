package org.example.reservation;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
public class Reserv {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "reserv_name")
    private String name;
    @Column(name = "reserv_email")
    private String email;
    @Column(name = "reserv_car")
    private String car;
    @Column(name = "reserv_date")
    private String date;

    public Reserv(String name, String email, String car, String date) {
        this.name = name;
        this.email = email;
        this.car = car;
        this.date = date;
    }
}
