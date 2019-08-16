package com.project.service;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.project.dao.TimesheetDAO;
import com.project.model.JobHours;
import com.project.model.Timesheet;

@Service
public class TimesheetService {
	
    @Autowired TimesheetDAO repository;
    
    public void add(Timesheet timesheet) {
        repository.save(timesheet);
    }
    public void delete(long id) {
        repository.deleteById(id);
    }
    public List<Timesheet> getTimesheets() {
        return (List<Timesheet>) repository.findAll();
    }
    public Timesheet getTimesheetById(long id) {
    	return (Timesheet) repository.findById(id).orElse(null);
    }
    
    // added by Nemo
    
    
    // THE METHOD BELOW HAS BEEN MOVED TO THE TIMESHEET ENTITY TO SET THE NEW TOTALHOURS PROPERTY 
    //  >>>>>>>>>>>
    
    // To get the total hours worked by all labors in one timesheet
//    public double getTotalHours(long id) {
//    	double hours = 0 ;
//    	Timesheet ts = new Timesheet();
//    	ts = getTimesheetById(id);
//    	Set<JobHours> jh = ts.getJobHours();
//    	Iterator<JobHours> itr = jh.iterator();
//    	while (itr.hasNext()) {
//    		double h = itr.next().getHours_worked();
//    		hours += h ;
//    	}
//    	return hours;
//    	
//    }
    
	 // THE METHOD BELOW HAS BEEN MOVED TO THE TIMESHEET ENTITY TO SET THE NEW TOTALHOURS PROPERTY 
	 //	>>>>>>>>>>>
    
    // To get the total amount by multiplying hours worked by the labor hourly rate for all the labors
    // in one timesheet 
//    public double getTotalAmount(long id) {
//    	double hours = 0 ;
//    	double amount = 0 ;
//    	Timesheet ts = new Timesheet();
//    	ts = getTimesheetById(id);
//    	Set<JobHours> jh = ts.getJobHours();
//    	Iterator<JobHours> itr = jh.iterator();
//    	while (itr.hasNext()) {
//    		double h = itr.next().getHours_worked();
//    		double hourlyRate = itr.next().getJob().getJobHourlyRate();
//    		amount += (h * hourlyRate);
//    	}
//    	return amount;
//    	
//    }
    
    // To finalize and approve the timesheet ad set isOpen status to false
    public void approveTimeSheet(long id) {
    	Timesheet ts = new Timesheet();
    	ts = getTimesheetById(id);
    	ts.setIsOpen(false);
    }
    
    // end of change
    
    

}