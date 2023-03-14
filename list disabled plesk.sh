#!/bin/bash

# Get a list of all Plesk domains
domains=$(plesk bin domain --list | awk '{print $1}')

# Loop through each domain and check its status
for i in $domains; do
		plesk bin site -i $i  >> /root/disableddomains/report-$DATE;
		echo "- - - - - - -" >> /root/disableddomains/report-$DATE;
done


