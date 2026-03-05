package com.careerconnect.dao;

import com.careerconnect.model.Inquiry;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class InquiryDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Transactional
    public int addinquiry(Inquiry inquiry) {
        int added= (int) this.hibernateTemplate.save(inquiry);
        if(added>0){
            return added;
        }
        return 0;
    }
}
