package com.project.beans;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class MachineBean {

	private int id;
	private String code;
	private String description;
	private double hourly_rent;
	private double max_hours_per_day;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getHourly_rent() {
		return hourly_rent;
	}

	public void setHourly_rent(double hourly_rent) {
		this.hourly_rent = hourly_rent;
	}

	public double getMax_hours_per_day() {
		return max_hours_per_day;
	}

	public void setMax_hours_per_day(double max_hours_per_day) {
		this.max_hours_per_day = max_hours_per_day;
	}	
	
}
