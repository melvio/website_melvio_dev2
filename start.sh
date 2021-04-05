#!/usr/bin/env bash
cd || exit 1

#git clone https://github.com/melvio/website_melvio_dev2.git webapp

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y python3-dev nginx python3-venv uwsgi-emperor

cd ~/webapp/backend || exit 1
python3 -m venv venv
source venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

read -ri "did you make a .env file?"

python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8000

cd ~/webapp/etc/ || exit 1
sudo cp -r ./* /etc/

sudo systemctl enable nginx
