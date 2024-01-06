
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
Caso queira, poderá rodar o HTML e o PHP separadamente, a pasta `/api/` é a única que necessita de PHP, se quiser pode colocar em outro servidor. Só lembre de alterar a variável `apiUrl` do arquivo script.js, e liberar o cors no `/api/.htaccess`



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


## Inteligencia de dados

- Para utilizar esses dados em pesquisas, siga essa estrutura para a exportação:
- tabela `pacientes` contém os Pacientes buildados com base no Form 1 (Cadastro de paciente)
- Onde `pacientes` tem `pacienteForm`, que conecta o paciente com o form respondido
- Onde `pacienteForm` tem `pacienteFormResposta` onde `cId` é conectado com os `campos` (por isso Não podemos excluir campos somente desativar)
- Em `pacienteFormResposta` temos duas colunas, a `resposta` que é a coluna completa e aceita textos longos. e a coluna `respostaSearchable` onde é o indice da resposta (os primeiros 32 caracteres). Foi feito dessa maneira para otimizar o algoritmo de indexação do banco de dados. Logo, se quiser buscar todos os pacientes o solteiros do Acre deve fazer:
```sql
select pacienteId from pacienteForm where 
 pFId in (select pFId from pacienteFormResposta where cId = (select cId from campos where fieldName = 'EstadoCivil') and respostaSearchable = 'Solteiro') and 
 pFId in (select pFId from pacienteFormResposta where cId = (select cId from campos where fieldName = 'Estado') and respostaSearchable = 'Acre') 
 group by pacienteId;
```

## Logs

- temos a tabela `logUsuarios` que indica oq o usuario fez, por isso é importante que cada medico tenha o seu usuario
- Temos logs de visualização de pacientes, pacientes que retornaram na busca. Visualização de formulário.
- Temos os dados de Ip e data de criação, e nos casos de login temos o UserAgent de login


## instalar em dispositivo android
#### Ainda requer conexão com o servidor para fazer alterações 
- Abra a o app no navegador do celular
- Clique nos 3 pontos de configurações (geralmente perto da URL)
- Clique em instalar aplicativo
![Instalar App Chrome](assets/print1.jpg?raw=true "Instalar App Chrome")




