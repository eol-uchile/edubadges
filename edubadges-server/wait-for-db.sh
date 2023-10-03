#!/bin/bash
# wait-for-db.sh

set -e

host="$1"
shift
cmd="$@"

until nc -z -v -w30 $host 3306
do
  echo "Waiting for database connection..."
  # wait for 5 seconds before check again
  sleep 5
done

echo "Database is up - executing command"
# exec ls .
# exec dos2unix ./edubadges-server/manage.py
./edubadges-server/manage.py migrate
./edubadges-server/manage.py seed -c
./edubadges-server/manage.py seed
./edubadges-server/manage.py addstatictoken superuser
./edubadges-server/manage.py runserver 0.0.0.0:8000