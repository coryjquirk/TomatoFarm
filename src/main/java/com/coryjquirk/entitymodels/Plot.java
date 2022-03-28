package com.coryjquirk.entitymodels;

import javax.persistence.*;

@Entity
public class Plot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int plotId;
    @Column(nullable=false)
    private int stewardId;
    @Column(length = 50)
    private String soilMakeup;
    @Column(length = 50)
    private String cultivationStyle;

    public Plot(){

    }
    public Plot(int plotId, int stewardId){
        this.plotId = plotId;
        this.stewardId = stewardId;
    }
    public Plot(int plotId, int stewardId, String soilMakeup, String cultivationStyle) {
        this.plotId = plotId;
        this.stewardId = stewardId;
        this.soilMakeup = soilMakeup;
        this.cultivationStyle = cultivationStyle;
    }

    public int getPlotId() {
        return plotId;
    }

    public void setPlotId(int plotId) {
        this.plotId = plotId;
    }

    public int getStewardId() {
        return stewardId;
    }

    public void setStewardId(int stewardId) {
        this.stewardId = stewardId;
    }

    public String getSoilMakeup() {
        return soilMakeup;
    }

    public void setSoilMakeup(String soilMakeup) {
        this.soilMakeup = soilMakeup;
    }

    public String getCultivationStyle() {
        return cultivationStyle;
    }

    public void setCultivationStyle(String cultivationStyle) {
        this.cultivationStyle = cultivationStyle;
    }
}
