import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable()
export class BaseService {
  protected baseUrl: string = 'https://localhost:8000/api';

  constructor(protected http: HttpClient) {}
}
