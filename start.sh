#!/usr/bin/env bash
cd || exit 1

#git clone https://github.com/melvio/website_melvio_dev2.git webapp

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install python3-dev nginx python3-venv

cd ~/webapp/backend || exit 1
python3 -m venv venv
source venv/bin/activate
python3 pip install --upgrade pip
python3 -m pip install -r requirements.txt

python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8001
