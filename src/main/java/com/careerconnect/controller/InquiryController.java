/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.careerconnect.controller;

import com.careerconnect.model.College;
import com.careerconnect.model.Inquiry;
import com.careerconnect.service.CollegeService;
import java.util.List;

import com.careerconnect.service.EnquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class InquiryController {
    @Autowired
    private CollegeService collegeService;
    @Autowired
    private EnquiryService EnquiryService;
    
   @GetMapping("/student/Inquiry")
public String inquiryPage(Model model) {
       List<College> colleges = collegeService.getAllColleges();
    model.addAttribute("colleges", colleges);
    return "Inquiry";}

    @RequestMapping("submitInquiry")
    public String inquiryAdd(@ModelAttribute("Inquiry") Inquiry addinquiry,
                             RedirectAttributes redirectAttributes) {

        int r = this.EnquiryService.add(addinquiry);

        if (r > 0) {
            redirectAttributes.addFlashAttribute("success", "Inquiry sent successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Inquiry failed!");
        }

        return "redirect:/student/Inquiry";
    }
 }
