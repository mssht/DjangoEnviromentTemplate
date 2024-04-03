#!/bin/bash

. .venv/bin/activate

cd code

python manage.py makemigrations
python manage.py migrate
python manage.py collectstatic

if [ $DEBUG = 1 ]; then
    exec python manage.py runserver 0.0.0.0:8000
else
    exec gunicorn mysite.wsgi:application --bind 0.0.0.0:8000
fi
