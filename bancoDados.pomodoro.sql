create database pomodoro;
use pomodoro;

create table Usuario(
	idUsuario int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    tipoUsuario char(30), constraint chkUser check (tipoUsuario in("Autonomo", "Empresa")),
     cpf varchar(15),
    fkMotorista int, foreign key (fkMotorista) references Motorista(idMotorista)
 );
 
 create table EnderecoUsuario(
	idEndereco int primary key auto_increment,
     cidade varchar(45),
      cep varchar(8),
    bairro varchar(45),
    numero varchar(10),
    fkUsuario int, constraint fkUsuario foreign key (fkUsuario) references Usuario(idUsuario)
);

 create table Tomate(
	idTomate int primary key auto_increment,
    unidadeTomate int,
	fkUsuario int, constraint fkUsuario foreign key (fkUsuario) references Usuario(idUsuario)
);

create table Motorista(
	idMotorista int primary key auto_increment,
    nome varchar(45),
    sobrenome varchar(45),
    cpf char(11),
    fkUsuario int,constraint fkUsuario foreign key(fkUsuario) references Usuario(idUsuario)
);

create table Caminhao(
	idCaminhao int primary key auto_increment,
    placa varchar(30),
    fkMotorista int, constraint fkMotorista  foreign key (fkMotorista) references Motorista(idMotorista)
);

create table Trajeto(
	idTrajeto int primary key auto_increment,
    distancia float,
    fkCaminhao int, constraint fkCaminhao foreign key (Trajeto) references Caminhao(idCaminhao)
);

create table Sensor(
	idSensor int primary key auto_increment,
    tipoSensor char(15), constraint chkTipoSensor check (tipoSensor in("Temperatura", "Umidade")),
    fkCaminhao int, constraint fkCaminhao foreign key (fkCaminhao) references Caminhao(idCaminhao)
);

create table dadosSensor(
	iddadosSensor int primary key auto_increment,
    valorSensor float,
    fkSensor int, constraint fkSensor foreign key (fkSensor) references Sensor(idSensor)
);
 







