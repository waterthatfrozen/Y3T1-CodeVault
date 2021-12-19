# flaskBackend
flaskBackend Example

# Dependencies
- Flask
- Peewee

# Installation

```
pip install flask peewee
```

# Heroku

```
heroku login
heroku container:login
heroku create {appname}
heroku container:push web --app {appname}
heroku container:release web --app {appname}
heroku open --app {appname}
heroku logs --tail --app {appname}
```