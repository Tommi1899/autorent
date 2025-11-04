package org.example.Users.UserDtos;


import lombok.Getter;

@Getter
public class UserRegistrationDto {
    private String name;
    private String email;
    private String birth;
    private String password;
}