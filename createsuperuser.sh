#!/bin/bash

# Check if required environment variables are set
if [ -z "$DJANGO_SUPERUSER_USERNAME" ] || [ -z "$DJANGO_SUPERUSER_EMAIL" ] || [ -z "$DJANGO_SUPERUSER_PASSWORD" ]; then
    echo "ERROR: One or more required environment variables are missing."
    exit 1
fi

# Create the superuser with is_staff, is_superuser, and is_active set to True
echo "Creating superuser..."
python manage.py createsuperuser \
    --username "$DJANGO_SUPERUSER_USERNAME" \
    --email "$DJANGO_SUPERUSER_EMAIL" \
    --noinput

# Set the superuser's attributes
if [ $? -eq 0 ]; then
    echo "Setting superuser attributes..."
    echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username='$DJANGO_SUPERUSER_USERNAME'); user.is_staff = True; user.is_superuser = True; user.is_active = True; user.save()" | python manage.py shell
    if [ $? -eq 0 ]; then
        echo "Superuser attributes set successfully."
    else
        echo "Failed to set superuser attributes."
    fi
fi

# Set the superuser's password
if [ $? -eq 0 ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ]; then
    echo "Setting superuser password..."
    echo "from django.contrib.auth import get_user_model; User = get_user_model(); user = User.objects.get(username='$DJANGO_SUPERUSER_USERNAME'); user.set_password('$DJANGO_SUPERUSER_PASSWORD'); user.save()" | python manage.py shell
    if [ $? -eq 0 ]; then
        echo "Superuser password set successfully."
    else
        echo "Failed to set superuser password."
    fi
fi

# Continue with the entrypoint command
exec "$@"
