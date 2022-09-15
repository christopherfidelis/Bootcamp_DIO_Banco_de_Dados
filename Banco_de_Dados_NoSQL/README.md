Observação: Repositório criado para o Desafio de Projeto do bootcamp Database Experience da DIO

# Bancos de Dados Relacionais (SQL) e Não Relacionais (NoSQL) - Conceitos, definições e insights

### O que é um Banco de Dados?

Um banco de dados é uma coleção de dados relacionados. Com dados, quero dizer fatos conhecidos que podem ser registrados e possuem significado implícito.

### O que é um Sistema Gerenciador de Banco de dados (SGBD)?

Data Base Management System (DBMS) ou Sistema de Gerenciamento de Banco de Dados (SGBD) é um conjunto de software utilizado para o gerenciamento de uma base de dados, responsáveis por controlar, acessar, organizar e proteger as informações de uma aplicação, tendo como principal objetivo gerenciar as bases de dados utilizadas por aplicações clientes e remover esta responsabilidade das mesmas.

### Banco de Dados Relacional – Definição

Um banco de dados relacional é uma coleção de itens de dados com relacionamentos predefinidos entre si. Esses itens são organizados como um conjunto de tabelas com colunas e linhas. As tabelas são usadas para reter informações sobre os objetos a seremrepresentados no banco de dados. Cada coluna da tabela retém um determinado tipo de dado e um campo armazena o valor em si de um atributo. As linhas na tabela representam uma coleção de valores relacionados de um objeto ou de uma entidade. Cada linha em uma tabela pode ser marcada com um único identificador chamado de chave primária. Já as linhas entre as várias tabelas podem ser associadas usando chaves estrangeiras. Esses dados podem ser acessados de várias maneiras diferentes sem reorganizar as próprias tabelas do banco dedados.

#### Os principais SGBDs relacionais:

* **MySQL:**  É um sistema de gerenciamento de banco de dados que utiliza a linguagem SQL como interface. Lançado sobre a licença GPL, atualmente é mantida pela Oracle Corporation. É multiplataforma, ou seja, possui suporte para diferentes sistemas operacionais (Windows, Linux e Mac);
  
* **OracleDB:** O mais utilizado em aplicações corporativas, o OracleDB é o SGBD comercializado pela Oracle Corporation, lançado em meados dos anos 70. É multiplataforma e possui licença comercial.
  
* **SQLServe:** Desenvolvido pela Microsoft,o Microsoft SQL Server é o Sistema de Gerenciamento de Banco de Dados desenvolvido para os sistemas operacionais Windows e Linux.
  
* **MariaDB:** Lançado em 2009, o MariaBD é um SGBD multiplataforma sobre a licença GNU GPL (Licença pública geral). Surgiu tendo como base o MySQL, desenvolvido também pelo seu próprio fundador.
  
* **PostgreSQL:** Open Source, sob a licença BSD e multiplataforma, o PostegreSQL é um dos SGBDs mais avançados do mercado.
  
  Observação: [Rank dos SGBDs mais utilizados](https://db-engines.com/en/ranking)
  

### O que é Structured Query Language (SQL)?

SQL ou Structured Query Language (Linguagem de Consulta Estruturada) é uma linguagem padrão de gerenciamento de dados que interage com os principais bancos de dados baseado sno modelo relacional. O SQL é responsável por realizar consultas e manipulações em banco de dados. Sendo assim, a partir dos comandos SQL, os desenvolvedores passam a ter uma comunicação com o banco de dados de maneira mais ágil e simples.

A linguagem SQL é dividida em subconjuntos, que são comandos que permitem a escrita de códigos que irão criar novas estruturas como tabelas, índices, visões, entre outros, permitindo que dados sejam inseridos ou modificados para consultas posteriores,os principais subconjuntos são:

* **DQL ou Data Query Language** responsável pelo comando *SELECT*;
  
* **DDL ou Data Definition Language** (Linguagem de Definição de dados): Composto por três comandos: *CREATE, ALTER e DROP*;
  
* **DML ou Data Manipulation Language** (Linguagem de Manipulação de Dados), composto pelos comandos: *INSERT, UPDATE e DELETE.*
  

     #### Os principais comandos SQL são:

            **SELECT:** responsável por realizar consultas aos dados que pertencem a uma determinada tabela;

            **CREATE DATABASE:** responsável pela criação de um novo banco de dados vazio;

            **CREATE TABLE:** irá criar uma nova tabela;

            **ALTER:** comando utilizado para alterar uma tabela ou um banco de dados já existente;

            **DROP:** utilizado para remoção de uma tabela ou do banco de dados por completo;

            **INSERT:** comando utilizado para inserir dados a uma ou mais tabela de um banco de dados;

            **UPDATE**: comando utilizado para atualizar os dados de uma ou mais tabelas;

            **DELETE:** como seu próprio significado já diz, utilizaremos para excluir os dados de uma ou mais tabela em nosso banco de dados.

### O que é NoSQL?

NoSQL _(Not Only SQL)_ é o termo utilizado para banco de dados não relacionais de alto desempenho, onde geralmente não é utilizado o SQL como linguagem de consulta. O NoSQL foi criado para lidar com modelos de dados específicos e têm esquemas flexíveis para a criação de aplicativos modernos.

### Qual a diferença entre banco de dados relacional e não relacional?

Bancos de dados relacionais como MySQL e PostgreSQL representam e armazenam dados em tabelas. Eles são baseados em um ramo da teoria do conjunto algébrico conhecido como álgebra relacional. Bancos de dados não-relacionais como o MongoDB representam dados em coleções de documentos JSON.

Os banco de dados relacionais utilizam Linguagem de Consulta Estruturada (SQL), tornando-as uma boa escolha para aplicações que envolvem o gerenciamento de várias transações. A estrutura de um banco de dados relacional permite vincular informações de diferentes tabelas através do uso de chaves (ou índices) estrangeiras.

Se você estiver lidando com uma quantidade fenomenal de dados, a complexidade do banco de dados relacional e das queries necessárias também vai crescer na mesma proporção. Nessa situação, talvez você precise considerar a possibilidade de utilizar um banco de dados não relacional. Um banco de dados não relacional pode armazenar dados sem uma mecânica explícita e estruturada para vincular dados de diferentes tabelas uns aos outros.

   #### Tipos de Banco de Dados NoSQL

        No geral, temos quatro tipos de bancos de dados NoSQL:

1. **Documento:** No código do aplicativo, os dados costumam ser representados como um objeto ou um documento do tipo *JSON* porque esse é um modelo de dados eficiente e intuitivo para os desenvolvedores. Os bancos de dados de documentos facilitam para que os desenvolvedores armazenem e consultem dados usando o mesmo formato de modelo de documento que usam no código do aplicativo. A natureza flexível, semiestruturada e hierárquica dos documentos e dos bancos de dados de documentos permite que eles evoluam conforme as necessidades dos aplicativos. O modelo de documentos funciona bem com catálogos, perfis de usuários e sistemas de gerenciamento de conteúdo, onde cada documento é único e evolui com o passar do tempo. Um exemplo de banco de dados neste formato é o ***MongoDB***;
  
2. **Família de Colunas:** Os dados são armazenados em linhas particulares de tabela no disco, podendo suportar várias linhas e colunas. Também permitem sub-colunas. Um banco dedados dessa família, por exemplo, é o ***Cassandra***;
  
3. **Grafos:** Os dados são armazenados na forma de grafos (vértices e arestas). A finalidade de um banco de dados gráfico é facilitar a criação e a execução de aplicativos que funcionam com conjuntos de dados altamente conectados. Os casos típicos de uso de um banco de dados gráfico incluem redes sociais, mecanismos de recomendação e detecção de fraudes e gráficos. O ***Neo4j*** é um banco que utiliza grafos;
  
4. **Chave-valor:** Os bancos de dados de chave-valor são altamente particionáveis e permitem escalabilidade horizontal em escalas que outros tipos de bancos de dados não conseguem alcançar. Casos de uso, como jogos, tecnologia de publicidade e IoT, encaixam-se particularmente bem ao modelo de dados de chave-valor. Um exemplo é o banco de dados ***Redis***.
