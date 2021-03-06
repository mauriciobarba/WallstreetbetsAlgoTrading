#!/bin/bash
# This is to replace what would be a makefile in other projects.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [ "$1" == "s" ];
then
    gpg -d ${DIR}/Credentials/Credentials.txt.gpg > ${DIR}/Credentials/Credentials.txt
    gpg -d ${DIR}/Credentials/google_credentials.json.gpg > ${DIR}/Credentials/google_credentials.json
    echo "credentials decrypted into ./Credentials"
    python3 -m virtualenv ./venv/
    echo "virtual environment set up"
    source ${DIR}/venv/bin/activate
    if [ -d ${DIR}/venv -a -f ~/.bashrc ];
    then 
	pip3 install -r requirements.txt
        echo "alias wsb-utils=\"bash ${DIR}/bash-utils.sh\"" >> ~/.bashrc
        echo "aliased \"wsb-utils\""
    else
        echo "no venv found or no bashrc"
    fi
    echo "make sure to only run setup once"
elif [ "$1" == "r" ];
then
    source ${DIR}/venv/bin/activate
    export GOOGLE_APPLICATION_CREDENTIALS="${DIR}/Credentials/google_credentials.json"
    python3 ${DIR}/main.py
elif [ "$1" == "v" ];
then 
    source ${DIR}/venv/bin/activate
else
    echo "not an option. Please use \"s\", setup or \"r\" for run, or \"v\" for virtual environment"
fi
