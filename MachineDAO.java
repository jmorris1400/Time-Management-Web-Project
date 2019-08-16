package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.Machine;

public interface MachineDAO extends CrudRepository<Machine, Integer> {
	


}