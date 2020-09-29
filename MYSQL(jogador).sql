-- criando banco de dados
create database if not exists db_jogador;

-- ativando db
use db_jogador;

-- criando tabelas

create table if not exists tbl_time(
cod_time int auto_increment primary key,
nome varchar(40) not null,
numero_socios smallint not null
);

create table if not exists tbl_jogador(
matricula int auto_increment primary key,
nome varchar(40) not null,
cpf varchar(14) not null unique,
cod_time int not null,
constraint fk_jogador_time foreign key (cod_time) references tbl_time (cod_time)
);

create table if not exists tbl_telefone(
cod integer auto_increment primary key,
numero varchar(40),
matricula int not null,
constraint fk_telefone_jogador foreign key (matricula) references tbl_jogador (matricula)
);

-- inserindo dados
insert into tbl_time(nome,numero_socios) 
values ('ziketas',31),('São Paulo',10000),
('Palmeiras',2000);

insert into tbl_jogador(nome,cpf,cod_time)
values ('pedro cobucci','111.222.333-44',1),
('cristiano ronaldo', '111.222.333-45',2),
('rony','111.222.333-46',3),
('gabriel jesus','111.222.333-47',2),
('lionel messi','111.222.333-48',1);

insert into tbl_telefone(numero,matricula)
values('999991234',5),('992231211',3),
('928282889',4),('964537321',3),('543675842',5),
('654738922',1),('345245678',1);

select * from tbl_jogador;

/* 1- imprima todos os dados dos jogadores do 
Palmeiras
2- imprima todos os nomes dos jogadores com seus
respectivos telefones
3- Imprima os nomes dos times com seus respectivos
jogadores
4- imprima os nomes dos times com seus jogadores 
e seus respectivos telefones  
5- imprima os nomes dos jogadores do São Paulo
6- imprima os nomes dos jogadores do Ziketas
ordenando pelo nome do jogador
7- imprimir o número de jogadores do Ziketas
8- imprimir o nome do time e seus sócios
9- imprimir o nome dos jogadores com os números
de sócios */

#1 Imprima todos os dados dos jogadores do Palmeiras. (OK)

select nome, cpf, cod_time, numero from tbl_jogador 
inner join tbl_telefone on tbl_jogador.matricula=tbl_telefone.matricula where cod_time=3;


#2 Imprima todos os nomes dos jogadores com seus respectivos telefones. (OK)

select tbl_jogador.nome, tbl_time.numero_socios from tbl_jogador
inner join tbl_time on tbl_jogador.cod_time = tbl_time.cod_time;

#3 Imprima os nomes dos times com seus respectivos jogadores. (OK)

select tbl_time.nome, tbl_jogador.nome from tbl_time
inner join tbl_jogador on tbl_time.cod_time = tbl_jogador.cod_time;

#4- Imprima os nomes dos times com seus jogadores e seus respectivos telefones. (OK)

select tbl_time.nome, tbl_jogador.nome, tbl_telefone.numero from tbl_time
inner join tbl_jogador on tbl_time.cod_time = tbl_jogador.cod_time 
inner join tbl_telefone on tbl_jogador.matricula = tbl_telefone.matricula;

#5- imprima os nomes dos jogadores do São Paulo. (OK)

select nome, cpf, cod_time, numero from tbl_jogador 
inner join tbl_telefone on tbl_jogador.matricula=tbl_telefone.matricula where cod_time=2;

#6- imprima os nomes dos jogadores do Ziketas ordenando pelo nome do jogador. (OK)

select nome from tbl_jogador
where cod_time=1 order by nome;

#7- imprimir o número de jogadores do Ziketas. (OK)

select count(matricula) from tbl_jogador where cod_time= 1;

#8- imprimir o nome do time e seus sócios. (OK)

select tbl_time.nome, tbl_time.numero_socios from tbl_time;

#9- imprimir o nome dos jogadores com os números de sócios. (OK)

select tbl_jogador.nome, tbl_time.numero_socios from tbl_jogador
inner join tbl_time on tbl_jogador.cod_time = tbl_time.cod_time;