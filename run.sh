#!/bin/bash
echo -e "\033[1;33m Enter Your Choice\e[0m"
echo -e "-----------------"
echo -e "\033[1;33m 1.) All Users\e[0m"
echo -e "\033[1;33m 2.) Specific User\e[0m"
echo -e "\033[1;33m 3.) Specific Date\e[0m"
echo -e "\033[1;33m 4.) Exit\e[0m"

echo -e "-----------------"
read choice

tfname=`(date +%Y-%m-%d-%H-%M-%S)`".txt"

case $choice in
    1)
        echo -e  "\033[1;33m You selected  1\e[0m"
        File=info.txt
        if [ -f "$File" ]; then
            rm -rf info.txt
            echo -e "\033[1;33m $processing.................................\e[0m"
            sleep 2
            
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            
            file="info.txt"
            while IFS=" "  read -r usr dat tin tout
            do
                echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                echo -e "------------------------------------------------------------------------------------"
                echo -e "\033[1;33m Following modification and access by user \e[0m"
                echo -e "------------------------------------------------------------------------------------"
                find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                echo -e  "\n\n\n"
            done <"$file"  > $tfname
            
            
        else
            echo -e "\033[1;33m $processing.................................\e[0m"
            sleep 2
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            
            file="info.txt"
            while IFS=" "  read -r usr dat tin tout
            do
                echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                echo -e "------------------------------------------------------------------------------------"
                echo -e "\033[1;33m Following modification and access by user \e[0m"
                echo -e "------------------------------------------------------------------------------------"
                find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                echo -e  "\n\n\n"
            done <"$file" > $tfname
            
        fi
        rm -rf info.txt
    ;;
    
    
    
    
    2)
        echo -e  "\033[1;33m You selected 2\e[0m"
        File=info.txt
        if [ -f "$File" ]; then
            rm -rf info.txt
            rm -rf info2
            echo -e "\033[1;33m please enter user name that you want to search:\e[0m"
            read  u
            echo -e "\033[1;33m $processing.................................\e[0m"
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            file="info.txt"
            cat $file | grep $u > info2
            file="info2"
            if grep -q $u $file; then
                
                while IFS=" "  read -r usr dat tin tout
                do
                    echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    echo -e "\033[1;33m Following modification and access by user \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                    echo -e  "\n\n\n"
                done <"$file"  > $tfname
            else
                echo "Data Not found"
            fi
        else
            echo -e "\033[1;33m please enter user name that you want to search:\e[0m"
            read u
            
            echo -e "\033[1;33m $processing.................................\e[0m"
            sleep 2
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            
            file="info.txt"
            cat $file | grep $u > info2
            file="info2"
            if grep -q $u $file; then
                
                
                
                
                while IFS=" "  read -r usr dat tin tout
                do
                    echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    echo -e "\033[1;33m Following modification and access by user \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                    echo -e  "\n\n\n"
                done <"$file"  > $tfname
            else
                echo "Data Not found"
            fi
            
            
        fi
        rm -rf info.txt
        rm -rf info2
    ;;
    
    
    3)
        
        echo -e  "\033[1;33m You selected 3\e[0m"
        File=info.txt
        if [ -f "$File" ]; then
            rm -rf info.txt
            rm -rf info2
            echo -e "\033[1;33m please enter the date in this format YYYY-MM-DD to search:\e[0m"
            read  u
            echo -e "\033[1;33m $processing.................................\e[0m"
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            file="info.txt"
            cat $file | grep $u > info2
            file="info2"
            if grep -q $u $file; then
                
                while IFS=" "  read -r usr dat tin tout
                do
                    echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    echo -e "\033[1;33m Following modification and access by user \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                    echo -e  "\n\n\n"
                done <"$file"  > $tfname
            else
                echo "Data not found"
            fi
            
        else
            echo -e "\033[1;33m please enter the date in this format YYYY-MM-DD to  search:\e[0m"
            read u
            
            echo -e "\033[1;33m $processing.................................\e[0m"
            sleep 2
            last -0 | awk '!/down|reboot|crash|wtmp/ {print}'| awk '{ if($5 == "Jan") {$5 = 01} else if ($5=="Feb"){$5=02} else if ($5=="Mar"){$5=03} else if ($5 == "Apr") {$5 = 04} else if ($5=="May") {$5=05} else if($6=="Jun"){$5=06} else if ($5=="Jul"){$5=07} else if ($5=="Aug"){$5=08} else if($5=="Sep"){$5=09} else if ($5=="Oct"){$5=10} else if($5=="Nov"){$5=11} else if ($5=="Dec"){$5=12}  else {$5 =00} print }' | awk '{if($8=="still"){$9=(strftime("%R", systime()))} print }'|awk '{print $1,strftime("%Y", systime())"-"$5"-"$6,$7,$9}' | awk  '$4!=""' > info.txt
            
            file="info.txt"
            cat $file | grep $u > info2
            file="info2"
            if grep -q $u $file; then
                
                while IFS=" "  read -r usr dat tin tout
                do
                    echo -e  " \033[1;33m Hi admin  $usr  logged in $tin time and logged out at $tout on the following date $dat \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    echo -e "\033[1;33m Following modification and access by user \e[0m"
                    echo -e "------------------------------------------------------------------------------------"
                    find /var/www/html  -user $usr  -newermt "$dat $tin" ! -newermt "$dat $tout"
                    echo -e  "\n\n\n"
                done <"$file"  > $tfname
            else
                echo "Data not Found"
            fi
        fi
        rm -rf info.txt
        rm -rf info2
        
    ;;
    
    
    
    *)
        echo "Thanks..............."
        exit
    ;;
esac
