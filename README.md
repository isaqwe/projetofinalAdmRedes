#Projeto Final de Administração de Redes de Computadores
Valor: 6,5 Pontos
Documentação: 4,5 Pontos
Apresentação: 2 Pontos
Tipo: Dupla
Projeto Final

Descrição do Trabalho: Neste projeto, você se concentrará em projetar, implantar e gerenciar uma rede empresarial usando tecnologia Linux, com ênfase em serviços como DHCP, DNS, Web, FTP, NFS e virtualização com Vagrant e Docker.


Etapa 01 - Estrutura Documental
Data da Entrega: 23/11/2023
Valor: 2 Pontos


Crie um projeto de rede, escrito, que inclua a topologia de rede, a segmentação de sub-redes e os requisitos de cada serviço a ser implementado.
Use o Vagrant para criar máquinas virtuais e o Docker para implantar aplicativos em contêineres.
Realize testes extensivos em cada serviço configurado, verificando a funcionalidade e a integração da rede. Documente detalhadamente, no GIT, todo o processo de configuração, incluindo scripts de configuração e anotações de configuração. A documentação deve incluir a descrição da rede, configurações e resultados dos testes.
Etapa 02 - Implementação
Data da Entrega: 30/11/2023 em diante

Configure um servidor DHCP no ambiente Linux para atribuir endereços IP automaticamente aos dispositivos na rede. Valor: 1 Ponto


Implante um servidor DNS para resolver nomes de domínio dentro da rede e configurar registros DNS como A, CNAME, MX, etc. Valor: 1 Ponto


Configure e hospede um servidor web Apache ou Nginx para fornecer serviços de hospedagem de sites internos. Valor: 1 Ponto


Implemente um servidor FTP (por exemplo, vsftpd) para permitir a transferência de arquivos na rede. Valor: 0,5 Ponto


Configure um servidor NFS para compartilhar diretórios e arquivos entre máquinas na rede. Valor: 1 Ponto

# Teste
    VM DHCP:
        Acesse a VM DHCP com vagrant ssh dhcp.
        Execute sudo docker logs dhcp para verificar os logs do contêiner DHCP.
        Verifique se as configurações do DHCP estão corretas no arquivo dhcpd.conf e se o contêiner DHCP está em execução.

    VM DNS:
        Acesse a VM DNS com vagrant ssh dns.
        Execute sudo systemctl status bind9 para verificar o status do serviço BIND9.
        Verifique os logs do BIND9 em /var/log/syslog ou /var/log/bind/ para mensagens de erro ou informações.

    VM WEB (Apache):
        Acesse a VM WEB com vagrant ssh web.
        Execute sudo systemctl status apache2 para verificar o status do serviço Apache.
        Abra um navegador e acesse http://localhost:8080 para verificar se a página "Hello from Apache on Vagrant!" está sendo exibida.

    VM FTP:
        Acesse a VM FTP com vagrant ssh ftp.
        Execute sudo docker logs ftp para verificar os logs do contêiner FTP.
        Use um cliente FTP (por exemplo, FileZilla) para se conectar ao servidor FTP na máquina host usando as portas 2121, 21, 20000 e 20001.

    VM NFS (Servidor):
        Acesse a VM NFS com vagrant ssh nfs.
        Execute sudo systemctl status nfs-kernel-server para verificar o status do serviço NFS.
        Execute showmount -e localhost para verificar se há compartilhamentos NFS configurados.