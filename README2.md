Projeto 02: Infraestrutura como Código com Vagrant, Ansible e Docker
Alunos: Cauã Victor Fonseca Dalmeida

📋 Sobre o Projeto

O objetivo é criar uma máquina virtual Linux que, através de scripts de automação, configura um ambiente Docker completo com suporte a Load Balance em Camada 4 (TCP) via Nginx.


Tecnologias Utilizadas:

Vagrant: Provisionamento da VM.

Ansible: Automação da configuração do S.O. e instalação do Docker.

Docker & Docker Compose: Gerenciamento de containers.

Nginx: Proxy e Load Balance.

WordPress & MySQL: Aplicação e banco de dados.


🏗️ Arquitetura da Solução
O fluxo de execução segue os seguintes passos:

Vagrantfile: Cria a VM Debian e chama o provisionador Ansible.

Playbook Ansible: Atualiza o sistema, instala o Docker Engine e executa o Docker Compose.

Docker Compose: Sobe três containers (webproxy, webserver, database) conectados na rede wordpress.


⚙️ Especificações da Infraestrutura
Máquina Virtual (Vagrant) 

SO: Debian Bookworm 64-bit.

IP Privado: 192.168.56.151.

Recursos: 1024 MB de RAM.

Hostname: joao.caua.

Containers Docker

webproxy: Baseado em imagem personalizada do Nginx, realizando Load Balance na porta 8080.

webserver: Imagem oficial do WordPress.

database: Imagem oficial do MySQL 8.0 com volume persistente.


🚀 Como Executar
Pré-requisitos:

Vagrant instalado.

VirtualBox instalado.

Ansible instalado na máquina hospedeira.

Passo a Passo
-Clone este repositório:

git clone https://github.com/joaow2708/Projeto-2-ASA---Docker-com-Vagrant-e-Ansible

cd Projeto-2-ASA---Docker-com-Vagrant-e-Ansible

-Inicie o ambiente: Na raiz do projeto, execute o comando:

vagrant up

Acesse a aplicação: Após o término do script, abra seu navegador em:

http://192.168.56.151:8080.

📁 Estrutura de Arquivos

Vagrantfile: Configuração da VM.


playbook_ansible.yml: Automação da configuração da VM.


docker-compose.yml: Orquestração dos containers.


Dockerfile: Customização da imagem Nginx.


nginx.conf: Configuração do Load Balance TCP.
