package com.ubits.petsServices.medicalRecordapi.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "pet")
public class PetEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idpet")
	private Long idPet;
	@Column(name = "iduser")
	private Long idUser;
	private String name;
	@Column(name = "idpettype")
	private int idPetType;
	private String size;
	private String description;

}
