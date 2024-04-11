create database db_acme_filmes_turma_ba;

use db_acme_filmes_turma_ba;

create table tbl_filme (
   id int not null auto_increment primary key,
   nome varchar(80) not null,
   sinopse text not null,
   duracao time not null,
   data_lancamento date not null,
   data_relancamento date,
   foto_capa varchar(200) not null,
   valor_unitario float ,
   classificacao_id integer not null,
   constraint fk_filme_classificacao
   foreign key(classificacao_id) references tbl_classificacao(id),
   
   unique key (id),
   unique index(id)
);

create table tbl_genero (
     id int not null auto_increment primary key,
     nome varchar(80) not null,
	 unique key (id)
);

create table tbl_filme_genero(
    id int not null auto_increment primary key,
    filme_id integer,
    genero_id integer,
    constraint fk_filme_filmeGenero
    foreign key (filme_id) references tbl_filme(id),
    constraint fk_genero_filmeGenero
    foreign key (genero_id) references tbl_genero(id),
     unique key (id),
     unique index(id)
);



create table tbl_classificacao (
	id int not null auto_increment primary key,
    faixa_etaria varchar(45) not null,
    classifiacao varchar(45) not null,
    caracteristicas varchar(100) not null,
    icone varchar(45) not null,
	unique key (id)
    
);

create table tbl_ator(
    id int not null auto_increment primary key,
    nome varchar(100) not null,
    nome_artistico varchar(100) not null,
    data_nascimento date not null,
    data_falecimento date,
    biogrfia text not null,
    foto_ator varchar (200) not null,
    sexo_id integer,
    constraint fk_sexo_ator
    foreign key (sexo_id) references tbl_sexo(id),
     unique key (id),
     unique index(id)
);

create table tbl_ator_filme(
   id int not null auto_increment primary key,
   ator_id integer,
   filme_id integer,
   constraint fk_ator_atorFilme
   foreign key (ator_id) references tbl_ator (id),
   constraint fk_filme_atorFilme
   foreign key (filme_id) references tbl_filme (id),
    unique key (id),
    unique index(id),
    unique index(id)
);

create table tbl_diretor (
    id int not null auto_increment primary key,
    nome varchar(100) not null,
	data_nascimento date not null,
    data_falecimento date,
    biogrfia text not null,
    foto_diretor varchar (200) not null,
    sexo_id integer,
    constraint fk_sexo_diretor
    foreign key (sexo_id) references tbl_sexo(id),
	unique key (id),
    unique index(id)
    
);

create table tbl_diretor_nacionalidade (
    id int not null auto_increment primary key,
    diretor_id integer,
    nacionalidade_id integer,
    constraint fk_diretor_diretorNacionalidade
    foreign key (diretor_id) references tbl_diretor(id),
    constraint fk_nacionalidade_diretorNacionalidade
    foreign key(nacionalidade_id) references tbl_nacionalidade(id),
     unique key (id),
     unique index(id)
);

create table tbl_sexo(
     id int not null auto_increment primary key,
     sigle varchar(2),
     nome varchar(45),
      unique key (id)
);

create table tbl_nacionalidade(
     id int not null auto_increment primary key,
     nome varchar(45),
      unique key (id)
);

create table tbl_ator_nacionalidade(
     id int not null auto_increment primary key,
     ator_id integer,
     nacionalidade_id integer,

     constraint fk_ator_atorNacionalidade
     foreign key (ator_id) references tbl_ator(id),
     constraint fk_nacionalidade_atorNacionalidade
     foreign key (nacionalidade_id) references tbl_nacionalidade(id),
      unique key (id),
      unique index(id)
);




show tables;

desc tbl_filme;

insert into tbl_filme (
                       nome,
                       sinopse,
                       duracao,
                       data_lancamento,
                       data_relancamento,
                       foto_capa,
                       valor_unitario) values
          
                    
                    (
                    'Divertida Mente',
                    'Com a mudança para uma nova cidade, as emoções de Riley, que tem apenas 11 anos de idade, ficam extremamente agitadas',
                    '02:10:00',
                    '2019-04-26',
                    null,
                    'https://colorindonuvens.com/wp-content/uploads/2015/06/divertidamentebanner.jpg',
                    '29.99'),
                    (
                    'Todos menos você',
                    'Bea e Ben têm um primeiro encontro incrível, mas a atração inicial logo se torna ódio mútuo',
                    '01:00:00',
                    '2024-05-15',
                    null,
                    'https://www.sonypictures.com.br/sites/brazil/files/tittle-page/thumbnails/TMV_banners_576x313.png',
                    '29.99');
                 
                   
                    update tbl_filme set
                    id= '10',
                    nome='Cartas para Julieta',
                    sinopse='Em visita à cidade italiana de Verona com seu noivo ocupado, uma jovem chamada Sophie ',
                    duracao='02:17:00',
                    data_lancamento='2009-03-14',
                    data_relancamento= null,
                    foto_capa='https://occ-0-2794-2219.1.nflxso.net/dnm/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABTxbkMg1clAH57lnW2bcyZsXY8_N8ED_m8a4Ht6TWwkyfRU7pP2XuPpYXEmgS9PlCv3VAs7uanMNj_uePnDgcF2tOv-3Yp_2l_Hh.jpg?r=953',
                    valor_unitario='29.99'
                    where tbl_filme.id = 10
                    ;
                    
                    drop table tbl_filme;
                    
                    
                   delete from tbl_filme where id = 6;
                   
                    show tables;
                   
                    select * from tbl_filme;
                    
                    
                     #adicionar uma nova coluna na tabela
                     #alter table tbl_filme 
                     #add column sinopse text not null;
                    
                    
                    
                     #exclui a coluna de uma tabela
                     #alter table tbl_filme
					 #drop column sinopse;
                     
                     
                     
                     
                     #modifica a estrutura de uma coluna
                     #alter table tbl_filme
					 #modify column sinopse varchar(100);
                      
                      
                      
					 #permite renomear e alterar os tipos de dados     
					 #alter table tbl_filme
					 #change column sinopse sinopse_filme varchar (100)
                     
                     
                     
                     
                     #Permite apagar a constraint de uma tabela
                     alter table tbl_filme
                     drop foreign key fk_filme_filmeGenero
                     
                    
                     #alter table tbl_filme_ator
                      # add constraint FK_FILME_FILMEATOR
                      # foreign key (id_filme)
                      # references tbl_filme;
                      
                      
                      #renomeia o nome da tabela
                      #rename table tbl_filme to tlb_filmes;
                      
                      alter table tbl_filme
                       modify column classificacao_id integer not null;
                      
                    
                    

                    