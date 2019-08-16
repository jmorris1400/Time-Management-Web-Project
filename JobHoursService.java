package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.JobHoursRepository;
import com.project.model.JobHours;

@Service
public class JobHoursService {
	
    @Autowired 
    JobHoursRepository jobHoursRepo;
    
    public void add(JobHours jobHours) {
        jobHoursRepo.save(jobHours);
    }
    public void delete(int id) {
        jobHoursRepo.deleteById(id);
    }
    public List<JobHours> getMachineUses() {
        return (List<JobHours>) jobHoursRepo.findAll();
    }
    public JobHours getMachineUseById(int id) {
    	return (JobHours) jobHoursRepo.findById(id).orElse(null);
    }

}
