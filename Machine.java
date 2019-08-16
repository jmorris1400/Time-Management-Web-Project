package com.project.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Machines")
public class Machine implements Serializable {


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@Column(name = "code")
	private String code;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "hourly_rent")
	private double hourly_rent;
	
	@Column(name = "max_hours_per_day")
	private double max_hours_per_day;
	
	public Machine()
	{
	}	
	
	@Override
	public String toString() 
	{
		return	"code : " + code + 
				"\ndescription : " + description +
				"\nhourly rent: " + hourly_rent + 
				"\nmax hours per day: " + max_hours_per_day;
	}
	

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
