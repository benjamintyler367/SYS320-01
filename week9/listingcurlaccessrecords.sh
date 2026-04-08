#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function getAllLogs(){
allLogs=$(cat "$file" | cut -d' ' -f1,4,7 | tr -d "[")
}

function pageCount(){
	pagesAccessed=$(awk '{print $7}' "$file" | sort | uniq -c | sort -nr)

	echo "$pagesAccessed"
}

function countingCurlAccess(){
	curlAccess=$(cat "$file" | cut -d' ' -f1,12 | tr -d "[")
	echo "$curlAccess"
}

countingResults=$(countingCurlAccess)
echo "$countingResults"
