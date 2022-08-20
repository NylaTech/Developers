#!/bin/bash
echo "Hey Manager Name" ; echo "the date is $(date | cut -d " " -f 1-3) and the time is $(date | cut -d " " -f 4). And we are running on $(timedatectl | grep -F "Time zone" | cut -d " " -f 19-22)."
echo "The server is $(uptime | cut -d " " -f 3), it  been running for $(uptime | cut -d " " -f 4-5 | tr -d ",") "
echo -e  "The table below shows all the users, userID, and groupID we have in our server\nuser     \tuserID\tgroupID " 
cat /etc/passwd | cut -d ":" -f 1-4 | tr -d "x" | column -t -s ":"
echo "The public address is $(wget -qO - icanhazip.com) and the private address is $(hostname -i | cut -d " " -f 2)"
echo "The SSH service is $(systemctl status sshd | grep Active | cut -d ' ' -f 6 | tr -d "()")"
echo "The HTTPD version is $(rpm -qa httpd | cut -d "." -f 1-3 | cut -d "-" -f 2-3)"
echo "The git version is $(rpm -qa git | cut -d "-" -f 2-3 | cut -d "." -f 1-3)"
#hostname -i | cut -d " " -f 2 curl ifconfig.co echo $SHELL | cut -d "/" -f 3 rpm -qa httpd | cut -d "." -f 1-3 rpm -qa git
echo -e "NB: we are running $0.\nRegards,\n`whoami`"

