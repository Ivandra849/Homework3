1. На 4 балла: логи лежат в logs.txt
2. На 6 баллов: переменные окружения по умолчанию лежат в .env.example(POST - порт приложения в контейнере, HOST_PORT - порт приложения на компьютере, GREETING - приветственное сообщение). Изменить переменные окружения можно в .env.
Команды запуска(.env = .env.example)
1)docker compose config - проверка концигурации compose
2)docker compose up -d --build - сборка образа и запуск контейнера
3)docker compose ps - проверка состояния контейнера
4)curl http://127.0.0.1:8080/ - узнать значение счетчика(вместо 8080 подставить HOST_POST если он не 8080)
{"greeting": "Hello, Compose!", "count": 0, "hostname": "8ebb05de605f", "storage": "sqlite"}[ble: EOF] 
5)curl -X POST http://127.0.0.1:8080/increment - увеличить счетчик на 1
{"greeting": "Hello, Compose!", "count": 1, "hostname": "8ebb05de605f", "storage": "sqlite"}[ble: EOF]
6)docker compose down - удаление контейнера
7)docker compose up -d - создаем контейнер заново
8) curl http://127.0.0.1:8080/ - проверка значения счетчика
{"greeting": "Hello, Compose!", "count": 1, "hostname": "24086a29a7cf", "storage": "sqlite"}[ble: EOF]
3. На 8 баллов:
1)ivan@HomePC:~/Homework3 (main)$ docker compose config
2)ivan@HomePC:~/Homework3 (main)$ docker compose up -d --build
3)ivan@HomePC:~/Homework3 (main)$ docker compose ps
4)ivan@HomePC:~/Homework3 (main)$ curl http://127.0.0.1:8080/
{"greeting": "Hello, Compose!", "count": 0, "hostname": "cd0e53965037", "storage": "redis"}[ble: EOF]             ivan@HomePC:~/Homework3 (main)$ ^[[200~curl -X POST http://127.0.0.1:8080/increment
curl -X POST http://127.0.0.1:8080/increment
curl -X POST http://127.0.0.1:8080/increment
curl: команда не найдена
{"greeting": "Hello, Compose!", "count": 1, "hostname": "cd0e53965037", "storage": "redis"}{"greeting": "Hello, Compose!", "count": 2, "hostname": "cd0e53965037", "storage": "redis"}[ble: EOF]
5)ivan@HomePC:~/Homework3 (main)$ curl -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, Compose!", "count": 3, "hostname": "cd0e53965037", "storage": "redis"}[ble: EOF]
6)ivan@HomePC:~/Homework3 (main)$ docker compose down
7)ivan@HomePC:~/Homework3 (main)$ docker compose up -d
8)ivan@HomePC:~/Homework3 (main)$ curl http://127.0.0.1:8080/
{"greeting": "Hello, Compose!", "count": 3, "hostname": "239f66a2c03d", "storage": "redis"}[ble: EOF]
9)ivan@HomePC:~/Homework3 (main)$ docker compose stop redis
10)ivan@HomePC:~/Homework3 (main)$ curl -i http://127.0.0.1:8080/healthz
HTTP/1.0 200 OK
11)ivan@HomePC:~/Homework3 (main)$ curl -i http://127.0.0.1:8080/readyz
HTTP/1.0 503 Service Unavailable
12)ivan@HomePC:~/Homework3 (main)$ curl -i -X POST http://127.0.0.1:8080/increment
HTTP/1.0 503 Service Unavailable
13)ivan@HomePC:~/Homework3 (main)$ docker compose start redis
14)ivan@HomePC:~/Homework3 (main)$ docker compose ps
15)ivan@HomePC:~/Homework3 (main)$ curl http://127.0.0.1:8080/
{"greeting": "Hello, Compose!", "count": 3, "hostname": "239f66a2c03d", "storage": "redis"}[ble: EOF]
16)ivan@HomePC:~/Homework3 (main)$ curl -X POST http://127.0.0.1:8080/increment
{"greeting": "Hello, Compose!", "count": 4, "hostname": "239f66a2c03d", "storage": "redis"}[ble: EOF]


