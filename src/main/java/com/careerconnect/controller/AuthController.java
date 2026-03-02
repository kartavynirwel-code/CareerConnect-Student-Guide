
package com.careerconnect.controller;

import com.careerconnect.model.Users;
import com.careerconnect.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {
    @RequestMapping("/")
    public String index(){
        return "index";
    }
    @RequestMapping("/login")
    public String login(){
        return "login";
    }
    
@Autowired
private UserService userService;

@PostMapping("/verify")
public String verify(@ModelAttribute Users user,
                     HttpSession session,
                     Model model) {

    Users dbUser = userService.findByEmail(user.getEmail());

    if (dbUser != null && dbUser.getPassword().equals(user.getPassword())) {

        session.setAttribute("loggedInUser", dbUser);

        if (dbUser.getRole().equals("ADMIN")) {
            return "redirect:/admin/dashboard";
        } else {
            return "redirect:/student/dashboard";
        }

    } else {
        model.addAttribute("error", "Invalid Email or Password");
        return "login";
    }
}
@RequestMapping("register")
public String register(){
    return "Register";
}
@RequestMapping("login#")
public String logout(){
    return "login";
}

@ExceptionHandler(Exception.class)
public String ExceptionHandler(){
    return "error";
}
}
