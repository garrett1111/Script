#!/bin/bash

#This script will dump network information to the command line and to an output file 

#get the date
date=$(date +"%Y-%m-%d")

#create an output file for the network information to be stored in 
output="output_file${date}.txt"

#this is a function that will format the script, and make the outputs easier to read
function format {
  echo
  echo "==================== $1 ===================="
  echo "==================== $1 ====================" >> "$output"
}

#this will indicate a new log in the output file
echo "Network Information Dump $date" | tee -a "$output"

#IP address information
format "IP Info"
ip addr | tee -a "$output"

#DNS server information
format "DNS Server"
cat /etc/resolv.conf | tee -a "$output"

#Identify open ports
format "Listening Ports"
ss -tuln | tee -a "$output"

#Routing table information
format "Routing Table"
route -n | tee -a "$output"

#NetworkManager Information
format "NetworkManager"
nmcli device show | tee -a "$output"

echo 
echo "Wonderful"
