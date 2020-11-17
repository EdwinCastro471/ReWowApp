package com.ubits.petsServices.medicalRecordapi.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ubits.petsServices.medicalRecordapi.model.PetEntity;

@Repository
public interface PetRepository extends JpaRepository<PetEntity, Integer> {
	Page<PetEntity> findByIdPet(Integer idPet, Pageable pageable);
	List<PetEntity> findByIdUser(Long idUser);

}
