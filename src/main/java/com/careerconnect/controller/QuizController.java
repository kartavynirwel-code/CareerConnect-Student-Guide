package com.careerconnect.controller;

import com.careerconnect.model.College;
import com.careerconnect.service.CollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/student")
public class QuizController {
    @Autowired
    private CollegeService collegeService;

    @GetMapping("/quiz")
    public String quizPage() {
        return "quiz";
    }

    @PostMapping("/quizResult")
    public String quizResult(@RequestParam("q1") String q1,
                             @RequestParam("q2") String q2,
                             @RequestParam("q3") String q3,
                             Model model) {

        int engineering = 0;
        int medical = 0;
        int management = 0;

        if(q1.equals("maths")) engineering++;
        if(q1.equals("biology")) medical++;

        if(q2.equals("technology")) engineering++;
        if(q2.equals("people")) medical++;
        if(q2.equals("business")) management++;

        if(q3.equals("logic")) engineering++;
        if(q3.equals("care")) medical++;
        if(q3.equals("leader")) management++;

        String result;

        if(engineering >= medical && engineering >= management){
            result = "Engineering";
        }
        else if(medical >= engineering && medical >= management){
            result = "Medical";
        }
        else{
            result = "Management";
        }

        List<College> colleges = collegeService.getCollegesByStream(result);

        model.addAttribute("result", result);
        model.addAttribute("colleges", colleges);

        return "quizResult";
    }
}
