package com.careerconnect.service;

import com.careerconnect.model.Admin;
import com.careerconnect.model.Users;

public interface UserService {

    Users findByEmail(String email);

    int registerUser(Users user);

    int verifybyemailandpassword(Admin admin);
}