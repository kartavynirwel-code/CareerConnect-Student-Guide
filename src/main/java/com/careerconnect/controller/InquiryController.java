/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.careerconnect.controller;

import com.careerconnect.model.College;
import com.careerconnect.service.CollegeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InquiryController {
    @Autowired
    private CollegeService collegeService;
    
   @GetMapping("/student/Inquiry")
public String inquiryPage(Model model) {

    List<College> colleges = collegeService.getAllColleges();
    model.addAttribute("colleges", colleges);

    return "Inquiry";
}
}
