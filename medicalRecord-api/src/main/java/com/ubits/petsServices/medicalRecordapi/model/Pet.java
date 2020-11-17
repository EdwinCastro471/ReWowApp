package com.ubits.petsServices.medicalRecordapi.model;

import javax.persistence.MappedSuperclass;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@MappedSuperclass
public class Pet {
	private String name;
	private String size;
	private String description;
	private Integer idUser;
}
