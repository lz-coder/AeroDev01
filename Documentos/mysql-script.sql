create schema aerodevdb1;
use aerodevdb1;

create table Aviao(
    avi_id int primary key auto_increment,
    avi_nome varchar(30) not null,
    avi_assentos int not null
);

insert into Aviao
(avi_nome, avi_assentos)
values
('A-001', 100),
('As-001', 160),
('A-002', 200),
('As-002', 245),
('A-003', 270),
('As-003', 300);

create table Viagem(
	via_id int primary key auto_increment,
    via_origem varchar(30) not null,
    via_destino varchar(30) not null,
    via_preco decimal(5,2) not null,
    via_data date not null,
    aviaoID int not null,
    foreign key (aviaoID) references Aviao (avi_id)
);

insert into Viagem
(via_origem, via_destino, via_preco, via_data, aviaoID)
values
('SC', 'RS', 100.00, '2021-10-20', 3),
('RS', 'PR', 170.00, '2021-10-21', 5),
('RS', 'SC', 100.00, '2021-10-22', 2),
('PR', 'SC', 100.00, '2021-10-23', 6),
('PR', 'RS', 190.00, '2021-10-24', 5),
('SC', 'PR', 100.00, '2021-10-25', 5),
('SC', 'RS', 100.00, '2021-10-26', 4),
('RS', 'PR', 170.00, '2021-10-27', 3),
('RS', 'SC', 100.00, '2021-10-28', 6),
('PR', 'SC', 100.00, '2021-10-29', 2),
('PR', 'RS', 190.00, '2021-10-30', 5);

create table Passageiro(
    pas_cpf varchar(15) primary key,
    pas_nome varchar(50) not null,
    pas_sexo varchar(15) not null,
    pas_cidade varchar(50) not null
);

insert into Passageiro
(pas_cpf, pas_nome, pas_sexo, pas_cidade)
values
('0000000000', 'luan', 'masculino', 'Floripa');

create Table Funcionario(
	fun_cpf varchar(15) primary key,
	fun_nome varchar (50) not null ,
	fun_senha varchar(50) not null
);

insert into Funcionario
(fun_cpf, fun_nome, fun_senha)
values
('admin', 'Administrador', '1234');

create table Passagem(
	psgm_id int primary key auto_increment,
    psgm_NumeroAssento varchar(4) not null,
    passageiroID varchar(15),
    foreign key (passageiroID) references Passageiro(pas_cpf),
    funcionarioID varchar(15),
    foreign key (funcionarioID) references Funcionario(fun_cpf),
    viagemID int,
    foreign key (viagemID) references Viagem(via_id)
);
/*
insert into passagem
(psgm_numeroassento, passageiroID, funcionarioID, viagemID)
values
('0001', '123.132.123-11', '999.432.234-00', 1),
('0023', '123.457.457-32', '123.123.321-76', 12),
('0100', '111.222.333-44', '948.444.211-23', 6),
('0099', '936.046.736-04', '043.234.212-45', 3),
('0006', '756.934.999-45', '999.432.234-00', 13),
('0060', '333.222.444-11', '999.432.234-00', 9),
('0043', '987.654.432-10', '123.123.321-76', 6),
('0023', '809.343.212-54', '043.234.212-45', 12),
('0086', '094.543.829-23', '948.444.211-23', 11),
('0008', '923.545.892-45', '043.234.212-45', 4);
*/
create table Cancelamento(
    id int primary key auto_increment,
    PassagemID int not null unique,
    foreign key (PassagemID) references Passagem(psgm_id)
);

/*
insert into cancelamento
(passagemid)
values
(3),
(6);
*/

/*
select * from passagem;
select * from viagem where via_origem = 'SC' and via_preco <= 170;
select via_id, via_origem, via_destino from viagem where via_destino like 'PR' and via_origem like '%S%';

delete from passagem where viagemID = 13;
delete from viagem where via_id = 13;

select * from cancelamento can
inner join passagem pas on pas.psgm_id = can.passagemID;

select * from passagem p
inner join passageiro pas on pas.pas_cpf = p.passageiroID
inner join funcionario fun on fun.fun_cpf = p.funcionarioID
inner join viagem via on via.via_id = p.viagemID
inner join aviao avi on avi.avi_id = via.aviaoID;
*/

/*
(X) - Criar Schema e BD;
(X) - Criar relacionamentos; 
(X) - Inserir dados nas tebelas;
(X) - Utilizar ao menos um inner join;
(X) - Utilizar 'where' e 'like';

Table = 6;
Select = 5;
*/