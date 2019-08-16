package com.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dao.JobRepository;
import com.project.model.Job;

@Service
public class JobService {
	
	@Autowired
	private JobRepository jobRepo;
	
	public Job getJobById(int id) {
		return jobRepo.findById(id).orElse(null);
	}
	
	public void saveJob(Job job) {
		jobRepo.save(job);
	}
	
	public void removeJob(int id) {
			jobRepo.deleteById(id);
	}
	
	public List<Job> getAllJobs(){
		return (List<Job>) jobRepo.findAll();
	}

}
