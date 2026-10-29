# 🐳 Docker for QA
![Docker](https://api.devicons.dev.br/icon?icons=Linux%2CDocker%2CVIM%2CVSCode&size=48&theme=dark&perline=30)


Este repositório contém os arquivos e instruções práticas desenvolvidos durante o treinamento de **Docker focado em Quality Assurance**. O objetivo do projeto é demonstrar como empacotar uma aplicação web (Parodify) utilizando o Nginx, abordando desde a criação de imagens customizadas via `Dockerfile` até o mapeamento seguro de volumes e portas em ambiente Linux.

---
#
## 📂 Estrutura do Repositório

```text
docker-for-qa/
├── app/            # Diretório com os arquivos estáticos da aplicação Parodify
├── Dockerfile      # Instruções de build da imagem customizada baseada em Nginx
├── index.html      # Página inicial/landing do projeto
└── README.md       # Documentação do projeto
```

#
## 🛠️ Pré-requisitos (Ambiente Linux)
Antes de iniciar, certifique-se de que o Docker Engine e o Git estejam instalados no seu ambiente (Ubuntu / Zorin OS / Debian).

1. Atualizar os repositórios e instalar o Docker
```
sudo apt update
sudo apt install -y docker.io git
```

2. Ativar o serviço do Docker
```
sudo systemctl start docker
sudo systemctl enable docker
```

3. (Opcional) Executar o Docker sem necessidade de sudo
```
sudo usermod -aG docker $USER
```
> **Nota:** Após executar o comando acima, reinicie a sessão ou a máquina para aplicar as permissões do grupo.


#
## 🚀 Como Clonar e Executar a Aplicação
1. Clonar o repositório
```
git clone https://github.com/SamuraiQAction87/docker-for-qa.git .
cd docker-for-qa
```

2. **Opção A:** Executar via Imagem Customizada (Dockerfile)
Para construir a imagem empacotada com a aplicação e o editor Vim configurados no servidor Nginx:

```
# 1. Construir a imagem customizada
docker build -t parodify-custom:latest .

# 2. Executar o contêiner amarrado à interface de loopback
docker run -d --name parodify-app -p 127.0.0.1:8081:80 parodify-custom:latest
```

3. **Opção B:** Executar via Bind Mount (Desenvolvimento Local)
Caso queira refletir alterações no código local em tempo real no contêiner:

```
docker run -d --name parodify-dev -p 127.0.0.1:8080:80 -v $(pwd)/app:/usr/share/nginx/html nginx
```

#
## 🌐 Acessando a Aplicação
Com o contêiner em execução, abra o seu navegador no Linux e acesse:

Modo **Imagem Customizada**: http://127.0.0.1:8081

Modo **Bind Mount**: http://127.0.0.1:8080

#
## 🔒 Boas Práticas de Infraestrutura Aplicadas
**Segurança de Rede:** Utilização do mapeamento explícito 127.0.0.1:PORTA:80 para garantir que o contêiner fique acessível exclusivamente na interface de loopback local, prevenindo a exposição indevida das portas em interfaces de rede públicas (0.0.0.0).

**Imutabilidade do Ambiente:** Garantia de que a aplicação se comporte de forma padronizada em qualquer máquina que execute a imagem criada.


