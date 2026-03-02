package com.careerconnect.model;

import javax.persistence.*;

@Entity
@Table(name = "colleges")
public class College {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(nullable = false, length = 100)
    private String city;

    @Column(nullable = false, length = 100)
    private String state;

    @Column(nullable = false, length = 100)
    private String stream;

    @Column(nullable = false, length = 50)
    private String type;

    public College() {}

    public College(String name, String city, String state, String stream, String type) {
        this.name = name;
        this.city = city;
        this.state = state;
        this.stream = stream;
        this.type = type;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getStream() { return stream; }
    public void setStream(String stream) { this.stream = stream; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}