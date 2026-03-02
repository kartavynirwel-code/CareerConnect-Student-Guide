package com.careerconnect.service;

import java.util.List;
import com.careerconnect.model.College;

public interface CollegeService {
    public List<College> getAllColleges();
    List<College> searchColleges(String q);
    int countColleges();
}