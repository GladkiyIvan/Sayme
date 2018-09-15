import { Component, OnInit } from '@angular/core';
import { User } from '../../Models/user';
import { SubscriptionService } from '../../services/subscription.service';
import { UserImage } from '../../Models/userImage';

@Component({
  selector: 'app-following',
  templateUrl: './following.component.html',
  styleUrls: ['./following.component.css']
})
export class FollowingComponent implements OnInit {

  constructor(private subscriptionService: SubscriptionService) { }

  usersAndImage = [];

  ngOnInit() {
    this.loadUserFollowing();
  }


  loadUserFollowing() {
    this.subscriptionService.getFollowing()
      .subscribe((data: User[]) => {
        this.usersAndImage = [];
        this.addImages(data);
      },)
  }

  addImages(data) {
    for (let user of data) {
      if (user.avatar == null)
        this.usersAndImage.push(new UserImage(user, null));
      else
        this.usersAndImage.push(new UserImage(user, 'data:image/jpg;base64,' + user.avatar));
    }
  }

  onDeleteFollowing(idWhom) {
    this.subscriptionService.deleteFollowing(idWhom).subscribe(()=>this.loadUserFollowing());
  }
}
