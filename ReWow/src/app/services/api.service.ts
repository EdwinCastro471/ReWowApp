import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Pet } from '../model/model';
import { PetType } from '../model/PetType';
import { UserInformation } from '../model/UserInformation';

@Injectable({
  providedIn: 'root',
})
export class ApiService {
  private PetUrl = 'http://localhost:8080/api/pet';
  private UserUrl = 'http://localhost:8080/api/user/';
  private petTypeUrl = 'http://localhost:8080/api/petType/';
  constructor(private http: HttpClient) {}

  public getPet(): Observable<Pet[]> {
    return this.http.get<Pet[]>(this.PetUrl);
  }

  public getUserInformation(idUser: number): Observable<UserInformation> {
    return this.http.get<UserInformation>(this.UserUrl + idUser);
  }

  public getPetTypes(idType: number): Observable<PetType>{
    return this.http.get<PetType>(this.petTypeUrl + idType);
  }
}
