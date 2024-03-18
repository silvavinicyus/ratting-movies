# Ratting Movies Backend

Esse projeto busca resolver um desafio de construção de um backend em ruby on rails, para criação de usuários, login, criação de filmes, avaliação de filmes, e criação em massa (via arquivo json) para filmes e avaliações

Requisitos

<table>
   <thead>
     <th> Requisitos </th>
     <th> versão </th>
     <th> instalação </th>
   </thead>
   <tbody>
     <tr>
       <td>
         Ruby
       </td>
       <td>
         3.3.0
       </td>
       <td>
         <a href="https://www.ruby-lang.org/pt/documentation//"> Instalação </a>
       </td>
     </tr>
     <tr>
       <td>
         Redis
       </td>
       <td>
         7.2.4
       </td>
       <td>
         <a href="https://redis.io/docs/install/install-redis/"> Install </a>
       </td>
     </tr>
      <tr>
       <td>
         Rails
       </td>
       <td>
         7.1.3.2
       </td>
       <td>
         <a href="https://guides.rubyonrails.org/v5.0/getting_started.html#installing-rails"> Install </a>
       </td>
     </tr>
   </tbody>
 </table>

 ### Features
 <ul>
   <li> Criação de usuário </li>
   <li> Login </li>
   <li> Criação de filme </li>
   <li> Criação de avaliação de filme  </li>
   <li> Atualização de avaliação de filme </li>
   <li> Criação de avaliações em massa </li>
   <li> Criação de filmes em massa </li>
 </ul>

 ### Install and run

 <li>
    Clone o presente repositório em seu computador

     git clone git@github.com:silvavinicyus/ratting-movies-backend.git    
 </li>

 <li>
    Instale as dependências do projeto

     bundle install    
 </li>
 
 <li>
    Execute as migrações do banco de dados com o comando

     rails db:migrate    
 </li>

 <li>
    Execute os seeds para criação do usuário padrão do sistema

     rails db:seed    
 </li>

 <li>
    Inicie o redis com o seguinte comando no terminal

     redis-server    
 </li>

 <li>
    Em um novo terminal inicie o sidekiq com o comando

    bundle exec sidekiq    
 </li>

 <li>
    Em um novo terminal inicie a api em ruby

    rails s    
 </li>


 ### Importação

 #### Filmes
 Para a importação dos filmes, o formato aceito é o de JSON, e o JSON deve seguir o seguinte padrão:  
 
    {
	   "movies": [
          {
              "title": "The Shawshank Redemption",
              "director": "Frank Darabont"
          },
          {
              "title": "The Godfather",
              "director": "Francis Ford Coppola"
          },
          ...
      ]
    }
  
### Avaliaçãoes de filmes
Para a importação das avaliações, o formato aceito também é o de JSON, e o JSON deve seguir o seguinte padrão:

    {
	   "user_movies": [
            {
                    "movie_id": 1,
   			"score": 5
   		},
   		{
   			"movie_id": 2,
   			"score": 7
   		},
   		{
   			"movie_id": 3,
   			"score": 3
   		},
   		{
   			"movie_id": 4,
   			"score": 8
   		},
         ...
      ]
    }

    
#### Arquivos prontos
Caso queira, há agora 2 arquivos na pasta "jsons" que contém exemplos de arquivos de importação para filmes (movies.json) e para notas (movies_scores.json)
