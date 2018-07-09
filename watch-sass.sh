#!/bin/sh

#  Script.sh
#  SrAdminUi
#
#  Created by Jennifer Duong on 06/07/2018.
#  

# Convert SIGINT and SIGTERM to an EXIT signal to avoid duplicate traps
trap 'exit' INT TERM

# Kill all processes in the current process group
trap 'kill 0' EXIT

shopt -s expand_aliases
alias on_change="while IFS= read -r -d ''"
monitor()
{
    [[ $1 == "-i" ]] && { echo -n -e "\0"; shift; }
    fswatch -0 "$@"
}

monitor -i Sources/App/sass | on_change path
    do
        echo "Re-building CSS (due to change in ${path})"
        sassc --style compressed \
        Sources/App/sass/app.scss \
        public/styles/app.css
done &

wait
