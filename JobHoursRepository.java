package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.JobHours;

public interface JobHoursRepository extends CrudRepository<JobHours, Integer> {

}
