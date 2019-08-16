package com.project.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="Job")
public class Job implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="job_id")
	private int jobId ;
	
	@Column(name="Job_Code")
	private String jobCode;
	
	@Column(name="Job_Description")
	private String jobDescription;
	
	@Column(name="Hourly_rate")
	private double jobHourlyRate;
	
	@Column(name="Max_Hours_Per_Day")
	private int jobmaxHours;

	public int getJobId() {
		return jobId;
	}
	
	public Job()
	{
	}	

	public void setJobId(int jobId) {
		this.jobId = jobId;
	}

	public String getJobCode() {
		return jobCode;
	}

	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}

	public double getJobHourlyRate() {
		return jobHourlyRate;
	}

	public void setJobHourlyRate(double jobHourlyRate) {
		this.jobHourlyRate = jobHourlyRate;
	}

	public int getJobmaxHours() {
		return jobmaxHours;
	}

	public void setJobmaxHours(int jobmaxHours) {
		this.jobmaxHours = jobmaxHours;
	}
	
	
	
}
