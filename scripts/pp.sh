#!/bin/bash

PORTA=22
PORTB=10022
#PIPEA=ppng.ml/3f786850e387550fdab836ed7e6dc881de23001b
#PIPEB=ppng.ml/89e6c98d92887913cadf06b2adb97f26cde4849b
PIPEA=18.176.57.176/3f786850e387550fdab836ed7e6dc881de23001b
PIPEB=18.176.57.176/89e6c98d92887913cadf06b2adb97f26cde4849b

if [ $1 = 'server' ]; then
    while :; do
        socat "EXEC:curl -NsS http\://${PIPEA}!!EXEC:curl -NsST - http\://${PIPEB}" TCP:127.0.0.1:${PORTA}
    done
elif [ $1 = 'client' ];then
    while :; do
        socat TCP-LISTEN:${PORTB} "EXEC:curl -NsS http\://${PIPEB}!!EXEC:curl -NsST - http\://${PIPEA}"
    done
elif [ $1 = 'deploy' ];then
    wget https://github.com/nwtgck/piping-server-pkg/releases/download/v0.15.8/piping-server-linux
    chmod +x piping-server-linux
    sudo ./piping-server-linux --http-port=80
else
    exit 255
fi

