#!/bin/bash
# Loop & Kill proccess from passed arg
# Created by Y.G.

# Envs
# ---------------------------------------------------\
PATH=$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPT_PATH=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)

# Acts
# ---------------------------------------------------\

if [[ -z "${1}" ]]; then
    echo "Pass killing program name please."
    echo "Example: ./kill.sh steam"
    exit 0
fi

checkRun() {
    local pg=$(pgrep $1)
    if [[ ! -z "${pg}" ]]; then
        echo $pg is running
        kill -9 "${pg}"
    fi
}

# Loop
while :
do
    echo "Press [CTRL+C] to stop.."
    checkRun "${1}"
    sleep 1
done