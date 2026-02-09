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

## 📂 Estrutura de Arquivos

```text
.
├── Vagrantfile               # Definição da VM Debian
├── playbook_ansible.yml      # Automação da instalação do Docker e Deploy
├── docker-compose.yml        # Orquestração dos containers
└── nginx/
    ├── Dockerfile            # Customização da imagem Nginx
    └── nginx.conf            # Configuração de Proxy Reverso (Layer 4

## Execução do Projeto:

### **Pré-requisitos**
- **VirtualBox** Instalado.  
- **Vagrant** Instalado.  
- **Ansible** Instalado.
- **Docker** Instalado.  
  

### **Passos Necessários para a execução:**

1. **Clone este repositório:**
   ```bash
   git clone https://github.com/joaow2708/Projeto-2-ASA---Docker-com-Vagrant-e-Ansible.git
   cd Projeto-2-ASA---Docker-com-Vagrant-e-Ansible
   
2. **Suba as VMs:**
   ```bash
   vagrant up 
