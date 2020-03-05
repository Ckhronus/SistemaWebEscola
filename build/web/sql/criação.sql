drop database escola;
create database escola;
use escola;

create table usuario(
    id int auto_increment primary key,
    nome varchar(45) not null,
    email varchar(45) not null,
    senha varchar(16) not null,
    tipo int not null
);

create table apostila(
    id int primary key auto_increment,
    nome varchar(45) not null,
    quantidade int not null
);

create table apostila_aluno(
    id int primary key auto_increment,
    id_apostila int not null,
    bloqueada boolean not null DEFAULT true,
    id_apostila_aluno int not null,
    CONSTRAINT fk_apostila FOREIGN KEY (id_apostila)
		REFERENCES apostila (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
    CONSTRAINT fk_apostila_aluno FOREIGN KEY (id_apostila_aluno)
		REFERENCES usuario (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

create table parcela(
    id int primary key auto_increment,
    valor double(7,2) not null,
    vencimento date not null,
    pago boolean default false,
    data_pagamento date,
    id_aluno_parcela int,    
    CONSTRAINT fk_aluno_parcela FOREIGN KEY (id_aluno_parcela)
		REFERENCES usuario (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

create table qtd_parcelas_abertas(
    id int primary key auto_increment,
    total int
);

create table curso(
    id int auto_increment primary key,
    nome varchar(45) not null,
    qtd_aulas int not null
);

create table aula(
	id int auto_increment primary key,
	id_curso int not null,
	id_aluno_aula int not null,
	CONSTRAINT fk_id_curso FOREIGN KEY (id_curso)
		REFERENCES curso (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE,
	CONSTRAINT fk_aluno_aula FOREIGN KEY (id_aluno_aula)
		REFERENCES usuario (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);

create table faltas(
    id int auto_increment primary key,
    faltas int not null,
    data_falta date not null,
    id_aluno_faltas int not null,
    CONSTRAINT fk_aluno_faltas FOREIGN KEY (id_aluno_faltas)
		REFERENCES usuario (id)
                ON DELETE CASCADE
                ON UPDATE CASCADE
);