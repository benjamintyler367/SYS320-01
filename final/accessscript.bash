#!/bin/bash


logpath="/home/champuser/SYS-320/final/accesslog.txt"
emailform="/home/champuser/SYS-320/final/emailforum.txt"


echo "File was accessed $(date)" >> "$logpath"


echo "To: benjamin.tyler@mymail.champlain.edu" > "$emailform"
echo "Subject: userlogs.bash access" >> "$emailform"
echo >> "$emailform"
cat "$logpath" >> "$emailform"


cat "$emailform" | /usr/sbin/ssmtp benjamin.tyler@mymail.champlain.edu
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
userlogs.bash was accessed
