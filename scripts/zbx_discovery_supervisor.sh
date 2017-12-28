#!/bin/bash
# Version : v1.0 2017-12-28
# For auto discovery of supervisor
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# list all processes
PROCESSES=`sudo /usr/bin/supervisorctl status 2>/dev/null| grep -v 'supervisor.sock'|awk '{print $1}'`


# get processes array
INDEX=0
for PROCESS_NAME in $PROCESSES
do
    PROCESS_NAME_NUM[$INDEX]=$PROCESS_NAME
    let INDEX=INDEX+1
done

num=$(echo ${#PROCESS_NAME_NUM[@]})

# echo json
printf '{\n'
printf '\t"data":[\n'
for((i=0;i<${#PROCESS_NAME_NUM[@]};++i))
{
    NUM=$(echo $((${#PROCESS_NAME_NUM[@]}-1)))
        if [ "$i" != ${NUM} ];then
            printf "\t\t{ \n"
            printf "\t\t\t\"{#PROCESS_NAME}\":\"${PROCESS_NAME_NUM[$i]}\"},\n"
        else
            printf  "\t\t{ \n"
            printf  "\t\t\t\"{#PROCESS_NAME}\":\"${PROCESS_NAME_NUM[$NUM]}\"}\n"
        fi
}
printf ']}'
