package com.ubits.petsServices.medicalRecordapi.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "vaccinationspet")
public class VaccinationsPetEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idPet")
	@JsonIgnore
	@Id
	PetEntity pet;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idVaccinations")
	@JsonIgnore
	@Id
	VaccinationsEntity vaccinations;

}
