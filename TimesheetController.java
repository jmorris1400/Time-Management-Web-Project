package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.model.Job;
import com.project.model.JobHours;
import com.project.model.Machine;
import com.project.model.MachineUse;
import com.project.model.Timesheet;
import com.project.service.JobHoursService;
import com.project.service.JobService;
import com.project.service.MachineService;
import com.project.service.MachineUseService;
import com.project.service.TimesheetService;
import com.project.service.UserService;

@Controller
public class TimesheetController {
	

	@Autowired
	private JobService jobService;
	@Autowired
	private JobHoursService jobHours;
	
	@Autowired
	private MachineService machineService;
	@Autowired
	private MachineUseService machineUseService;
	
	@Autowired
	private TimesheetService timesheetService;
	
	@Autowired
	private UserService userService;
	

    @GetMapping("/timesheetForm")
    public ModelAndView root() {
    	
    	Map<String,Object> mod = new HashMap<String,Object>();
    	mod.put("machines" , machineService.getMachines());
    	mod.put("jobs" , jobService.getAllJobs());
        return new ModelAndView("timesheetInput", mod);

    }
  
    @PostMapping("/saveTimesheet")
    public void saveTimesheet(@RequestBody Map<String, Object> map) {

    	Timesheet timesheet = new Timesheet();
    	timesheet.setDate((String)map.get("date"));
    	timesheet.setSite_code((String)map.get("site_code"));
    	timesheet.setContractor_name((String)map.get("contractor_name"));
    	timesheet.setIsOpen(true);
    	timesheetService.add(timesheet);
    	
    	double total_hours = 0;
    	double total_amount = 0;
    	
    	List<Map<String, Object>> machine_list = (List<Map<String, Object>>)map.get("machines");
    	for(Map<String, Object> mo : machine_list)
    	{
    		total_amount -= Double.parseDouble((String)mo.get("total"));
    		Machine m = machineService.getMachineById((int)mo.get("id"));
    		MachineUse mu = new MachineUse();
    		mu.setHours_used(Double.parseDouble((String)mo.get("hours")));
    		mu.setMachine(m);
    		mu.setTimesheet(timesheet);
    		timesheet.addMachineUse(mu);
    		machineUseService.add(mu);
    	}
    	
    	List<Map<String, Object>> labor_list = (List<Map<String, Object>>)map.get("labor");	
    	for(Map<String, Object> jo : labor_list)
    	{
    		total_amount += Double.parseDouble((String)jo.get("total"));
    		total_hours += Double.parseDouble((String)jo.get("hours"));
    		Job j = jobService.getJobById((int)jo.get("id"));
    		JobHours jh = new JobHours();
    		jh.setHours_worked(Double.parseDouble((String)jo.get("hours")));
    		jh.setJob(j);
    		jh.setTimesheet(timesheet);
    		timesheet.addJobHours(jh);
    		jobHours.add(jh);
    	}
    	timesheetService.add(timesheet);
		timesheet.setTotalHours(total_hours);
		timesheet.setTotalAmount(total_amount);
		timesheetService.add(timesheet);
    	
    }
    
    @GetMapping("/timesheetReview/{id}")
    public ModelAndView timesheetReview(@PathVariable("id") long id) {
    	
    	Map<String,Object> mod = new HashMap<String,Object>();
    	Timesheet timesheet = timesheetService.getTimesheetById(id);

    	List<List<String>> machine_list = new ArrayList<List<String>>();
    	Set<MachineUse> mulist = timesheet.getMachineuses();
    	for (MachineUse mu : mulist)
    	{
    		List<String> temp = new ArrayList<String>();
    		temp.add(mu.getMachine().getCode());
    		temp.add(Double.toString(mu.getHours_used()));
    		temp.add(Double.toString(mu.getHours_used() * mu.getMachine().getHourly_rent()));
    		machine_list.add(temp);
    	}
    	
    	List<List<String>> job_list = new ArrayList<List<String>>();
    	Set<JobHours> jhlist = timesheet.getJobHours();
    	for (JobHours jh : jhlist)
    	{
    		List<String> temp = new ArrayList<String>();
    		temp.add(jh.getJob().getJobCode());
    		temp.add(Double.toString(jh.getHours_worked()));
    		temp.add(Double.toString(jh.getHours_worked() * jh.getJob().getJobHourlyRate()));
    		job_list.add(temp);
    	}   	
    	
    	mod.put("labors", job_list);
    	mod.put("machines" , machine_list);
    	mod.put("timesheet" , timesheet);
    	
        return new ModelAndView("timesheetReview", mod);

    }
    
    
    @GetMapping("/timesheetConfirm/{id}")
    public ModelAndView timesheetConfirm(@PathVariable("id") long id) {
    	
    	Timesheet timesheet = timesheetService.getTimesheetById(id);
    	timesheet.setIsOpen(false);
    	timesheetService.add(timesheet);
    	
        return new ModelAndView("redirect:/timesheetlist");

    }
    
    @GetMapping("/home")
    public ModelAndView home() {
    	
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("timesheets", timesheetService.getTimesheets());
		mod.put("jobs", jobService.getAllJobs());
		mod.put("machines", machineService.getMachines());
		mod.put("tab", "timesheet_table");
		return new ModelAndView("adminIndex", mod);

    }

    @GetMapping("/userhome")
    public ModelAndView userHome() {
    	
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("timesheets", timesheetService.getTimesheets());
		return new ModelAndView("userIndex", mod);

    }
    
}   
    
  