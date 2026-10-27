# Usa a imagem oficial e leve do Nginx como base
FROM nginx

# Atualizando o OS e instalando o editor de texto Vim:
RUN apt update && apt install -y vim

# Copia os arquivos da aplicação local (pasta app) 
# para o diretório padrão do Nginx no contêiner:
COPY ./app /usr/share/nginx/html

# Expõe a porta 80 internamente para o Docker Engine
EXPOSE 80

# Define o comando padrão para iniciar o Nginx em primeiro plano, 
# garantindo que o contêiner continue em execução:
CMD ["nginx", "-g", "daemon off;"]