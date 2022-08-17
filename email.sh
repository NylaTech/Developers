#!/bin/bash
freeMem=`free | grep Mem | cut -d " " -f 22`
echo "$freeMem"
if [ $freeMem -gt 999999 ]
then
echo "There is enough Memory"
else
echo -e "The Memory is too low\nThe current value is : $freeMem\nThe admin should take immediate action" >> /home/dominion/email.txt
sendmail rodriguetchadjoko1@gmail.com < /home/dominion/email.txt
fi
