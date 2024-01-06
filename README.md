
## Requisitos

- Apache
- MySQL (Pode ser MariaDB desde que seja acima da V5)
- PHP 8 ( Ou superior, desde que seja abaixo do PHP 9 _não lançado ainda_ )
- HTTPS CERT
  Como está lidando com informações sensíveis o apache precisa estar configurado e acessado via HTTPS, sugiro o uso do certbot.
  O Software tem algumas travas caso não esteja conectado via HTTPS.

## Instalação

Assumindo que todos os requisitos estão instalados e configurados.

- Baixe esse github como .zip
- Extraia o conteúdo para o caminho do apache (/var/www/html comumente)
- Importe o arquivo `banco.sql` no mysql
- Altere as duas primeiras linhas do arquivo `script.js`
```javascript
var systemUrl = 'https://tcc.zouli.work/';  
var apiUrl = 'https://tcc.zouli.work/api/';
```
Caso esteja usando apenas um domínio, pode seguir o padrão.
- Altere o arquivo `/api/config.php`
```php
  
$CFG['salt']='uMbY3xrTwDtVSLaJN2vRHs'; // salt para a criptografia de senhas. recomendavel: 32 chars  
$CFG['hostMysql']='localhost'; // host do mysql  
$CFG['userMysql']='zouli_tcc'; // user do mysql  
$CFG['passMysql']='123455'; // senha do mysql  
$CFG['db']='zouli_tcc'; // db do mysql  
$CFG['hostCookie']='tcc.zouli.work'; // dominio para o cookie de login  
$CFG['systemUrl']='https://tcc.zouli.work/'; // url base que está rodando o html
```
- Gere uma senha com base no seu salt. Acesse via navegador o php `/api/genPass.php`
  Escreva uma senha e pressione `enviar`. Deverá aparecer um hash acima do campo de texto.
  Copie esse hash e crie um novo usuário no banco de dados:
```sql
INSERT INTO `usuarios` (`userId`, `nome`, `email`, `senha`, `tipo`, `ativo`, `vistoPorUltimo`, `criadoEm`) VALUES (NULL, 'Meu nome real', 'meuemaildologin@example.com', 'HASHGERADOANTERIORMENTE', 'admin', '1', '2000-01-01 00:00:00.000000', CURRENT_TIMESTAMP);
```
- Caso mantenha o salt igual o da configuração, você pode testar a plataforma utilizando esse usuario: `ju@zouli.work` com a senha: `ju@zouli.work`
- Caso tudo dê certo, pode excluir o usuário `ju@zouli.work`
- Acesse a plataforma e tente cadastrar um paciente
- Após cadastrar um paciente acesse a listagem de pacientes, acesse os dados de um e tente preencher o formulário de pós cadastro
- Se der algum erro me contate em: `juliana@zouli.work`

###### adendo
Caso queira, poderá rodar o HTML e o PHP separadamente, a pasta `/api/` é a única que necessita de PHP, se quiser pode colocar em outro servidor. Só lembre de alterar a variável `apiUrl` do arquivo script.js 



## Criar um usuario

- Acesse via navegador o php `/api/genPass.php`
  Escreva uma senha e pressione `enviar`. Deverá aparecer um hash acima do campo de texto.
  Copie esse hash e crie um novo usuário no banco de dados:
```sql
INSERT INTO `usuarios` (`userId`, `nome`, `email`, `senha`, `tipo`, `ativo`, `vistoPorUltimo`, `criadoEm`) VALUES (NULL, 'Meu nome real', 'meuemaildologin@example.com', 'HASHGERADOANTERIORMENTE', 'comum', '1', '2000-01-01 00:00:00.000000', CURRENT_TIMESTAMP);
```

## atualizar um campo (alterações pequenas)

- Abra o Banco de dados, localize o campo na tabela campos
- Edite a cfg,label,row,col,colsize que desejar (Não altere nenhum outro campo)
- execute o PHP `/api/cachePages.php` (ele tenta salvar no `../paginas/`, então se for em outro servidor precisa se atentar a isso)


## atualizar/criar um campo (alterações grandes)

- Abra o Banco de dados, localize o campo modelo na tabela campos
- Clique em `copiar` (caso esteja usando o phpMyAdmin)
- Mude as informações necessarias, atente-se que não poderá manter o mesmo `fieldName` do outro campo e todos os `fieldName` são unicos
- Insira no banco de dados
- Caso esteja substituindo um campo, defina `ativo`=0 para o campo antigo
- execute o PHP `/api/cachePages.php` (ele tenta salvar no `../paginas/`, então se for em outro servidor precisa se atentar a isso) 








