
package com.careerconnect.controller;

import com.careerconnect.model.Admin;
import com.careerconnect.model.Users;
import com.careerconnect.service.UserService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Controller
public class AuthController {
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @Autowired
    private UserService userService;

    @PostMapping("/verify")
    public String verify(@ModelAttribute Users user,
                         HttpSession session,
                         Model model) {
        Users dbUser = userService.findByEmail(user.getEmail());

        if (dbUser == null || !dbUser.getPassword().equals(user.getPassword())) {
            model.addAttribute("error", "Invalid Email or Password");
            return "login";
        }

        session.setAttribute("loggedInUser", dbUser);

        if ("ADMIN".equals(dbUser.getRole())) {
            return "redirect:/admin/dashboard";
        }

        return "redirect:/student/dashboard";
    }
    @RequestMapping("register")
    public String register() {
        return "Register";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {

        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping("/login/{login}")
    public String admin(@PathVariable("login") String login) {
        if(login.equals("admin")) {
            return "redirect:/admin/login";
        }
        return "redirect:/login";
    }

    @RequestMapping("/admin/login")
    public String adminlogin(){
        return "AdminLogin";
    }


    //admin verificaation for login
    @RequestMapping("/adminverify")
    public String adminverify(@ModelAttribute("admin") Admin admin,Model model){

        int found=this.userService.verifybyemailandpassword(admin);
        if(found>0){
            return "AdminDashboard";
        }
        model.addAttribute("error","Invalid Email or Password");
        return "AdminLogin";
    }
}