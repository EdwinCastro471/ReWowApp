package com.ubits.petsServices.medicalRecordapi.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ubits.petsServices.medicalRecordapi.model.PetEntity;
import com.ubits.petsServices.medicalRecordapi.model.PetTypeEntity;
import com.ubits.petsServices.medicalRecordapi.model.UserInformationEntity;
import com.ubits.petsServices.medicalRecordapi.repository.PetRepository;
import com.ubits.petsServices.medicalRecordapi.repository.PetTypeRepository;
import com.ubits.petsServices.medicalRecordapi.repository.UserInformationRepository;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@RestController
@RequestMapping("/api")
public class PetController {
	@Autowired
	PetRepository petRepository;
	
	@Autowired
	UserInformationRepository userRepository;
	
	@Autowired
	PetTypeRepository petTypeRepository;

	@GetMapping("/pet")
	public List<PetEntity> getPet() {
		return petRepository.findAll();
	}

	@GetMapping("/pet/{petOwner}")
	public List<PetEntity> getPetForOwner(@PathVariable(value = "petOwner") Long idUser) {
		return petRepository.findByIdUser(idUser);
	}
	
	@GetMapping("/user/{petOwner}")
	public UserInformationEntity getPetOwner(@PathVariable(value = "petOwner") Long idUser) {
		return userRepository.findByIdUser(idUser);
	}
	
	@GetMapping("/petType")
	public List<PetTypeEntity> getPetTypes() {
		return petTypeRepository.findAll();
	}
	
	@GetMapping("/petType/{petType}")
	public PetTypeEntity getPetType(@PathVariable(value = "petType") Integer idPetType) {
		return petTypeRepository.findByIdPetType(idPetType);
	}

	@PostMapping("/pet")
	public PetEntity createPet(@RequestBody PetEntity pet) {
		return petRepository.save(pet);
	}
}
