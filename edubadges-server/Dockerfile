# Dockerfile for edubadges-server
FROM python:3.7.6

# Install necessary utilities
RUN apt-get update && apt-get install -y netcat

WORKDIR /app
# Add script to wait for database
RUN git clone https://github.com/edubadges/edubadges-server.git .
COPY wait-for-db.sh wait-for-db.sh
RUN chmod +x /app/wait-for-db.sh

# RUN cd edubadges-server
RUN git submodule update --init
# RUN pip install virtualenv
# RUN virtualenv .venv
# RUN ./venv/bin/activate
# RUN cp env_vars.sh.example env_vars.sh
COPY env_vars.sh env_vars.sh
RUN apt-get update && apt-get install -y dos2unix 
RUN apt-get update && apt-get install -y locales && \
    locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
RUN dos2unix ./env_vars.sh && dos2unix ./wait-for-db.sh
RUN dos2unix ./manage.py
# RUN apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*
RUN chmod +x env_vars.sh
# RUN ./env_vars.sh
# RUN bash ./env_vars.sh
# RUN ./env_vars.sh
# Set the environment variables
ENV PYTHONUNBUFFERED=1 \
    ACCOUNT_SALT="secret" \
    ALLOW_SEEDS=1 \
    BADGR_DB_NAME="badgr" \
    BADGR_DB_USER="root" \
    BADGR_DB_PASSWORD="pass" \
    BADGR_DB_HOST="db" \
    BADGR_DB_PORT="3306" \
    DEBUG=1 \
    DEFAULT_DOMAIN="http://127.0.0.1:8000" \
    DEFAULT_FROM_EMAIL="noreply@surf.nl" \
    DOMAIN="localhost:4000" \
    EDU_ID_CLIENT="edubadges" \
    EDU_ID_SECRET="ask-a-colleague" \
    OIDC_RS_ENTITY_ID="test.edubadges.rs.nl" \
    OIDC_RS_SECRET="ask-a-colleague" \
    EDUID_PROVIDER_URL="https://connect.test.surfconext.nl/oidc" \
    EDUID_REGISTRATION_URL="https://login.test.eduid.nl/register" \
    EMAIL_HOST="localhost" \
    EMAIL_PORT="1026" \
    LTI_FRONTEND_URL="localhost" \
    ROOT_INFO_SECRET_KEY="secret" \
    SUPERUSER_EMAIL="superuser@example.com" \
    SUPERUSER_NAME="superuser" \
    SUPERUSER_PWD="secret" \
    SITE_ID=1 \
    BADGR_APP_ID=1 \
    SURF_CONEXT_CLIENT="www.edubadges.nl" \
    SURF_CONEXT_CLIENT="test.edubadges.nl" \
    SURF_CONEXT_SECRET="secret" \
    TIME_STAMPED_OPEN_BADGES_BASE_URL="http://127.0.0.1:3000/" \
    UI_URL="http://localhost:4000" \
    UNSUBSCRIBE_SECRET_KEY="secret" \
    LC_ALL="en_US.UTF-8" \
    LANG="en_US.UTF-8" \
    MEMCACHED_HOST="127.0.0.1" \
    MEMCACHED_PORT="11211"
RUN pip install -r requirements.txt
RUN . ./env_vars.sh 
# RUN ./manage.py migrate
# RUN ./manage.py seed -c
# RUN ./manage.py seed
# RUN ./manage.py addstatictoken superuser
EXPOSE 8000

# CMD ["./manage.py", "runserver", "0.0.0.0:8000"]
CMD ./wait-for-db.sh db ./edubadges-server/manage.py runserver 0.0.0.0:8000
