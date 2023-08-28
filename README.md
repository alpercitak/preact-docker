# preact-docker
Preact Docker configuration

### local

```bash
pnpm install
pnpm dev
```

### docker

```bash
docker build -t preact-docker - target deploy .
docker run -p 5173:80 preact-docker
```

### docker-compose

```bash
docker-compose up --remove-orphans --build
```

### terraform

```bash
terraform init -upgrade
terraform apply --auto-approve
```
