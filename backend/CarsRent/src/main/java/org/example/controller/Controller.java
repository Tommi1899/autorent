package org.example.controller;


import jakarta.servlet.http.HttpSession;
import org.example.Users.User;
import org.example.Users.UserLoginDto;
import org.example.Users.UserRegistrationDto;
import org.example.reservation.Reserv;
//import org.example.service.CarService;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@CrossOrigin
@RestController
public class Controller {

    @Autowired
    private UserService service;

//    @Autowired
//    private CarService carService;

    @PostMapping("/reservation")
    public String reservation(@RequestBody Reserv user) {
        return service.reservationInit(user);
    }

    @PostMapping("/registration")
    public String registration(@RequestBody UserRegistrationDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setBirth(userDto.getBirth());
        user.setPassword(service.hashPassword(userDto.getPassword()));
        return service.registrationInit(user);
    }

    @PostMapping("/login")
    public String loginCheck(@RequestBody UserLoginDto userLogDto, HttpSession session) {
        User user = new User();
        user.setEmail(userLogDto.getEmail());
        user.setPassword(service.hashPassword(userLogDto.getPassword()));



        return service.loginAcces(user);
    }
//
//    @PostMapping("/addcar")
//    public String addCar(@RequestBody Car car) {
//        return carService.addCar(car);
//    }
}
