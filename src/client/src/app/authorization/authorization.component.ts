import { Component, OnInit } from '@angular/core';
import {LoginService} from'../services/login.service';
import { timer } from '../../../node_modules/rxjs/internal/observable/timer';
import { CookieService } from 'ngx-cookie-service';
import { ActivatedRoute, Router } from '@angular/router';
import { Login } from '../Models/login';
import { UserService } from '../services/user.service';


@Component({
  selector: 'app-authorization',
  templateUrl: './authorization.component.html',
  styleUrls: ['./authorization.component.css'],
  providers: [ LoginService]
})
export class AuthorisationComponent implements OnInit {

  private url = '/api/user/authenticate';

  private usersToSearch = [];
  private user=new Login();
  private timeIt = timer(1, 10000);
  private errorMessage='';

  model: any = {};
    loading = false;
    returnUrl: string;
    error = '';

  constructor(private loginService: LoginService,  private router: Router, private cookieService: CookieService, private userserv: UserService) { }

  ngOnInit() {
  }


  onLogin()
  {
    console.log('sdfsdf');
    this.loginService.postLogin();
    console.log('sdfsdf');
    // if(this.user.login&&this.user.password)
    // {
    //   this.loginService.postLoginUser(this.user)
    //   .subscribe((data:Login)=>this.usersToSearch.push(data));
      
    // }
    // else{
    //   this.errorMessage='Wrong input!';
    // }


  }

  onRegistration(){
    this.userserv.getUsers().subscribe();
    //this.router.navigate(['/registration']);
  }

 

}
