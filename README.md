## Mail Sandbox Web

[![Build Status](https://secure.travis-ci.org/kaize/mail_sandbox_web.png)](http://travis-ci.org/kaize/mail_sandbox_web)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/kaize/mail_sandbox_web)

Mail Sandbox Web служит песочницей для приёма писем со стейджинг серверов.

## Запуск

Cклонировать репозиторий.

Выполнить:
 
    bundle exec rake sandbox:setup

Прописать IP сервера в __config/deploy/staging.rb__

Залить приложение на сервер:

    bundle exec cap deploy:setup deploy:migrations

Или запустить локально
 
    bundle exec unicorn_rails

Должен запуститься web сервер и smtp сервер.

## Конфиг

### Авторизация

__config/secret_keys.yml__ содержит ключи для приложение авторизации в Facebook и Github

    facebook:
        app_id: '1234567890qwert'
        app_secret: '1234567890qwertyuidfghjcvbndfghr'
    github:
        app_id: '12345678rtyudfghvbg4'
        app_secret: '123456789rtyufghfrghcvbnfghcvbfdgdfcvdfc'



### SMTP сервер

__сonfig/mail_sandbox.yml__ содержит настройки smtp сервера

    http_observe?: true
    http_observe_url: 'http://localhost/api/mail_messages'
    listen: '0.0.0.0'
    log_level: debug

http_observe_url - в качестве хоста необходимо указать адрес, по которому доступен web интерфейс.

## Использование

- Создать приложение в веб интерфейсе.
- Для Rails приложений получить готовый конфиг оптравки писем по smtp и добавить его в __config/environments/staging.rb__ .
- Для других приложений настроить отправку писем по настройкам включая PLAIN авторизацию.
