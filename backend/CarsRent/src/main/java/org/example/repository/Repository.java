package org.example.repository;


import org.example.Users.User;
import org.example.admin_module.order_module.order.Order;
import org.example.car_module.cars.Car;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class Repository {

    @Bean
    public SessionFactory sessionFactory() {
        org.hibernate.cfg.Configuration configuration = new org.hibernate.cfg.Configuration();
        configuration
                .addAnnotatedClass(User.class)
                .addAnnotatedClass(Car.class)
                .addAnnotatedClass(Order.class)
                .addPackage("org.example")
                .setProperty("hibernate.connection.driver_class", "org.postgresql.Driver")
                .setProperty("hibernate.connection.url", "jdbc:postgresql://localhost:5432/autoDB")
                .setProperty("hibernate.connection.username", "postgres")
                .setProperty("hibernate.connection.password", "1111")
                .setProperty("hibernate.show_sql", true)
                .setProperty("hibernate.hbm2ddl.auto", "update");

        return configuration.buildSessionFactory();
    }
}
