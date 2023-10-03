#!/bin/bash
# set -e

# Load timezone info into MySQL
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root --password="${MYSQL_ROOT_PASSWORD}" mysql

# Run the main command (mysqld)
# exec "$@"
