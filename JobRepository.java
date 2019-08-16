package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.Job;

public interface JobRepository extends CrudRepository<Job,Integer> {

}
