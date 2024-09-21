begin;

create table DatiAccount (
	NomeUtente varchar(25) primary key,
	Bits integer
);

create table DatiRegistrazione (
	NomeUtente varchar(25) primary key,
	Password varchar(25) not null,
	DataNascita date not null,
	Emai varchar(50),
	Telefono varchar(12),
	foreign key (NomeUtente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table MessaggioPrivato (
	Data_e_Ora timestamp,
	NomeMittente varchar(25),
	NomeRicevente varchar(25),
	Testo varchar(1000) not null,
	primary key (Data_e_Ora, NomeMittente, NomeRicevente),
	foreign key (NomeMittente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action,
	foreign key (NomeRicevente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table Spettatore (
	NomeUtente varchar(25) primary key,
	foreign key (NomeUtente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table ElencoFollowee (
	Utente varchar(25),
	Followee varchar(25),
	primary key (Utente, Followee),
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table Streamer (
	NomeUtente varchar(25) primary key,
	MinutiTrasmessi interval day to second(2), --not null,
	LiveEffettuate numeric(3) not null,
	NSpectSimul integer, --not null,
	foreign key (NomeUtente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table StreamerAffiliate (
	NomeStreamer varchar(25) primary key,
	foreign key (NomeStreamer) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table Donazione (
	ID numeric(7) primary key,
	NomeUtenteAccount varchar(25) not null,
	NomeStreamer varchar(25) not null,
	Data_e_Ora timestamp not null,
	Bits numeric(5) not null,
	foreign key (NomeUtenteAccount) references DatiAccount(NomeUtente)
		on update cascade
		on delete no action,
	foreign key (NomeStreamer) references StreamerAffiliate(NomeStreamer)
		on update cascade
		on delete no action
);

create table Canale (
	NomeCanale varchar(25) primary key,
	Trailer bytea,
	Descrizione text,
	ImmagineProfilo bytea,
	NFollowers integer not null,
	Streamer varchar(25) not null,
	foreign key (Streamer) references Streamer(NomeUtente)
			on update cascade
			on delete no action
);

create table Video (
	URL varchar(1000) primary key,
	Durata interval day to second not null,
	Titolo varchar(500)  not null,
	Categoria varchar(100),
	NVisual integer not null,
	Canale varchar(25) not null,
	foreign key (Canale) references Canale(NomeCanale)
);

create table Live (
	URL varchar(1000) primary key,
	Durata interval day to second(2),
	Titolo varchar(500) not null,
	Categoria varchar(100),
	NMedioSpect smallint,
	Orario timestamp(2),
	Streamer varchar(25) not null,
	Video varchar(1000) unique,
	Canale varchar(25) not null,
	foreign key (Streamer) references Streamer(NomeUtente)
			on update cascade
			on delete no action,
	foreign key (Video) references Video(URL)
			on update cascade
			on delete no action,
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);


create table MessaggioPubblico (
	Data_e_Ora timestamp,
	NomeMittente varchar(25),
	ChatLive varchar(1000),
	Testo varchar(1000) not null,
	primary key (Data_e_Ora, NomeMittente, ChatLive),
	foreign key (NomeMittente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action,
	foreign key (ChatLive) references Live(URL)
			on update cascade
			on delete no action
);

create table Appare (
	Live varchar(1000),
	Utente varchar(20),
	primary key (Live, Utente),
	foreign key (Live) references Live(URL)
			on update cascade
			on delete no action,
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);


create table FruisceLive (
	Live varchar(1000),
	Utente varchar(20),
	primary key (Live, Utente),
	foreign key (Live) references Live(URL)
			on update cascade
			on delete no action,
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table ListaTagLive (
	Tag varchar(30),
	Live varchar(1000),
	Video varchar(1000),
	primary key (Tag, Live),
	foreign key (Live) references Live(URL)
			on update cascade
			on delete no action,
	foreign key (Video) references Video(URL)
			on update cascade
			on delete no action
);

create table Clip (
	URL varchar(1000) primary key,
	Durata interval day to second(2),
	Titolo varchar(140)  not null,
	Categoria varchar(100),
	Live varchar(1000) not null,
	NVisual integer not null,
	Canale varchar(25) not null,
	foreign key (Live) references Live(URL)
			on update cascade
			on delete no action,
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);

create table FruisceClip (
	Clip varchar(1000),
	Utente varchar(25),
	primary key (Clip, Utente),
	foreign key (Clip) references Clip(URL)
			on update cascade
			on delete no action,
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table ListaTagClip (
	Tag varchar(30),
	Clip varchar(1000),
	primary key (Tag, Clip),
	foreign key (Clip) references Clip(URL)
			on update cascade
			on delete no action
);

create table FruisceVideo (
	Video varchar(1000),
	Utente varchar(25),
	primary key (Video, Utente),
	foreign key (Video) references Video(URL)
			on update cascade
			on delete no action,
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action
);

create table Segue (
	Utente varchar(25),
	Canale varchar(25),
	primary key (Utente, Canale),
	foreign key (Utente) references DatiAccount(NomeUtente)
			on update cascade
			on delete no action,
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);

create table Abbonamento (
	Spettatore varchar(25),
	Canale varchar(25),
	primary key (Spettatore, Canale),
	foreign key (Spettatore) references Spettatore(NomeUtente)
			on update cascade
			on delete no action,
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);

create table LiveFutura (
	Data_e_Ora timestamp,
	Canale varchar(25),
	primary key (Data_e_Ora, Canale),
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);

create table ListaSocial (
	Social varchar(15),
	Canale varchar(25),
	primary key (Social, Canale),
	foreign key (Canale) references Canale(NomeCanale)
			on update cascade
			on delete no action
);


commit;