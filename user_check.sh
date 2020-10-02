#!/bin/bash
#user_check.sh

#Prints & hashes a list of users hourly, logging changes made in /var/log/user_changes
#Also updates /var/log/current_users with the newest hash 
#Sends an email each time a user change is logged. Ass

users=$(cat /etc/passwd | gawk -F: '{print $1 ":" $6}' > /var/log/user_list)
checkHash=$(cat /var/log/current_users)
#updateHash=$(echo $makeHash > /var/log/current_users)


$users
cat /var/log/user_list
makeHash=$(cat /var/log/user_list | md5sum | cut -d " " -f 1)
updateHash=$(echo $makeHash > /var/log/current_users)
test -e /var/log/current_users || $updateHash
test "(echo $makeHash)" = "(echo $checkHash)" || echo "The users list has changed." | mail -s "Change to Media Server Users" example@gmail.com
test "(echo $makeHash)" = "(echo $checkHash)" || echo "`date` changes occurred" >> /var/log/user_changes && $updateHash
