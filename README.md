## 1. Установка 

#### Требования

- Docker
- Docker compose

#### Переходим в папку api

```bash
cd api
```

#### Установка переменных окружения

```bash
cp .env.example .env
```
Далее отредактируйте файл .env в корневой директории проекта, вписав в него нужные Вам данные

#### Билд проекта

```bash
docker-compose up -d --build
```
