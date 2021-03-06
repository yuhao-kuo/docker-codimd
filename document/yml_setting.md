# docker-compose yaml setting

```yaml=
version: "3"
services:
  database:
    image: postgres:11.6-alpine
    environment:
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=abc123
      - POSTGRES_DB=codimd
    volumes:
      - "database-data:/var/lib/postgresql/data"
    restart: always
  codimd:
    image: hackmdio/hackmd:2.4.1
    environment:
      - CMD_DB_URL=postgres://user:abc123@database/codimd
      - CMD_USECDN=false
      - CMD_DEFAULT_PERMISSION=limited
      - CMD_ALLOW_FREEURL=true
      - CMD_EMAIL=true
      - CMD_IMAGE_UPLOAD_TYPE=filesystem
      - CMD_ALLOW_EMAIL_REGISTER=false
    depends_on:
      - database
    ports:
      - "3000:3000"
    volumes:
      - upload-data:/home/hackmd/app/public/uploads
    restart: always
volumes:
  database-data:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ${PWD}/volume/database
  upload-data:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: ${PWD}/volume/upload
```
