package com.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.MachineUseDAO;
import com.project.model.MachineUse;

@Component
public class MachineUseService {
	
    @Autowired MachineUseDAO repository;
    
    public void add(MachineUse machineuse) {
        repository.save(machineuse);
    }
    public void delete(long id) {
        repository.deleteById(id);
    }
    public List<MachineUse> getMachineUses() {
        return (List<MachineUse>) repository.findAll();
    }
    public MachineUse getMachineUseById(long id) {
    	return (MachineUse) repository.findById(id).orElse(null);
    }

}