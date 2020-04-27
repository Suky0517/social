# CS 1XA3 Project03 - <zhans174>
## Usage
inastall conda enviroment with            
**"conda activate django**   
Run locally with  
**python manage.py runserver localhost:8000**   
Run on mac1xa3.ca with  
**python manage.py runserver localhost:10118**  
Log in with TestUser username, password with corresponding password.

## Objective 01
Description:  
- this feature is displayed in signup.djhtml which is rendered by singup_view
- itmakes a POST Request to from signup.js to /e/zhans174/signup which is handled by signup_view
- It gives a standard signup form for users to signup  
Exceptions:
- If the username has already be used or if the password don't match, they form will alert you how to correct it

## Objective 02
Description:  
- this feature is displayed in social_base.djhtml which is rendered by message_view, people_view and account_view
- itmakes a POST Request to from login.js to /e/zhans174/social/account/ which is handled by message_view, people_view, account_view
- It can implement a real Profile and Interests corresponding to the currently logged in user 
Exceptions:
- If there is no corresponding feature, it shows None

## Objective 03
Description:  
- this feature is displayed in social_base.djhtml which is rendered by message_view, people_view and account_view
- itmakes a POST Request to from login.js to /e/zhans174/social/account/ which is handled by message_view, people_view, account_view
- The first form can be used to update password 
- The second form can be used to change some basic information of the current user, such as employment, location and date of birth.
Exceptions:
- If the interests has already be selected, there will be a conflict

## Objective 04
Description:  
- this feature is displayed in people.djhtml which is rendered by people_view
- itmakes a POST Request to from people.js to /e/zhans174/people which is handled by people_view
- the middle column displays one user who is not friend with the current user.
- click on the more button, it shows one more user.
Exceptions:
- If the user is already the signed-in user's friend, it will not displayed there

## Objective 05
Description:  
- this feature is displayed in people.djhtml which is rendered by people_view
- it makes a POST Request to from people.js to /e/zhans174/social/people which is handled by friend_request_view  

Exceptions:
- If the request has been sent twice, the accept or decline icon will show up twice

## Objective 06
Description:  
- this feature is displayed in people.djhtml which is rendered by accept_decline_view
- It takes accept decision or decline decision to the friend's request. 

Exceptions:
- If the not all the buttons from one required user was clicked, the icon will not disappear

## Objective 07
Description:  
- this feature is displayed in message.djhtml which is rendered by message_view
- The right column of the page displays all the friends of the current user

Exceptions:
- It is a robust objective, no exceptions

## Objective 08
Description:  
- this feature is displayed in message.djhtml which is rendered by post_submit_view
- When click the post botton, the post will be submitted
Exceptions:
- There is length maximum limit for each post

## Objective 09
Description:  
- when rendering the template, it dispaly real posts given by messages_view
- it sorts the posts by the newest and to oldest
- It only display one more post when click the more button

Exceptions:
- It is a robust objective

## Objective 10
Description:  
- this feature is displayed in messages.views, when click the like button, it gives one more like and the like button will be greyed. 
Exception:
- It is a robust objective

## Objective 11
There are some user information and their password  
TestUser  | Auser | Buser
--------- | ------ | -----
fghjkl;'| fghjkl;' | fghjkl;'

Buser has two interest { interest1, interest2 }

