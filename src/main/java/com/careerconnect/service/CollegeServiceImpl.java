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
    public List<College> getCollegesByStream(String stream){
        return collegeDao.getCollegesByStream(stream);
    }
}