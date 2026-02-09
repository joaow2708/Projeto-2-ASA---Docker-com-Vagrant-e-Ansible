# Projeto DevOps com Docker, Vagrant e Ansible 

**EQUIPE:**  João Wictor Ferreira Henriques da Silva- (20241380005) e Caua Victor Fonseca Dalmeida  - (20241380021).

**DISCIPLINA:** Administração de Sistemas Abertos.

**PROFESSOR:** Leonidas Francisco de Lima Júnior.


## 🚀 Introdução
Este projeto foca na automação completa da montagem e configuração de um servidor **Ubuntu Linux**, utilizando o conceito de **Infraestrutura como Código (IaC)**. O objetivo é garantir que todo o ambiente de rede e servidores seja criado de forma automática e padronizada, facilitando o estudo e a manutenção de sistemas modernos.

A arquitetura foi desenhada para orquestrar, através de **Docker** e **Docker Compose**, um ecossistema composto por uma aplicação **WordPress** e um banco de dados **MySQL**, protegidos por um proxy **Nginx** que gerencia o fluxo de requisições. Todo o ambiente pode ser replicado ou atualizado com facilidade através deste repositório.

### 1. Camada de Virtualização (Vagrant)
O arquivo `Vagrantfile` define uma máquina virtual robusta:
* **Box:** `debian/bookworm64`.
* **Hostname:** `joao.caua`.
* **Rede:** IP fixo `192.168.56.151` em rede privada.
* **Hardware:** 1024 MB de RAM rodando em modo *headless*.
* **Segurança:** Geração de chaves SSH automática desabilitada.

### 2. Camada de Configuração (Ansible)
O `playbook_ansible.yml` automatiza todo o setup do sistema operacional:
* **Update/Upgrade:** Atualiza o Debian para a versão estável mais recente.
* **Instalação do Docker:** Configura os repositórios oficiais e instala o Docker Engine e o Plugin Compose v2.
* **Ambiente de Trabalho:** Cria o diretório `/home/vagrant/projeto`, configura permissões e transfere os arquivos de configuração necessários.

### 3. Camada de Aplicação (Docker & Nginx)
A stack de serviços é composta por:
* **WebProxy (Nginx):** Construído via **Dockerfile** personalizado.
    * Base: `nginx:latest`.
    * Ferramentas: Instalação de `ping` e `curl` para diagnósticos.
    * Configuração: Implementa **Load Balance em Camada 4 (TCP)** via módulo `stream`, redirecionando o tráfego da porta **8080** para o WordPress.
* **WebServer (WordPress):** Imagem oficial configurada com volumes persistentes para os arquivos da aplicação.
* **Database (MySQL 8.0):** Banco de dados persistente com credenciais seguras definidas via variáveis de ambiente.

---

## 🏗️ Como o Projeto está Organizado

A estrutura de arquivos foi planejada para separar as responsabilidades de cada ferramenta no fluxo DevOps:

### 🏠 Arquivos de Infraestrutura (Raiz)
* **`Vagrantfile`**: É o "projeto arquitetônico" da máquina virtual. Define que usaremos Debian, quanto de memória RAM o servidor terá e qual será seu IP fixo (`192.168.56.151`).
* **`playbook_ansible.yml`**: É o "manual de instruções". Ele automatiza a atualização do sistema, instala o Docker e o Docker Compose, e prepara as permissões de usuário.
* **`docker-compose.yml`**: É o "maestro dos containers". Ele orquestra o WordPress e o MySQL, garantindo que eles se comuniquem e que os dados não sejam perdidos (volumes persistentes).

### 🔌 Pasta do Proxy (`nginx/`)
* **`Dockerfile`**: É a "receita" da nossa imagem customizada. Ele cria um Nginx exclusivo que já vem com ferramentas de diagnóstico (`ping` e `curl`) instaladas.
* **`nginx.conf`**: É a "ponte de conexão". Configura o Nginx para operar na **Camada 4**, recebendo as visitas na porta **8080** e encaminhando para o WordPress.

---


## 🚀 Como Executar o Projeto

### ✅ Pré-requisitos
Antes de começar, certifique-se de possuir instalado:
* **VirtualBox**
* **Vagrant**
* **Ansible**
* **Docker**



### ⚡ Passos para a Execução

1. **Clonagem do Repositório**:
   ```bash
   git clone [https://github.com/joaow2708/Projeto-2-ASA---Docker-com-Vagrant-e-Ansible.git](https://github.com/joaow2708/Projeto-2-ASA---Docker-com-Vagrant-e-Ansible.git)
   cd Projeto-2-ASA---Docker-com-Vagrant-e-Ansible



