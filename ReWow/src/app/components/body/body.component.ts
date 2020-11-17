import { Component, OnInit } from '@angular/core';
import { ApiService } from 'src/app/services/api.service';
import { Vaccinations, arrayVaccinations, Pet } from '../../model/model';
import { UserInformation } from '../../model/UserInformation';
import { PetType } from '../../model/PetType';

@Component({
  selector: 'app-body',
  templateUrl: './body.component.html',
})
export class BodyComponent implements OnInit {
  pet: Pet;
  user: UserInformation;
  petType: PetType;
  constructor(private apiservice: ApiService) {
    this.pet = { idPet: 0, idUser: 0, name: '', idPetType: 0 ,size: '', description: '' };
    this.user = {
      idUser: 0,
      firstName: '',
      lastName: '',
      email: '',
      address: '',
    };
    this.petType = { idPetType: 0, type: ''};
  }
  petTypes: string[] = ['Cat', 'Dog', 'Fish', 'Other'];
  petSize: string[] = ['Small', 'Medium', 'Big'];

  vaccination: Vaccinations = {
    number: 1,
    type: 'Prueba',
    date: new Date(2020, 1, 1),
  };

  rabia: Vaccinations = {
    number: 2,
    type: 'Rabia',
    date: new Date(2019, 1, 1),
  };

  arrayVaccinations = [this.vaccination, this.rabia];
  ngOnInit(): void {
    this.callPet();
  }
  private callPet(): void {
    this.apiservice.getPet().subscribe(
      (pet) => {
        this.pet = pet[0];
        this.callUserInformation(this.pet.idUser);
        this.callPetType(this.pet.idPetType);
      },
      (err) => {
        console.log(err);
      }
    );
  }

  private callUserInformation(idUser: number): void {
    this.apiservice.getUserInformation(idUser).subscribe(
      (userInformation) => {
        this.user = userInformation;
        console.log(this.user);
      },
      (err) => {
        console.log(err);
      }
    );
  }

  private callPetType(idPetType: number): void {
    this.apiservice.getPetTypes(idPetType).subscribe(
      (petType) => {
        this.petType = petType;
        console.log(this.petType);
      },
      (err) => {
        console.log(err);
      }
    );
  }
}
