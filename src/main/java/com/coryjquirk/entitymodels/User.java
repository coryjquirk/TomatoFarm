package com.coryjquirk.entitymodels;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int userId;
    @Column(nullable = false, length = 50)
    private String firstName;
    @Column(nullable = false, length = 50)
    private String lastName;
    @Column(nullable = false, length = 50)
    private String email;
    @Column
    private int phone;
    @Column(nullable = false)
    private Date startDate;
    @Column
    private Date endDate;
    @OneToMany(mappedBy = "user")
    private List<Plot> userPlots;

    public User() {
    }

    public User(int userId, String firstName, String lastName, String email, int phone, Date startDate, Date endDate, List<Plot> userPlots) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.startDate = startDate;
        this.endDate = endDate;
        this.userPlots = userPlots;
    }

    public int getUserId(){
        return userId;
    }

    public void setUserId(int userId){
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public List<Plot> getUserPlots() {
        return userPlots;
    }

    public void setUserPlots(List<Plot> userPlots) {
        this.userPlots = userPlots;
    }

}
