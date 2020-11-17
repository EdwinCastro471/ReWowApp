package com.ubits.petsServices.medicalRecordapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ubits.petsServices.medicalRecordapi.model.PetTypeEntity;

public interface PetTypeRepository extends JpaRepository<PetTypeEntity, Integer>{
	
	PetTypeEntity findByIdPetType(Integer idPetType);
}
