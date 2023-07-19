#### Docker compose nginx + certbot config

##### This config used to hanlde https connections with proxy passing to some API on some port running in docker container

##### To use it:
- clone this repo to some folder on server
- create docker network ``nginx-all`` :
```
docker network create nginx-all
```
- edit ```nginx/example-site.conf``` with right domain
- run proxy and then dry-run the certbot:
```
docker compose up proxy
```
```
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d <DOMAIN_NAME_OF_SERVER>
```
- if everything is ok, get the certificates (if not ok -- google errors):
```
docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d <DOMAIN_NAME_OF_SERVER>
```
- uncomment ssl part in ``nginx/some-site.conf`` and edit it accordingly to a domain
- run your API server connected to a docker network ``nginx-all``
- restart proxy to update config:
```
docker compose restart proxy
```
- check if everything is working

##### to renew certificates use:

```
docker compose run --rm certbot renew
```
