# Projeto Final de Administração de Redes de Computadores

**Valor:** 6,5 Pontos  
**Documentação:** 4,5 Pontos  
**Apresentação:** 2 Pontos  
**Tipo:** Dupla  

## Projeto Final

### Descrição do Trabalho

Neste projeto, você se concentrará em projetar, implantar e gerenciar uma rede empresarial usando tecnologia Linux, com ênfase em serviços como DHCP, DNS, Web, FTP, NFS e virtualização com Vagrant e Docker.

#### Etapa 01 - Estrutura Documental

**Data da Entrega:** 23/11/2023  
**Valor:** 2 Pontos  

Crie um projeto de rede, escrito, que inclua a topologia de rede, a segmentação de sub-redes e os requisitos de cada serviço a ser implementado. Use o Vagrant para criar máquinas virtuais e o Docker para implantar aplicativos em contêineres. Realize testes extensivos em cada serviço configurado, verificando a funcionalidade e a integração da rede. Documente detalhadamente, no GIT, todo o processo de configuração, incluindo scripts de configuração e anotações de configuração. A documentação deve incluir a descrição da rede, configurações e resultados dos testes.

#### Etapa 02 - Implementação

**Data da Entrega:** 30/11/2023 em diante

1. Configure um servidor DHCP no ambiente Linux para atribuir endereços IP automaticamente aos dispositivos na rede.  
   **Valor:** 1 Ponto

2. Implante um servidor DNS para resolver nomes de domínio dentro da rede e configurar registros DNS como A, CNAME, MX, etc.  
   **Valor:** 1 Ponto

3. Configure e hospede um servidor web Apache ou Nginx para fornecer serviços de hospedagem de sites internos.  
   **Valor:** 1 Ponto

4. Implemente um servidor FTP (por exemplo, vsftpd) para permitir a transferência de arquivos na rede.  
   **Valor:** 0,5 Ponto

5. Configure um servidor NFS para compartilhar diretórios e arquivos entre máquinas na rede.  
   **Valor:** 1 Ponto

---

## Projeto de Rede Empresarial - Documentação

### 1. Introdução

**OBJETIVO:**  
O objetivo deste projeto é capacitar os participantes a projetar, implementar e gerenciar uma rede empresarial eficiente, utilizando tecnologias Linux e serviços essenciais. A ênfase na automação (Vagrant e Docker) e nos testes extensivos visa garantir uma implementação robusta e funcional dos serviços propostos, contribuindo para a formação prática em administração de redes de computadores.

**ESCOPO:**  
O escopo deste projeto abrange o design, implementação e gerenciamento de uma rede empresarial utilizando tecnologia Linux. Os principais elementos incluídos no escopo são:

1. **Design da Rede**
   - **Topologia de Rede:** Definição da estrutura física e lógica da rede, identificando dispositivos como roteador, switches e servidores.
   - **Segmentação de Sub-Redes:** Divisão da rede em sub-redes para organização e segurança, incluindo Sub-Rede 1 (dispositivos), Sub-Rede 2 (servidores DNS, Web, FTP) e Sub-Rede 3 (NFS).

2. **Serviços a serem Implementados**
   2.1. **Servidor DHCP**
      - Atribuição dinâmica de endereços IP para dispositivos na Sub-Rede 1.
      - Configuração da faixa de IP, tempo de concessão e outras configurações relacionadas.

   2.2. **Servidor DNS**
      - Resolução de nomes de domínio internos.
      - Configuração de registros DNS, como A, CNAME, MX, etc.
      - Configuração de zonas DNS conforme necessário.

   2.3. **Servidor Web (Apache ou Nginx)**
      - Hospedagem de sites internos.
      - Configuração do servidor web escolhido.
      - Definição de diretórios de hospedagem e configuração de virtual hosts.

   2.4. **Servidor FTP (vsftpd)**
      - Transferência de arquivos na rede.
      - Configuração do servidor FTP com foco em segurança.
      - Definição de diretórios permitidos para transferência.

   2.5. **Servidor NFS**
      - Compartilhamento de diretórios e arquivos entre máquinas na rede.
      - Configuração do servidor NFS.
      - Definição de configurações de exportação de diretórios e permissões.

3. **Implementação**
   - Utilização do Vagrant para criar máquinas virtuais representando cada servidor.
   - Utilização do Docker para implantar aplicativos em contêineres, conforme aplicável.

4. **Testes Extensivos**
   - Realização de testes de funcionalidade para cada serviço configurado.
   - Realização de testes de integração para garantir a comunicação eficiente entre os serviços.

5. **Documentação no GIT**
   - Criação de um repositório GIT contendo toda a documentação do processo.
   - Inclusão de scripts de configuração para cada serviço.
   - Anotações detalhadas sobre as decisões de configuração e ajustes realizados durante o projeto.

6. **Apresentação**
   - Comunicação efetiva do projeto, destacando escolhas de design, implementação e resultados dos testes.

**FERRAMENTAS UTILIZADAS**

**Linux:**
O ambiente de rede é baseado em tecnologia Linux, indicando que os servidores e serviços serão configurados em sistemas operacionais Linux.

**Vagrant:**
Utilizado para criar máquinas virtuais, permitindo a replicação do ambiente de rede de maneira rápida e consistente.

**Docker:**
Empregado para implantar aplicativos em contêineres. Oferece uma abordagem leve e eficiente para garantir a portabilidade e consistência dos serviços.

**DHCP (Dynamic Host Configuration Protocol):**
Implementado como um serviço para atribuição dinâmica de endereços IP na Sub-Rede 1.

**DNS (Domain Name System):**
Configurado como um serviço para a resolução de nomes de domínio internos, incluindo a configuração de registros DNS como A, CNAME, MX, etc.

**Servidor Web (Apache ou Nginx):**
Escolhido entre Apache ou Nginx para hospedar sites internos, com configuração específica para diretórios de hospedagem e virtual hosts.

**FTP (vsftpd):**
Implementado como um serviço FTP para permitir a transferência de arquivos na rede, com foco em segurança e definição de diretórios permitidos.

**NFS (Network File System):**
Configurado como um serviço para compartilhar diretórios e arquivos entre máquinas na rede, com definição de configurações de exportação de diretórios e permissões.

Essas tecnologias foram escolhidas para criar um ambiente Linux eficiente, automatizado e altamente funcional, conforme as exigências do projeto. O uso de Vagrant e Docker também facilita a replicação do ambiente em diferentes cenários, garantindo consistência e facilitando o gerenciamento do projeto.

### 2. Topologia de Rede

**Descrição Geral da Topologia**
 A topologia de rede utilizada no projeto foi a topologia estrela, onde dentro da rede 
**Segmentação de Sub-redes**
   - Sub-rede para DHCP
   - Sub-rede para DNS
   - Sub-rede para Web
   - Sub-rede para FTP
   - Sub-rede para NFS

### 4. Serviços Implementados

#### DHCP:

- Configuração da VM DHCP
- Detalhes da Implementação
- Testes Realizados e Resultados

#### DNS:

- Configuração da VM DNS
- Detalhes da Implementação
- Testes Realizados e Resultados

#### Web:

- Configuração da VM Web
- Detalhes da Implementação
- Testes Realizados e Resultados

#### FTP:

- Configuração da VM FTP
- Detalhes da Implementação
- Testes Realizados e Resultados

#### NFS:

- Configuração da VM NFS (Servidor)
- Detalhes da Implementação
- Testes Realizados e Resultados

### 5. Ferramentas Utilizadas

#### Vagrant

**VM DHCP:**
- Box: ubuntu/focal64
- Configuração do servidor DHCP usando Docker e a imagem networkboot/dhcpd.
- Copia um arquivo de configuração dhcpd.conf para o diretório temporário /tmp e inicia um contêiner Docker usando esse arquivo.

**VM DNS:**
- Box: ubuntu/focal64
- Instala e configura o BIND9 para atuar como um servidor DNS.
- Define uma zona DNS para "example.com" e cria um arquivo de zona correspondente.

**VM WEB:**
- Box: ubuntu/focal64
- Instala e configura o Apache2.
- Cria uma página HTML simples para testar o servidor web.

**VM FTP:**
- Box: ubuntu/focal64
- Configura um servidor FTP usando Docker e a imagem fauria/vsftpd.
- Mapeia portas para o FTP (21, 2121, 20000, 20001) e monta o diretório /vagrant/ftp no contêiner.

**VM NFS (Servidor):**
- Box: ubuntu/focal64
- Configura um servidor NFS (Network File System).

#### Docker

**Imagens Docker Utilizadas**  
**Comandos Docker Utilizados**

### 6. Testes Extensivos

**VM DHCP:**
- Acesse a VM DHCP com vagrant ssh dhcp.
- Execute sudo docker logs dhcp para verificar os logs do contêiner DHCP.
- Verifique se as configurações do DHCP estão corretas no arquivo dhcpd.conf e se o contêiner DHCP está em execução.

**VM DNS:**
- Acesse a VM DNS com vagrant ssh dns.
- Execute sudo systemctl status bind9 para verificar o status do serviço BIND9.
- Verifique os logs do BIND9 em /var/log/syslog ou /var/log/bind/ para mensagens de erro ou informações.

**VM WEB (Apache):**
- Acesse a VM WEB com vagrant ssh web.
- Execute sudo systemctl status apache2 para verificar o status do serviço Apache.
- Abra um navegador e acesse http://localhost:8080 para verificar se a página "Hello from Apache on Vagrant!" está sendo exibida.

**VM FTP:**
- Acesse a VM FTP com vagrant ssh ftp.
- Execute sudo docker logs ftp para verificar os logs do contêiner FTP.
- Use um cliente FTP (por exemplo, FileZilla) para se conectar ao servidor FTP na máquina host usando as portas 2121, 21, 20000 e 20001.

**VM NFS (Servidor):**
- Acesse a VM NFS com vagrant ssh nfs.
- Execute sudo systemctl status nfs-kernel-server para verificar o status do serviço NFS.
- Execute showmount -e localhost para verificar se há compartilhamentos NFS configurados.

### 7. Git Repository

**Estrutura do Repositorio:**
    ```markdown
# Projeto Final de Administração de Redes de Computadores

**Valor:** 6,5 Pontos  
**Documentação:** 4,5 Pontos  
**Apresentação:** 2 Pontos  
**Tipo:** Dupla  

## Projeto Final

### Descrição do Trabalho

Neste projeto, você se concentrará em projetar, implantar e gerenciar uma rede empresarial usando tecnologia Linux, com ênfase em serviços como DHCP, DNS, Web, FTP, NFS e virtualização com Vagrant e Docker.

#### Etapa 01 - Estrutura Documental

**Data da Entrega:** 23/11/2023  
**Valor:** 2 Pontos  

Crie um projeto de rede, escrito, que inclua a topologia de rede, a segmentação de sub-redes e os requisitos de cada serviço a ser implementado. Use o Vagrant para criar máquinas virtuais e o Docker para implantar aplicativos em contêineres. Realize testes extensivos em cada serviço configurado, verificando a funcionalidade e a integração da rede. Documente detalhadamente, no GIT, todo o processo de configuração, incluindo scripts de configuração e anotações de configuração. A documentação deve incluir a descrição da rede, configurações e resultados dos testes.

#### Etapa 02 - Implementação

**Data da Entrega:** 30/11/2023 em diante

1. Configure um servidor DHCP no ambiente Linux para atribuir endereços IP automaticamente aos dispositivos na rede.  
   **Valor:** 1 Ponto

2. Implante um servidor DNS para resolver nomes de domínio dentro da rede e configurar registros DNS como A, CNAME, MX, etc.  
   **Valor:** 1 Ponto

3. Configure e hospede um servidor web Apache ou Nginx para fornecer serviços de hospedagem de sites internos.  
   **Valor:** 1 Ponto

4. Implemente um servidor FTP (por exemplo, vsftpd) para permitir a transferência de arquivos na rede.  
   **Valor:** 0,5 Ponto

5. Configure um servidor NFS para compartilhar diretórios e arquivos entre máquinas na rede.  
   **Valor:** 1 Ponto

---

## Projeto de Rede Empresarial - Documentação

### 1. Introdução

**OBJETIVO:**  
O objetivo deste projeto é capacitar os participantes a projetar, implementar e gerenciar uma rede empresarial eficiente, utilizando tecnologias Linux e serviços essenciais. A ênfase na automação (Vagrant e Docker) e nos testes extensivos visa garantir uma implementação robusta e funcional dos serviços propostos, contribuindo para a formação prática em administração de redes de computadores.

**ESCOPO:**  
O escopo deste projeto abrange o design, implementação e gerenciamento de uma rede empresarial utilizando tecnologia Linux. Os principais elementos incluídos no escopo são:

1. **Design da Rede**
   - **Topologia de Rede:** Definição da estrutura física e lógica da rede, identificando dispositivos como roteador, switches e servidores.
   - **Segmentação de Sub-Redes:** Divisão da rede em sub-redes para organização e segurança, incluindo Sub-Rede 1 (dispositivos), Sub-Rede 2 (servidores DNS, Web, FTP) e Sub-Rede 3 (NFS).

2. **Serviços a serem Implementados**
   2.1. **Servidor DHCP**
      - Atribuição dinâmica de endereços IP para dispositivos na Sub-Rede 1.
      - Configuração da faixa de IP, tempo de concessão e outras configurações relacionadas.

   2.2. **Servidor DNS**
      - Resolução de nomes de domínio internos.
      - Configuração de registros DNS, como A, CNAME, MX, etc.
      - Configuração de zonas DNS conforme necessário.

   2.3. **Servidor Web (Apache ou Nginx)**
      - Hospedagem de sites internos.
      - Configuração do servidor web escolhido.
      - Definição de diretórios de hospedagem e configuração de virtual hosts.

   2.4. **Servidor FTP (vsftpd)**
      - Transferência de arquivos na rede.
      - Configuração do servidor FTP com foco em segurança.
      - Definição de diretórios permitidos para transferência.

   2.5. **Servidor NFS**
      - Compartilhamento de diretórios e arquivos entre máquinas na rede.
      - Configuração do servidor NFS.
      - Definição de configurações de exportação de diretórios e permissões.

3. **Implementação**
   - Utilização do Vagrant para criar máquinas virtuais representando cada servidor.
   - Utilização do Docker para implantar aplicativos em contêineres, conforme aplicável.

4. **Testes Extensivos**
   - Realização de testes de funcionalidade para cada serviço configurado.
   - Realização de testes de integração para garantir a comunicação eficiente entre os serviços.

5. **Documentação no GIT**
   - Criação de um repositório GIT contendo toda a documentação do processo.
   - Inclusão de scripts de configuração para cada serviço.
   - Anotações detalhadas sobre as decisões de configuração e ajustes realizados durante o projeto.

6. **Apresentação**
   - Comunicação efetiva do projeto, destacando escolhas de design, implementação e resultados dos testes.

**Linux:**
O ambiente de rede é baseado em tecnologia Linux, indicando que os servidores e serviços serão configurados em sistemas operacionais Linux.

**Vagrant:**
Utilizado para criar máquinas virtuais, permitindo a replicação do ambiente de rede de maneira rápida e consistente.

**Docker:**
Empregado para implantar aplicativos em contêineres. Oferece uma abordagem leve e eficiente para garantir a portabilidade e consistência dos serviços.

**DHCP (Dynamic Host Configuration Protocol):**
Implementado como um serviço para atribuição dinâmica de endereços IP na Sub-Rede 1.

**DNS (Domain Name System):**
Configurado como um serviço para a resolução de nomes de domínio internos, incluindo a configuração de registros DNS como A, CNAME, MX, etc.

**Servidor Web (Apache ou Nginx):**
Escolhido entre Apache ou Nginx para hospedar sites internos, com configuração específica para diretórios de hospedagem e virtual hosts.

**FTP (vsftpd):

**
Implementado como um serviço FTP para permitir a transferência de arquivos na rede, com foco em segurança e definição de diretórios permitidos.

**NFS (Network File System):**
Configurado como um serviço para compartilhar diretórios e arquivos entre máquinas na rede, com definição de configurações de exportação de diretórios e permissões.

Essas tecnologias foram escolhidas para criar um ambiente Linux eficiente, automatizado e altamente funcional, conforme as exigências do projeto. O uso de Vagrant e Docker também facilita a replicação do ambiente em diferentes cenários, garantindo consistência e facilitando o gerenciamento do projeto.

### 2. Topologia de Rede

**Descrição Geral da Topologia**
A topologia utilizada foi a topologia estrela, onde a VM DHCP foi utilizada como centro para atribuir o ip para todas as maquinas da rede, sendo assim todas as maquinas estão ligadas a ela.
**Segmentação de Sub-redes**
   - Sub-rede para DHCP
   - Sub-rede para DNS
   - Sub-rede para Web
   - Sub-rede para FTP
   - Sub-rede para NFS

### 3. Implementação
Para implementação do projeto basta clonar este repositório, e dentro da pasta do repositorio usando o terminal executar o seguinte comando:
```bash
vagrant up
```
Dessa forma construindo e provisionando todad as maquinas virtuais de uma vez só. Em alguns caso pode ocorrer de não haver o provisionamento e necessitar que execute manualmente execcutando a linha de comando abaixo:
```bash
Vagrant provision
```
Assim, provisionando todas as maquinas.

Após isso, para acessar as vm's criadas é necessáio a execução do comando:
```bash
    vagrant ssh <nome da vm>
```


### 4. Serviços Implementados

#### DHCP:

- Configuração da VM DHCP
- Detalhes da Implementação
- Testes Realizados e Resultados

#### DNS:

- Configuração da VM DNS
- Detalhes da Implementação
- Testes Realizados e Resultados

#### Web:

- Configuração da VM Web
- Detalhes da Implementação
- Testes Realizados e Resultados

#### FTP:

- Configuração da VM FTP
- Detalhes da Implementação
- Testes Realizados e Resultados

#### NFS:

- Configuração da VM NFS (Servidor)
- Detalhes da Implementação
- Testes Realizados e Resultados

### 5. Ferramentas Utilizadas

#### Vagrant

**VM DHCP:**
- Box: ubuntu/focal64
- Configuração do servidor DHCP usando Docker e a imagem networkboot/dhcpd.
- Copia um arquivo de configuração dhcpd.conf para o diretório temporário /tmp e inicia um contêiner Docker usando esse arquivo.

**VM DNS:**
- Box: ubuntu/focal64
- Instala e configura o BIND9 para atuar como um servidor DNS.
- Define uma zona DNS para "example.com" e cria um arquivo de zona correspondente.

**VM WEB:**
- Box: ubuntu/focal64
- Instala e configura o Apache2.
- Cria uma página HTML simples para testar o servidor web.

**VM FTP:**
- Box: ubuntu/focal64
- Configura um servidor FTP usando Docker e a imagem fauria/vsftpd.
- Mapeia portas para o FTP (21, 2121, 20000, 20001) e monta o diretório /vagrant/ftp no contêiner.

**VM NFS (Servidor):**
- Box: ubuntu/focal64
- Configura um servidor NFS (Network File System).

#### Docker

**Imagens Docker Utilizadas:**

[networkboot/dhcpd](https://hub.docker.com/r/networkboot/dhcpd)

[fauria/vsftpd](https://hub.docker.com/r/fauria/vsftpd)

**Comandos Docker Utilizados:**

```bash
 sudo docker stop <nome do container>
 sudo docker rm <nome do container>

```
Sendo estes utlizados para parar o container e excluir o container, evitando assim algum erro caso haja algum container com o mesmo nome do serviço que irá rodar pelo Docker.

```bash
 sudo docker run -d --name dhcp --network host -v /tmp:/data networkboot/dhcpd
 sudo docker run -d --name ftp -p 2121:21 -v /vagrant/ftp:/home/vsftpd --restart always fauria/vsftpd

```
Foram usadas também na VM DHCP e FTP respectivamente os codigos docker acima, para que o container fosse criado e já direcioando aos seus locais para que funcionassem bem, para as configurações das maquinas.

### 6. Testes Extensivos

**VM DHCP:**
- Acesse a VM DHCP com vagrant ssh dhcp.
- Execute sudo docker logs dhcp para verificar os logs do contêiner DHCP.
- Verifique se as configurações do DHCP estão corretas no arquivo dhcpd.conf e se o contêiner DHCP está em execução.

**VM DNS:**
- Acesse a VM DNS com vagrant ssh dns.
- Execute sudo systemctl status bind9 para verificar o status do serviço BIND9.
- Verifique os logs do BIND9 em /var/log/syslog ou /var/log/bind/ para mensagens de erro ou informações.

**VM WEB (Apache):**
- Acesse a VM WEB com vagrant ssh web.
- Execute sudo systemctl status apache2 para verificar o status do serviço Apache.
- Abra um navegador e acesse http://localhost:8080 para verificar se a página "Hello from Apache on Vagrant!" está sendo exibida.

**VM FTP:**
- Acesse a VM FTP com vagrant ssh ftp.
- Execute sudo docker logs ftp para verificar os logs do contêiner FTP.
- Use um cliente FTP (por exemplo, FileZilla) para se conectar ao servidor FTP na máquina host usando as portas 2121, 21, 20000 e 20001.

**VM NFS (Servidor):**
- Acesse a VM NFS com vagrant ssh nfs.
- Execute sudo systemctl status nfs-kernel-server para verificar o status do serviço NFS.
- Execute showmount -e localhost para verificar se há compartilhamentos NFS configurados.

### 7. Git Repository

**Estrutura do Repositorio:**
```
projetofinalAdmRedes
│
├── Vagrantfile
├── README.md
├── dhcpd.conf
```

**Scripts:**
[Arquivo de configurações das VM's](https://github.com/isaqwe/projetofinalAdmRedes/blob/main/Vagrantfile)  
O processo de configuração das VM's foi comentado no proprio arquivo de configuração com fins de facilitar a compreensão do usário demonstrar interesse no projeto, e também para facilitar a possivel alteração de fucncionalidaade das maquinas.

### 8. Conclusão

**Sumário dos Principais Resultados**  
**Desafios Enfrentados e Soluções Adotadas**
    Os principais desafios enfrentados se deu construção das maquinas com o Docker, onde houve dificuldade para selecionar e fazer com que a VM conseguisse executar o Docker e fornececer determinado serviço. Na resolução dessas dificuldades foi utilizado a documentação oficial do docker e das imagens utilizadas atráves do Dockerhub, juntamente com do vagrant afim de obter uma forma mais clara para saber como as VM's deveriam se comportar diante de cada configuração. 

### 9. Referências

- [Vagrant Documentation](https://developer.hashicorp.com/vagrant/docs)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Hub](https://hub.docker.com/)
- [VirtualBox Documentation](https://www.virtualbox.org/wiki/Documentation)
