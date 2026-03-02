package com.careerconnect.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.careerconnect.dao.UserDao;
import com.careerconnect.model.Users;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Users findByEmail(String email) {
        return userDao.findByEmail(email);
    }
    @Override
    public int registerUser(Users user) {
        return userDao.save(user);
    }
}