#!/bin/bash

# Apply migrations
python manage.py migrate

./createsuperuser.sh

python manage.py makemigrations product cart order
python manage.py migrate

# Start the Django application
exec "$@"
