package com.ubits.petsServices.medicalRecordapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ubits.petsServices.medicalRecordapi.model.UserInformationEntity;

public interface UserInformationRepository extends JpaRepository<UserInformationEntity, Long>{
	
	UserInformationEntity findByIdUser(Long idUser);
}
