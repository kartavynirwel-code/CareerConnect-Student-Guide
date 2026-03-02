package com.careerconnect.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.careerconnect.dao.CollegeDao;
import com.careerconnect.model.College;

@Service
public class CollegeServiceImpl implements CollegeService {

    @Autowired
    private CollegeDao collegeDao;

    @Override
    public List<College> getAllColleges() {
        return collegeDao.findAll();
    }

    @Override
    public List<College> searchColleges(String q) {
        if (q == null || q.trim().isEmpty()) return getAllColleges();
        return collegeDao.searchByNameOrCity(q.trim());
    }

    @Override
    public int countColleges() {
        List<College> all = getAllColleges();
        return (all == null) ? 0 : all.size();
    }
}