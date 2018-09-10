import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AboutUserBodyComponent } from './ui/about-user-body/about-user-body.component';
import { PostComponent } from './ui/post/post.component';
import { NavigationToolsComponent } from './ui/navigation-tools/navigation-tools.component';
import { RegistrationComponent } from './ui/registration/registration.component';
import { AuthorisationComponent } from './ui/authorization/authorization.component';
import { UserpageComponent } from './ui/userpage/userpage.component';

const routes: Routes = [
  {
    path: 'login',
    component: AuthorisationComponent,
  },
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full',
  },
  {
    path: 'registration',
    component: RegistrationComponent
  },

  {
    path: 'menu',
    component: NavigationToolsComponent,
    children: [
      {
        path: 'post',
        component: PostComponent,
      },
      {
        path: 'interesting',
        component: UserpageComponent,
      },
      {
        path: '**',
        component: UserpageComponent,
      },
      {
        path: 'auth',
        redirectTo: './login',
        pathMatch: 'full',
      }

    ]
  },
  {
    path: '**',
    redirectTo: ''
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }