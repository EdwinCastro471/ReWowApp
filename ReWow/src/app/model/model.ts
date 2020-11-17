export interface Pet{
    idPet: number;
    idUser: number;
    name: string;
    idPetType: number;
    size: string;
    description: string;
}

export interface Vaccinations{
    number: number;
    type: string;
    date: Date;
  }

export let arrayVaccinations: Vaccinations[] = [];
