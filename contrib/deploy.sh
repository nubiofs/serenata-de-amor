export CURRENT_DIR=$(pwd)
cd /opt/serenata-de-amor
git pull origin master
docker-compose -f docker-compose.yml -f docker-compose.prod.yml pull
docker-compose -f docker-compose.yml -f docker-compose.prod.yml stop
docker-compose -f docker-compose.yml -f docker-compose.prod.yml run --rm django python manage.py collectstatic --no-input
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
docker-compose -f docker-compose.yml -f docker-compose.prod.yml run --rm django python manage.py migrate
docker-compose -f docker-compose.yml -f docker-compose.prod.yml run --rm django python manage.py clear_cache
cd $CURRENT_DIR
