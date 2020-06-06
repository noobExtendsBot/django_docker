# Dockerfile for Djnago with gunicorn, postgres and nginx

---

## Layout

![layout](https://i.imgur.com/wC2dmKZ.png)

**nginx**:

![nginx-layout](https://i.imgur.com/yO9erTM.png)

> `nginx.conf` has all the settings eg to connect to `django app`, serve `static` and `media` files. The Dockerfile removes `default.conf` from `/etc/nginx/conf.d/` in the nginx container and replace `nginx.conf` in `/etc/nginx/` with our `/nginx/nginx.conf` from the repo.

**static and media**:

> Our django related stuffs

## Env Files

1. `.env.dev`:
   It has `SECRET_KEY`, `DEBUG=1` for development mode, and `POSTGRES` settings.

2. `.env.prod`: Same settings just `DEBUG=0`

3. `.env.prod.db`: DB settings to be used in `docker-compose.prod.yml` for production env.

**NOTE**: In `.env.dev` stick to `POSTGRES_HOST=db` as it is, rest you can change as desired or required.

---

## Docker and docker-compose files:

1. `Dockerfile` works in conjuncture `docker-compose.yml`
2. `Dockerfile.prod` works in conjuncture `docker-compose.prod.yml`
