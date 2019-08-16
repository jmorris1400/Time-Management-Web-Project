package com.project.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.beans.MachineBean;
import com.project.model.*;
import com.project.service.*;

@Controller
public class MainController {

	@Autowired
	private JobService jobService;
	@Autowired
	private JobHoursService jobHours;
	@Autowired
	private MachineService machineService;
	@Autowired
	private MachineUseService machineUse;
	@Autowired
	private TimesheetService timeService;
	@Autowired
	private UserService userService;

	
	@GetMapping("/")
	public ModelAndView root() {
		ModelAndView mv = new ModelAndView("login");
		return mv;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		String uname = request.getParameter("username");
		String pass = request.getParameter("password");
		Map<String, Object> mod = new HashMap<String, Object>();

		if (userService.isAuthorized(uname, pass)) {
			mod.put("username", uname);
			session.setAttribute("uname", uname);
			if (userService.isAdminByUserName(uname))
				return new ModelAndView("JobManagementView", mod);
			else
				return new ModelAndView("TimeSheetAdmin", mod);
		} else
			return new ModelAndView("error1");
	}

	@RequestMapping(value = "/joblist", method = RequestMethod.GET)
	public ModelAndView getJobList() {
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("jobs", jobService.getAllJobs());
		return new ModelAndView("adminIndex", mod);
	}

	@RequestMapping(value = "/machinelist", method = RequestMethod.GET)
	public ModelAndView getMachineList() {
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("machines", machineService.getMachines());
		return new ModelAndView("MachineManagementView", mod);
	}

	@RequestMapping(value = "/timesheetlist", method = RequestMethod.GET)
	public ModelAndView getTimeSheetList() {
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("timesheets", timeService.getTimesheets());
		mod.put("jobs", jobService.getAllJobs());
		mod.put("machines", machineService.getMachines());
		return new ModelAndView("adminIndex", mod);
	}
	
	@RequestMapping(value = "/deletejob.html", method = RequestMethod.GET)
	public ModelAndView deleteJob(@RequestParam("id") Integer id) {
		jobService.removeJob(id);
//		return new ModelAndView("redirect:/joblist");
		return new ModelAndView("redirect:/timesheetlist");
	}

	@RequestMapping(value = "/deletemachine.html", method = RequestMethod.GET)
	public ModelAndView deleteMachine(@RequestParam("id") Integer id) {
		machineService.delete(id);
//		return new ModelAndView("redirect:/machinelist");
		return new ModelAndView("redirect:/timesheetlist");
	}
	
	
	
	

	@RequestMapping(value = "/newmachine.html", method = RequestMethod.GET)
	public ModelAndView newMachine(@ModelAttribute("command") Machine machine, BindingResult result) {

		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("machine", null);
//		 mod.put("isUpdate", false);
		ModelAndView mv = new ModelAndView("NewMachineView", mod);
		return mv;
	}

	@RequestMapping(value = "/saveMachine", method = RequestMethod.POST)
	public String addMachine(@ModelAttribute("command") Machine machine, BindingResult result) {
		machineService.add(machine);
		return "redirect:/machinelist";
	}

	@RequestMapping(value = "/editmachine.html", method = RequestMethod.GET)
	public ModelAndView updateMachine(@ModelAttribute("command") Machine machine, BindingResult result) {
		Machine machineToUpdate = machineService.getMachineById(machine.getId());
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("machine", machineToUpdate);
		return new ModelAndView("NewMachineView", mod);
	}


	@RequestMapping(value = "/newjob.html", method = RequestMethod.GET)
	public ModelAndView newJob(@ModelAttribute("command") Job job, BindingResult result) {
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("job", null);
		ModelAndView mv = new ModelAndView("NewJobView", mod);
		return mv;
	}

	@RequestMapping(value = "/saveJob", method = RequestMethod.POST)
	public String addJob(@ModelAttribute("command") Job job, BindingResult result) {
		jobService.saveJob(job);
		return "redirect:/joblist";
	}

	@RequestMapping(value = "/editjob.html", method = RequestMethod.GET)
	public ModelAndView updateJob(@ModelAttribute("command") Job job, BindingResult result,HttpServletRequest req) {
		int i = Integer.parseInt(req.getParameter("id"));
//		System.out.println(job.getJobId());
		Job jobToUpdate = jobService.getJobById(i);
		Map<String, Object> mod = new HashMap<String, Object>();
		mod.put("job", jobToUpdate);
		return new ModelAndView("NewJobView", mod);
	}
	

//    @RequestMapping(value="/logout",method = RequestMethod.GET)
//    public String logout(HttpSession session) {
//    	session.removeAttribute("uname");
//    	session.invalidate();
//    	return "redirect:/login.html";
//    }    

//    
//    @RequestMapping(value="/approve" , method = RequestMethod.POST)
//    public String approveTimesheet(@ModelAttribute("command") Timesheet timesheet , BindingResult result) {
//    	timeService.approveTimeSheet(timesheet.getId());
//    	return "redirect:/timesheetlist.html";
//    }

}