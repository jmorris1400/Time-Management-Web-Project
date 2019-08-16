package com.project.test;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import com.project.model.Machine;
import com.project.model.MachineUse;
import com.project.model.Timesheet;
import com.project.service.JobHoursService;
import com.project.service.JobService;
import com.project.service.MachineService;
import com.project.service.MachineUseService;
import com.project.service.TimesheetService;
import com.project.service.UserService;

@Component
public class UserTest implements CommandLineRunner {

	@Autowired
	UserService userService;
	@Autowired
	MachineService machineService;	
	@Autowired
	MachineUseService machineUseService;
	@Autowired
	TimesheetService timesheetService;
	@Autowired
	JobService jobService;
	@Autowired
	JobHoursService jobHoursService;


	@Override
	public void run(String... args) throws Exception {
		if (args.length == 1) {

			
	    	
			/*
			Timesheet timesheet = timesheetService.getTimesheetById(134);
			
			Set<JobHours> jhl = timesheet.getJobHours();
			Set<MachineUse> mul = timesheet.getMachineuses();
			for(JobHours j : jhl)
				System.out.println(j.getId());
			for(MachineUse m : mul)
				System.out.println(m);	
			
			  timesheet.setTotalHours();
			  timesheet.setTotalAmount();

			  timesheetService.add(timesheet);
			*/
		/*
			  
			  Timesheet timesheet = new Timesheet(); 
			  timesheet.setContractor_name("pablo");
			  timesheet.setDate("9/22/19"); 
			  timesheet.setSite_code("gg-22");
			  
			  Machine m = new Machine(); 
			  m.setCode("AJT-1300");
			  m.setDescription("something"); 
			  m.setHourly_rent(5.55);
			  m.setMax_hours_per_day(7.5);
			  machineService.add(m); 
			  
			  Job j = new Job();
			  j.setJobCode("xxx");
			  j.setJobHourlyRate(5.55);
			  j.setJobmaxHours(2);
			  jobService.saveJob(j);
			  
			  JobHours jh = new JobHours();
			  jh.setJob(j);
			  jh.setTimesheet(timesheet);
			  jh.setHours_worked(5.2);
			  
			  
			  MachineUse machineuse = new MachineUse(); 
			  machineuse.setHours_used(4);
			  machineuse.setMachine(m);
			  machineuse.setTimesheet(timesheet);
			  
			  timesheet.addJobHours(jh);
			  timesheet.addMachineUse(machineuse);
			  timesheetService.add(timesheet);
			  
			  jobHoursService.add(jh);
			  machineUseService.add(machineuse);
			  
			  timesheet.setTotalHours();
			  timesheet.setTotalAmount();

			  timesheetService.add(timesheet);
*/
		}
	}
}
