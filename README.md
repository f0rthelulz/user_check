# user_check
*User Monitoring* Prints and hashes a list of users hourly, logging changes made to /var/log/user_changes. Updates /var/log/current_users with the newest hash and sends an email upon changed hash

Edit line 18 and replace example@gmail.com with your email
Script assumes postfix is properly set up and configured on your server
Tested on Ubuntu Server 16.04
