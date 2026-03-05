package com.careerconnect.service;

import com.careerconnect.dao.InquiryDao;
import com.careerconnect.model.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EnquiryServiceimpl implements EnquiryService {
    @Autowired
    private InquiryDao inquiryDao;
    @Override
    public int add(Inquiry inquiry) {
        int a=this.inquiryDao.addinquiry(inquiry);
        if(a>0) return 1;
        else return 0;
    }
}
