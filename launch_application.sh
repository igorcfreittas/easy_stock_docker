## Baixando o projeto e inicializando
mkdir applications
git clone https://github.com/igorcfreittas/easy_stock.git applications/easy_stock

## Baixando as imagens e buildando tudo
docker-compose up --build -d

## Configurando o .env para dev e deixando tudo pronto para começar
cp applications/easy_stock/.env.example applications/easy_stock/.env
docker exec -it php composer install
docker exec -it php php artisan key:generate
docker exec -it php php artisan migrate --path=/database/migrations/2020_06_14_130817_create_accounts_table.php
docker exec -it php php artisan migrate
docker exec -it php php artisan db:seed

# adding the project domain to default php-fpm user
docker exec -it php chown -R www-data:www-data /var/www/html
docker exec -it php chmod -R 777 /var/www/html

echo "\nBuild OK\n"