#!/bin/zsh
file=(`ls|grep six$`)
n=1
cat $file[1]
while read -sk1 a;do
	file=(`ls|grep six$`)
	if [ "$a" = k ];then
		((n--))
		[ $n = 0 ]&&n=$((n+${#file}))
	elif [ "$a" = q ];then
		exit
	else
		n=$((n%${#file}))
		((n++))
	fi
	cat $file[$n]
done

