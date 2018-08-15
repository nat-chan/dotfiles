#!/bin/bash

for i in `seq 0 7` ; do
	for j in `seq 0 31` ; do
		k=$((32*i + j))
		printf "\033[38;5;${k}m%3d" $k
	done
	echo
done
