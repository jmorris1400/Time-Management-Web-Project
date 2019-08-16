package com.project.model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="JobHours")
public class JobHours implements Serializable {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private int id;
	
	@ManyToOne(optional = false)
    @JoinColumn(name="job_id", nullable=false)
    private Job job;
	
	@ManyToOne(optional = false)
    @JoinColumn(name="timesheet", nullable=false)
    private Timesheet timesheet;
	
	@Column(name = "hours_used")
	private double hours_worked;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	public Timesheet getTimesheet() {
		return timesheet;
	}

	public void setTimesheet(Timesheet timesheet) {
		this.timesheet = timesheet;
	}

	public double getHours_worked() {
		return hours_worked;
	}

	public void setHours_worked(double hours_worked) {
		this.hours_worked = hours_worked;
	}
	
	
}
