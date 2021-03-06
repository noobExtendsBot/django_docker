#!/bin/bash

if [ "$DATABASE" = "postgres" ]
then
	echo "Waiting for postgres"

	while ! nc -z $POSTGRES_HOST $POSTGRES_PORT; do
		sleep 0.1
	done

	echo "PostgreSQL Started"
fi

python manage.py flush --no-input
python manage.py migrate

exec "$@"