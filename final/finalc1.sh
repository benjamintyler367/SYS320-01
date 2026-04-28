#!/bin/sh
link="http://10.0.17.6/IOC.html"
fullPage=$(curl -sL "$link")
iocRows=$(echo "$fullPage" | xmlstarlet sel -T -t \
	-m "//tr[position()>1]" \
	-v "td[1]" -n)
echo "$iocRows" > IOC.txt
