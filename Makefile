.PHONY: renew get-certs-dry-run get-certs restart rebuild up-proxy

renew:
        docker compose run --rm certbot renew

get-certs-dry-run:
        docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ --dry-run -d $(domain)

get-certs:
        docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d $(domain)

restart:
        docker compose restart proxy

rebuild:
        docker compose up proxy --build

up-proxy:
        docker compose up proxy
