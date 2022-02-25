## IASKYOU
#### Это программа клон `Ask.fm` написаная на Ruby on Rails. 

О Ask.Fm: https://ru.wikipedia.org/wiki/ASKfm

#### Ссылка
https://iaskyou.herokuapp.com/

### Установка:
```ssh
git clone git@github.com:MAXimumCode/askme.git
cd askme
bundle install
bundle exec rails db:migrate
```

### Необходимо сконфигурировать ENV ключи для вашего окружения
#### REcaptha https://www.google.com/recaptcha
```
RECAPTCHA_ASKME_PRIVATE_KEY 
RECAPTCHA_ASKME_PUBLIC_KEY
SECRET_KEY_BASE
```

### Запуск сервера
```ssh
bundle exec rails s
```

### Автор
[Максим Козаев](https://maximumcode.github.io/CV/)
 
