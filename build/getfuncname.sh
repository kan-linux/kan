#!/bin/sh
#2015-04-07,20:02
#to got init function name from vmlinux by function address
#the function address retrieve from kernel dmesg
#because i'd been add some debug codes to print address
#of init functions in the do_initcalls
#in init/main.c
#zhouwg

while read line 
do
    if [ -z "$line" ]
    then 
        continue
    fi

    addr=`echo $line  | sed 's/.*0x//g' | sed 's/).*//g' `
    #echo $addr
    if [ -n $addr ]; then
        symbol=`nm vmlinux | grep $addr `
        if [ -z "$symbol" ] 
        then 
            continue
        fi

        name=${symbol:10:20}
        
        echo $name
    fi
done < $1
