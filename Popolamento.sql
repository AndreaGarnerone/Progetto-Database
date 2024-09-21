insert into DatiAccount values ('Dario Moccia', 0);
insert into DatiAccount values ('Enkk', 0);
insert into DatiAccount values ('Voghelita', 0);
insert into DatiAccount values ('NanniTwitch', 0);
insert into DatiAccount values ('Michelle Puttini', 0);
insert into DatiAccount values ('StudyTme', 0);
insert into DatiAccount values ('cavernadiplatone', 0);
insert into DatiAccount values ('pescanor', 0);
insert into DatiAccount values ('lynch227', 100);
insert into DatiAccount values ('agneseinnocente', 0);
insert into DatiAccount values ('loremosca', 10000);
insert into DatiAccount values ('sestroverso', 150);

insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('Dario Moccia', 'password', '1990-09-10');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('Enkk', 'asdfgh', '1987-02-21');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('Voghelita', '123456', '1995-11-13');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('NanniTwitch', 'qwerty', '1992-05-30');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('Michelle Puttini', '1qaz2wsx', '1994-07-14');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('StudyTme', '987654321', '1995-08-17');
insert into DatiRegistrazione(NomeUtente, Password, DataNascita) values ('cavernadiplatone', 'zxcvbn', '1988-12-05');

insert into Spettatore values ('pescanor');
insert into Spettatore values ('lynch227');
insert into Spettatore values ('agneseinnocente');
insert into Spettatore values ('loremosca');
insert into Spettatore values ('sestroverso');

insert into Streamer (NomeUtente, LiveEffettuate) values ('Dario Moccia', 57);
insert into Streamer (NomeUtente, LiveEffettuate) values ('Voghelita', 4);
insert into Streamer (NomeUtente, LiveEffettuate) values ('cavernadiplatone', 45);
insert into Streamer (NomeUtente, LiveEffettuate) values ('NanniTwitch', 50);
insert into Streamer (NomeUtente, LiveEffettuate) values ('Enkk', 12);
insert into Streamer (NomeUtente, LiveEffettuate) values ('Michelle Puttini', 41);
insert into Streamer (NomeUtente, LiveEffettuate) values ('StudyTme', 51);

insert into Canale (NomeCanale, NFollowers, Streamer) values ('NanniTwitch', 87206, 'NanniTwitch');
insert into Canale (NomeCanale, NFollowers, Streamer) values ('Dario Moccia', 443161, 'Dario Moccia');
insert into Canale (NomeCanale, NFollowers, Streamer) values ('Enkk', 165901, 'Enkk');
insert into Canale (NomeCanale, NFollowers, Streamer) values ('Voghelita', 83641, 'Voghelita');
insert into Canale (NomeCanale, NFollowers, Streamer) values ('Michelle Puttini', 195202, 'Michelle Puttini');
insert into Canale (NomeCanale, NFollowers, Streamer) values ('StudyTme', 97976, 'StudyTme');

insert into Segue values ('pescanor', 'Dario Moccia');
insert into Segue values ('agneseinnocente', 'Dario Moccia');
insert into Segue values ('lynch227', 'Enkk');
insert into Segue values ('Voghelita', 'Michelle Puttini');
insert into Segue values ('lynch227', 'StudyTme');

insert into StreamerAffiliate values ('Dario Moccia');
insert into StreamerAffiliate values ('Voghelita');
insert into StreamerAffiliate values ('Enkk');
insert into StreamerAffiliate values ('StudyTme');

insert into Donazione values (1, 'sestroverso', 'StudyTme', '2023-06-04 11:05:06', 100);

insert into Video (URL, Durata, Titolo, Categoria, NVisual, Canale) values ('https://www.twitch.tv/videos/1833426755', '0-07:55:15', 'Intervista a Filippo Giardina | 
																															Alle 22:45 Cinema Cult con Lo Squalo | 
																												            23:45 Zelda !prime !telegram !publive', 'Just chatting', 71378, 'Dario Moccia');

insert into Abbonamento values ('agneseinnocente', 'Dario Moccia');

insert into ElencoFollowee values ('lynch227', 'Enkk');
insert into ElencoFollowee values ('lynch227', 'StudyTme');
