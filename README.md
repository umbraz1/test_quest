# Тестовое задание на Technical Support Engineer
В этом репозитории содержаться материалы на теоретическую и практическую часть тестового задания.
<img src="https://github.com/blackcater/blackcater/raw/main/images/Hi.gif" height="32"/></h1>

Ответы на вопросы будут находится тут,
а как файлы я выложу:
- [Dockerfile](https://github.com/umbraz1/test_quest/blob/main/build_syscoin.dockerfile) для сборки Syscoin
- Скрипт сравнения с двух Api в двух файлах:
  
[Python script version](https://github.com/umbraz1/test_quest/blob/main/import%20requests.py) |
[Bash script version](https://github.com/umbraz1/test_quest/blob/main/import%20requests%20(bash).sh)
<h1 align="center">Теоретическая часть</h1>

<h3>1)Контейнер рестартится, логов нет, так как не успевает писать. Что будешь делать?</h3>

Ответ:
Я бы попробовал выполнить следующие действия:
- Проверил бы конфигурацию Докера и ресурсы хоста ( например, доступность дискового пространства)
- Добавить в контейнер скрипт, который увеличивает время до второго процесса в контейнере, чтобы дать ему время начать писать логи
- Перенаправил бы запись логов в файл или централизированный логиннг сервер на стороне
- Попробовал бы установить дополнительные инструменты для мониторинга и логирования, такие как Fluentd, Logstash или другие аналоги.

<h3>2)Деплой сервиса провалился с сообщением типа “при запуске контейнера возникла ошибка” без деталей. Твои действия?</h3>


Ответ:
Варианты действий, как я думаю:
- Для начала необходимо проверить логи контейнера, в котором произошла ошибка. Для этого можно воспользоваться командой docker logs <container_id>.
- Выполнить docker ps -a, чтобы увидеть статус всех контейнеров. Посмотреть какой статус у проблемного контейнера. мб? "Exited" или "Dead".
- Проверить файл конфигурации Docker (например, Dockerfile или docker-compose.yml), чтобы убедиться, что все параметры и настройки указаны правильно.
- Проверить все  необходимые зависимости и ресурсы (например портики) доступны и не конфликтуют с другими контейнерами или приложениями.
- Проверить версию образа, вдруг там ошибка. Попробовать обновить образ и перезапустить контейнер.
- Проверить системные ресурсы (памяти, CPU и т. д.), чтобы контейнер мог запуститься без проблем.
- Попробовать запустить контейнер локально с теми же параметрами для более детальной диагностики.
- Если ничего всё ещё не понятно, можно зайти на сайты сообщества Докера, и поробовать поискать ответ там :)

<h3>3)Билд завершился сообщением “Репозиторий не найден“. Что будешь делать?</h3>


Ответ:
- Проверю правильность указания репозитория в настройках билда (url).
- Убежусь, что у имеется доступ к указанному репозиторию и правильные учетные данные для доступа и права доступа(для аутентификации).
- Проверю настройки прокси, если они используются для доступа к репозиторию.
- Убежусь, что репозиторий существует и доступен для сборки.
- Проверю доступ в сеть на машине и посмотрю, что Docker-хост имеет доступ к Интернету и к указанному репозиторию.
- Проверю Dockerfile на наличие ошибок, которые могут привести к невозможности поиска указанного репозитория.
- Убежусь, что образ Docker, действительно существует в указанном репозитории. Мб ошибка в теге или имени
- Посмотрю логи сборки, чтобы узнать более конкретные причины сообщения, реп не найден.


<h3>4)Есть система неважно какой структуры. Требуется настроить мониторинг с нуля. Какие уровни ты охватишь?</h3>

Ответ:
- **Инфраструктурный уровень:** Мониторинг серверов, сетевых устройств, баз данных и других инфраструктурных компонентов.
- **Прикладной уровень:** Мониторинг работы приложений, сервисов и микросервисов, включая производительность и доступность.
- **Логический уровень:** Мониторинг ключевых метрик бизнес-процессов и KPI компании.
- **Уровень безопасности:** Мониторинг угроз и аномалий в системе, обнаружение вторжений и защита данных.
- **Уровень пользовательского опыта:** Мониторинг пользовательского взаимодействия с системой для оценки качества обслуживания.
- **Общий Централизованный мониторинг:** настроить централизованную платформу мониторинга для агрегации и анализа данных, построения дашбордов и оповещений.
