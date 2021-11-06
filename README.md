## 1. Установка бекенда (API)

#### Требования

- Docker
- Docker compose

#### Переходим в папку api

```bash
cd api
```
Дальнейшие команды выполняем в этой же папке

#### Установка переменных окружения

```bash
cp .env.example .env
```
Далее отредактируйте файл .env в корневой директории проекта, вписав в него нужные Вам данные

#### Билд проекта

```bash
docker-compose up -d --build
```

#### Миграции и сидинг (заполнение таблиц тестовыми данными)

```bash
docker-compose exec app php artisan migrate
docker-compose exec app php artisan db:seed
```

## 2. Запуск мобильного приложения

#### Требования

- Flutter
- Android SDK
- IDE с установленным плагином Flutter

#### Билд приложения

Открываем папку flutter в любом IDE, на котором установлен плагин Flutter. Запускаем приложение в эмуляторе. Если бекенд установлен на хостинге, то в файле настроек "flutter/lib/settings.dart" меняем IPhttp://10.0.2.2 на IP или домен своего хостинга. 