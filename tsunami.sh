#!/bin/bash

#
##
###Installation of the required dependencies  
##
#
echo "FIRST STEP" 
echo "-------Installation of the required dependencies-----"
echo \ \ 

# Choose the configuration directory 

read -r -p "entrez répertoire d'install (par défaut dans /opt) : "  dir

if [-z $dir ];then 
	dir=/opt 
fi

#Choose to update and/or upgrade

while true
do
read -r -p "Do you want to update ?" rep
	case $rep in
    	yes)
        	apt update -y 
		apt upgrade -y
		break;;
    	no)
		echo "Ok. Let's install tsunami"
		break;;
	cancel) 
		exit;;
    	*) 
		echo "Please answer with a yes or a no";;
	esac
done


echo \ \

## Installation 

#-----NMAP----# 
echo "NMAP installation : "
apt install nmap -y 
echo \ \

#-----NCRACK----# 
echo "NCRACK Installation : "
apt install ncrack -y

#----Install Curl----#
echo "Curl installation"
apt install curl -y 

#----Install Java----#
echo "Java "
apt install openjdk-11-jre
apt install default-jre

##
### Quick Start with a single script 
##
#

echo \ \
echo "-------Quick start via a single Script-------"
cd $dir
bash -c "$(curl -sfL https://raw.githubusercontent.com/google/tsunami-security-scanner/master/quick_start.sh)"

#set file .jar permission
chmod a+x tsunami-main-0.0.2-SNAPSHOT-cli.jar 


exit


