#!/bin/bash

url="http://10.0.17.6/Assignment.html"
page=$(curl -s "$url")

clean_page=$(xmlstarlet format --html --recover 2>/dev/nulll <<< "$page")

temp_rows=$(xmlstarlet sel -T -t \
	-m "(//table)[1]//tr[position()>1]" \
	-v "normalize-space(td[1])" -o "|" \
	-v "normalize-space(td[2])" -n <<< "$clean_page")


press_rows=$(xmlstarlet sel -T -t \
	-m "(//table)[2]//tr[position()>1]" \
	-v "normalize-space(td[1])" -o "|" \
	-v "normalize-space(td[2])" -n <<< "$clean_page")


paste <(echo "$press_rows") <(echo "$temp_rows") | awk -F'\t' '
{
	split($1, p, /\|/)
	split($2, t, /\|/)
	print p[1], t[1], t[2]
}
'
