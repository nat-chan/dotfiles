#!/usr/bin/zsh

if ! killall -0 ssh-agent 2> /dev/null ;then
    eval `ssh-agent|tee ~/.ssh/agent`
    ssh-add ~/.ssh/id_rsa ~/.ssh/id_rsa.git ~/.ssh/id_rsa.hpcs
#    ssh-add ~/.ssh/id_rsa*
else
    source ~/.ssh/agent > /dev/null
    echo -ne "[ $SSH_AGENT_PID:$SSH_AUTH_SOCK ]"
    ssh-add -l| while read n sha key rsa; do
        echo -ne " `basename $key`"
    done
    echo
fi
