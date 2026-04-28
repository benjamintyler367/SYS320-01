#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "usage: $0 log_file ioc_file"

	exit 1
fi
log_file="$1"
ioc_file="$2"
while IFS= read -r ioc_pattern; do

#regex
	grep "$ioc_pattern" "$log_file" | awk '{sub(/^\[/, "", $4); sub(/\]$/, "", $4); print $1, $4, $7}' >> report.txt

done < "$ioc_file"

echo "saved to report.txt"
