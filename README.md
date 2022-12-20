# Drupal local proxy

## Usage

- Start: `docker compose up -d`.
- Stop: `docker compose stop`
- Remove containers: `docker compose down`

## Configuration

By default, all traffic is served via Varnish cache. To disable Varnish, modify the `.env` file and remove the value from `VARNISH_PREFIX` env variable:

```
# .env
VARNISH_PREFIX=
```

and restart the project: `docker compose restart`.

## Adding a new project

Modify `default.conf.template` file and add something like:

```
# Project name
location ~ ^/(fi/project|en/project|sv/project|project-assets/) {
  proxy_set_header Host ${VARNISH_PREFIX}helfi-project.docker.so;
  proxy_pass https://helfi-backend:443;
}
```
- Change `helfi-project.docker.so` to match your project's domain. 
- `fi/project`, `en/project` and `sv/project` part should match the `prefixes` setting defined in `helfi_proxy` module: [city-of-helsinki/drupal-module-helfi-proxy#site-prefix](https://github.com/City-of-Helsinki/drupal-module-helfi-proxy#site-prefix).
- `project-assets/` should match the `asset_path` configuration defined in `helfi_proxy` module: [city-of-helsinki/drupal-module-helfi-proxy#asset-path](https://github.com/City-of-Helsinki/drupal-module-helfi-proxy#serve-assets-from-asset-path). The nginx configuration **must** have a trailing slash.


## Available sites

### Asuminen
- https://helfi-proxy.docker.so/en/housing
- https://helfi-proxy.docker.so/fi/asuminen
- https://helfi-proxy.docker.so/sv/boende

### Avustukset
- https://helfi-proxy.docker.so/en/grants
- https://helfi-proxy.docker.so/fi/avustukset
- https://helfi-proxy.docker.so/sv/bidrags

### Etusivu
- https://helfi-proxy.docker.so/en
- https://helfi-proxy.docker.so/fi
- https://helfi-proxy.docker.so/sv

### Kaupunki ja hallinto
- https://helfi-proxy.docker.so/en/administration
- https://helfi-proxy.docker.so/fi/kaupunki-ja-hallinto
- https://helfi-proxy.docker.so/sv/stad-och-forvaltning

### Kasvatus koulutus
- https://helfi-proxy.docker.so/en/childhood-and-education
- https://helfi-proxy.docker.so/fi/kasvatus-ja-koulutus
- https://helfi-proxy.docker.so/sv/fostran-och-utbildning

### KuVA
- https://helfi-proxy.docker.so/en/culture-and-leisure
- https://helfi-proxy.docker.so/fi/kulttuuri-ja-vapaa-aika
- https://helfi-proxy.docker.so/sv/kultur-och-fritid

### Liikenne
- https://helfi-proxy.docker.so/en/urban-environment-and-traffic
- https://helfi-proxy.docker.so/fi/kaupunkiymparisto-ja-liikenne
- https://helfi-proxy.docker.so/sv/stadsmiljo-och-trafik

### Rekry
- https://helfi-proxy.docker.so/en/open-jobs
- https://helfi-proxy.docker.so/fi/avoimet-tyopaikat
- https://helfi-proxy.docker.so/sv/lediga-jobb

### Strategia
- https://helfi-proxy.docker.so/en/decision-making
- https://helfi-proxy.docker.so/fi/paatoksenteko-ja-hallinto
- https://helfi-proxy.docker.so/sv/beslutsfattande-och-forvaltning

### Terveys
- https://helfi-proxy.docker.so/en/health-and-social-services
- https://helfi-proxy.docker.so/fi/sosiaali-ja-terveyspalvelut
- https://helfi-proxy.docker.so/sv/social-och-halso

### Yritykset ja tyo
- https://helfi-proxy.docker.so/en/business-and-work
- https://helfi-proxy.docker.so/fi/yritykset-ja-tyo
- https://helfi-proxy.docker.so/sv/foretag-och-arbete
