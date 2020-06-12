## Baixando o projeto e inicializando
mkdir applications
git clone https://github.com/igorcfreittas/easy_stock.git applications/easy_stock

## Baixando as imagens e buildando tudo
docker-compose up --build -d

## Configurando o .env para dev e deixando tudo pronto para começar
cp applications/easy_stock/.env.example applications/easy_stock/.env
docker exec -it php composer install
docker exec -it php php artisan key:generate
docker exec -it php php artisan db:seed

echo "\nBuild OK\n"