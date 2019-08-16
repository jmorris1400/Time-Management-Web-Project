package com.project.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="MachineUses")
public class MachineUse implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	
	@ManyToOne(optional = false)
    @JoinColumn(name="machine_id", nullable=false)
    private Machine machine;
	
	@ManyToOne(optional = false)
    @JoinColumn(name="timesheet", nullable=false)
    private Timesheet timesheet;
	
	@Column(name = "hours_used")
	private double hours_used;
	
	public MachineUse()
	{
	}	
	
	@Override
	public String toString() 
	{
		return	"machine id : " + machine.getId() + 
				"\nhours used : " + hours_used;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Machine getMachine() {
		return machine;
	}

	public void setMachine(Machine machine) {
		this.machine = machine;
	}

	public Timesheet getTimesheet() {
		return timesheet;
	}

	public void setTimesheet(Timesheet timesheet) {
		this.timesheet = timesheet;
	}

	public double getHours_used() {
		return hours_used;
	}

	public void setHours_used(double hours_used) {
		this.hours_used = hours_used;
	}

	
	



}
