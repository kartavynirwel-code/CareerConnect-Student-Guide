package com.careerconnect.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.careerconnect.model.College;

@Repository
public class CollegeDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @SuppressWarnings("unchecked")
    public List<College> findAll() {
        return (List<College>) hibernateTemplate.find("from College");
    }

    @SuppressWarnings("unchecked")
    public List<College> searchByNameOrCity(String q) {
        String hql = "from College where lower(name) like :q or lower(city) like :q";
        return (List<College>) hibernateTemplate.findByNamedParam(hql, "q", "%" + q.toLowerCase() + "%");
    }

    public College findById(int id) {
        return hibernateTemplate.get(College.class, id);
    }

    public void save(College college) {
        hibernateTemplate.saveOrUpdate(college);
    }
}