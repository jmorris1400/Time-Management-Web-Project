package com.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.project.dao.MachineDAO;
import com.project.model.Machine;

@Component
public class MachineService {
	
    @Autowired MachineDAO repository;
    
    public void add(Machine machine) {
        repository.save(machine);
    }
    public void delete(int id) {
        repository.deleteById(id);
    }
    public List<Machine> getMachines() {
        return (List<Machine>) repository.findAll();
    }
    public Machine getMachineById(int id) {
    	return repository.findById(id).orElse(null);
    }

}