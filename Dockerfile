# Usar a imagem oficial do Nginx [cite: 51]
FROM nginx:latest

# Instalar pacotes ping e curl [cite: 53]
RUN apt-get update && apt-get install -y iputils-ping curl

# Copiar configuração de Load Balance (criaremos o arquivo no próximo passo)
COPY nginx.conf /etc/nginx/nginx.conf
