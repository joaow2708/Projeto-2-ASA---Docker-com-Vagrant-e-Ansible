# Usa a imagem oficial do Nginx como base (exigência do projeto)
FROM nginx:latest

# Atualiza os repositórios e instala ferramentas solicitadas:
# - ping: para testes de conectividade
# - curl: para testes HTTP
RUN apt-get update && \
    apt-get install -y iputils-ping curl && \
    apt-get clean

# Remove a configuração padrão do Nginx
# Isso evita conflitos com nossa configuração personalizada
RUN rm /etc/nginx/nginx.conf

# Copia o arquivo nginx.conf customizado
# Ele será responsável pelo Load Balance em camada 4
COPY nginx.conf /etc/nginx/nginx.conf
