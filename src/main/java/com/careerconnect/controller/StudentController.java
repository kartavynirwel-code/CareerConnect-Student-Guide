package com.careerconnect.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.careerconnect.model.College;
import com.careerconnect.model.Users;
import com.careerconnect.service.CollegeService;
import com.careerconnect.service.UserService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class StudentController {

    @Autowired
    private CollegeService collegeService;
    
    @Autowired
    private UserService userService;

    @GetMapping("/student/dashboard")
    public String studash(Model model) {
        List<College> colleges = collegeService.getAllColleges();
        model.addAttribute("colleges", colleges);

        model.addAttribute("collegesCount", colleges == null ? 0 : colleges.size());
        model.addAttribute("coursesCount", 120);     
        model.addAttribute("inquiriesCount", 3);      
        model.addAttribute("careerPathsCount", 300); 

        return "dashboard";
    }
    
    @PostMapping("registerProcess")
    public String registerpro(@ModelAttribute Users users,Model model){
        int result = userService.registerUser(users);

    if(result > 0){
    model.addAttribute("success", "Registered Successfully");
    return "login";
    }else{
    model.addAttribute("error", "Email already exists");
    return "register";
    }
    }
}