package org.example.controller;


import org.example.Users.User;
import org.example.service.UserService;
import org.springframework.web.bind.annotation.*;


@CrossOrigin("http://localhost:42253")
@RestController
public class Controller {

    UserService service = new UserService();

    @PostMapping("/reservation")
    public String reservation(@RequestBody User user) {
        return service.pushSql(user);
    }
}
