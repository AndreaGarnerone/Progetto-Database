delete from Streamer where NomeUtente = 'NanniTwitch';  --Operazione non permessa dal database
delete from StreamerAffiliate where NomeStreamer = 'Enkk';

drop table Canale; --Operazione non permessa dal database

update DatiAccount
set NomeUtente = 'Caverna di platone'
where NomeUtente = 'cavernadiplatone';

delete from Streamer where NomeUtente = 'Caverna di platone';
delete from DatiRegistrazione where NomeUtente = 'Caverna di platone';
delete from DatiAccount where NomeUtente = 'Caverna di platone';