## Baixando o projeto e inicializando
mkdir applications
git clone https://github.com/igorcfreittas/easy_stock.git applications/easy_stock

## Baixando as imagens e buildando tudo
docker-compose up --build -d

## Configurando o .env para dev e deixando tudo pronto para começar
cp applications/easy_stock/.env.example applications/easy_stock/.env
docker exec -it php composer install
docker exec -it php php artisan key:generate
docker exec -it php php artisan migrate
docker exec -it php php artisan db:seed

# Add permission to default php-fpm user
docker exec -it php chown -R www-data:www-data /var/www/html
docker exec -it php chmod -R 755 /var/www/html/storage

echo "\nBuild OK\n"