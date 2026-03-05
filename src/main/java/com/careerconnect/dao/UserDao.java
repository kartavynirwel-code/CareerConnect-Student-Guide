package com.careerconnect.dao;

import java.util.List;

import com.careerconnect.model.Admin;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.careerconnect.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDao {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
        this.hibernateTemplate = hibernateTemplate;
    }

    public Users findByEmail(String email) {

        String query = "from Users where email = :email";

        List<Users> users = (List<Users>) hibernateTemplate.findByNamedParam(
                query,
                "email",
                email
        );

        if (users != null && !users.isEmpty()) {
            return users.get(0);
        }

        return null;
    }
    @Transactional
    public int save(Users user) {
        
    Users existingUser = findByEmail(user.getEmail());

    if (existingUser != null) {
        return 0;
    }
    return (int) hibernateTemplate.save(user);
    }

    public int verifyAdmin(Admin admin) {

        String query = "from Admin where email=:email and password=:password";

        List<Admin> list = (List<Admin>) this.hibernateTemplate.findByNamedParam(
                query,
                new String[]{"email", "password"},
                new Object[]{admin.getEmail(), admin.getPassword()}
        );

        if(list.size() > 0){
            return 1;
        }
        else{
            return 0;
        }
    }
}
