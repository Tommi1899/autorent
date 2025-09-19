package org.example.controller;


import org.example.Users.User;
import org.example.Users.UserRegistrationDto;
import org.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@CrossOrigin
@RestController
public class Controller {

    @Autowired
    private UserService service;

    @PostMapping("/reservation")
    public String reservation(@RequestBody User user) {
        return service.reservationInit(user);
    }

    @PostMapping("/registration")
    public String registration(@RequestBody UserRegistrationDto userDto) {
        User user = new User();
        user.setName(userDto.getName());
        user.setEmail(userDto.getEmail());
        user.setPassword(userDto.getPassword());


        return service.registrationInit(user);
    }
}
