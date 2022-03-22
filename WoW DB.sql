-- ANGELESCU HORIA-GABRIEL

create table Company (
    company_name varchar2(50 char),
    game_name varchar2(50 char)
);

insert into Company (company_name, game_name) values ('Blizzard' , 'World of Warcraft');
insert into Company (company_name, game_name) values ('Fell Good Inc' , 'Plastic Beach');
insert into Company (company_name, game_name) values ('Acoustica' , 'Synth Raiders');
insert into Company (company_name, game_name) values ('SpaceX' , 'Rocket Science');
insert into Company (company_name, game_name) values ('DezGames' , 'Hunger Games');

alter table Company 
add constraint pk_company_name
primary key (COMPANY_name);

alter table Company modify company_name varchar2(50 char) not null;
alter table Company modify game_name not null;
alter table Company modify game_name unique;

create table Game (
    game_name varchar2(50 char) primary key,
    player_count number,
    game_type varchar2(50 char),
    game_price number
);

insert into Game (game_name, player_count, game_type, game_price) values ('World of Warcraft', 7000000, 'MMORPG', 60);
insert into Game (game_name, player_count, game_type, game_price) values ('Plastic Beach', 4300000, 'Action', 60);
insert into Game (game_name, player_count, game_type, game_price) values ('Synth Raiders', 1100000, 'VR Rythm Game', 25);
insert into Game (game_name, player_count, game_type, game_price) values ('Rocket Science', 3520000, 'Space Exploration', 45);
insert into Game (game_name, player_count, game_type, game_price) values ('Hunger Games', 2480000, 'Free For All', null);
alter table Game
modify game_type not null;

alter table Company 
add constraint fk_game_name
foreign key (game_name)
references Game(game_name);

create table Server (
    server_region varchar2(50 char) primary key,
    number_of_realms number,
    player_count number
);

insert into Server (server_region, number_of_realms, player_count) values ('EU', 6, 2719000);
insert into Server (server_region, number_of_realms, player_count) values ('NA', 5, 2368000);
insert into Server (server_region, number_of_realms, player_count) values ('CHINA', 5, 1913000);

alter table Server modify server_region not null
modify number_of_realms not null;

create table Realm (
    realm_name varchar2(50 char) primary key,
    server_region varchar2(50 char),
    realm_type varchar2(50 char),
    player_count number
);

insert into Realm (realm_name, server_region, realm_type, player_count) values ('Alpha', 'EU', 'PvE', 480000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Beta', 'EU', 'PvP', 570000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Gamma', 'NA', 'PvE', 300000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Delta', 'CHINA', 'PvE', 425000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Epsilon', 'CHINA', 'PvP', 600000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Zeta', 'NA', 'PvP', 762000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Eta', 'NA', 'PvP', 250000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Theta', 'EU', 'PvE', 643000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Iota', 'EU', 'PvP', 180000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Kappa', 'CHINA', 'PvE', 98000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Lambda', 'NA', 'PvE', 256000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Miu', 'CHINA', 'PvP', 416000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Niu', 'EU', 'PvP', 590000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Sigma', 'CHINA', 'PvE', 374000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Tau', 'NA', 'PvP', 800000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Omega', 'EU', 'PvE', 256000);
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Nightmare', 'NA', 'PvP', 832000); -- pt insert sequence
insert into Realm (realm_name, server_region, realm_type, player_count) values ('Dream', 'CHINA', 'PvE', 176000); -- pt insert sequence

alter table Realm
add constraint fk_server_region
foreign key (server_region) references Server (server_region);

alter table Realm modify realm_name not null
modify server_region not null
modify realm_type not null;

create table Player (
    player_ID number primary key,
    realm_name varchar2(50 char),
    name varchar2(50 char),
    surname varchar2(50 char),
    region varchar2(50 char)
);

Insert into PLAYER (player_ID,realm_name,name,surname,region) values (1,'Alpha','Allon','Eetu','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (2,'Gamma','Slaven','Manisha','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (3,'Zeta','Rafiq','Silvius','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (4,'Delta','Zan','Guiying','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (5,'Beta','Karolina','Michael','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (6,'Epsilon','Su','Jie','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (7,'Kappa','Shu','Guo','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (8,'Eta','Clinton','Laxmi','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (9,'Theta','Marie','Nebo','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (10,'Iota','Juan','Danya','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (11,'Lambda','Spencer','Harvey','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (12,'Miu','Huang','Yi','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (13,'Niu','Torgny','Tova','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (14,'Sigma','Xiuying','Wen','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (15,'Tau','Valentine','Dwight','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (16,'Omega','Hermanus','Marged','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (17,'Alpha','L?va','Jázmin','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (18,'Gamma','Mike','Toreno','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (19,'Zeta','Louis','Luiviera','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (20,'Delta','Cheng','Qiang','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (21,'Beta','Meera','Vivek','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (22,'Epsilon','Yazhu','Shi','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (23,'Kappa','Kai Zhong','Kai Zhong','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (24,'Eta','Chris','Redfield','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (25,'Theta','Boris','Stamen','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (26,'Iota','Nilda','Rajesh','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (27,'Lambda','Warrick','Bertram','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (28,'Miu','Tao','Yaling','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (29,'Niu','Sören','Simion','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (30,'Sigma','Li','Yaling','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (31,'Tau','David','Fold','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (32,'Omega','Komi','Eszter','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (33,'Alpha','Aemiliana','Aquila','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (34,'Gamma','Leon','Kennedy','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (35,'Zeta','Lucifer','Altwidus','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (36,'Delta','Heng','Chen','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (37,'Beta','Elvira','Deshawn','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (38,'Epsilon','Bai','Min','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (39,'Kappa','Huan','Yan','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (40,'Eta','Lena','Timothea','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (41,'Theta','Goudrun','Heimdall','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (42,'Iota','Avanti','Maimu','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (43,'Lambda','Adalia','Leigh','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (44,'Miu','Hai','Yin','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (45,'Niu','Bruno','Emirhan','EU');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (46,'Sigma','Zan','Long','CHINA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (47,'Tau','Eleanor','Enn','NA');
Insert into PLAYER (player_ID,realm_name,name,surname,region) values (48,'Omega','Marija','Humbert','EU');

alter table Player
add constraint fk_realm_name
foreign key (realm_name) references Realm (realm_name);

alter table Player modify player_ID not null
modify realm_name not null
modify name not null
modify surname not null
modify region not null;

create table Service (
    service_ID number primary key,
    service_name varchar2(50 char),
    service_price number
);

insert into Service (service_ID, service_name, service_price) values (1, 'Character Boost', 60);
insert into Service (service_ID, service_name, service_price) values (2, 'Realm Transfer', 30);
insert into Service (service_ID, service_name, service_price) values (3, 'Server Change', 25);
insert into Service (service_ID, service_name, service_price) values (4, 'Name Change', 10);
insert into Service (service_ID, service_name, service_price) values (5, 'Faction Change', 20);
insert into Service (service_ID, service_name, service_price) values (6, 'Appearance Change', 15);
insert into Service (service_ID, service_name, service_price) values (7, 'Race Change', 15);

alter table Service modify service_ID not null
modify service_name not null
modify service_price not null;

alter table Service  modify service_name unique;

create table Player_Service_Relation (
    player_ID number not null,
    service_ID number,
    foreign key (player_ID) references Player (player_ID),
    foreign key (service_ID) references Service (service_ID),
    unique (player_ID, service_ID)
);

Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (1,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (1,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (2,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (2,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (3,7);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (4,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (5,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (6,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (6,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (7,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (8,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (9,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (9,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (9,7);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (10,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (11,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (12,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (13,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (14,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (15,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (16,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (17,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (17,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (18,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (19,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (20,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (21,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (22,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (22,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (22,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (23,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (24,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (25,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (26,7);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (27,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (28,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (29,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (30,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (31,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (32,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (33,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (34,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (34,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (34,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (35,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (35,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (36,7);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (37,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (38,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (39,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (39,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (40,7);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (41,6);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (42,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (43,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (43,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (44,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (44,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (45,1);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (46,null);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (47,3);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (47,4);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (47,5);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (48,2);
Insert into PLAYER_SERVICE_RELATION (PLAYER_ID,SERVICE_ID) values (48,4);

create table Character (
    character_name varchar2(50 char) primary key not null,
    character_class varchar2(50 char) not null,
    character_level number not null,
    creation_date date not null
);

insert into Character (character_name, character_class, character_level, creation_date) values ('Thalador', 'Warrior', 60, to_date('2020-06-21', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('HolyTank', 'Paladin', 50, to_date('2020-08-13', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Rylothh', 'Demon Hunter', 60, to_date('2020-03-17', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Raiderck', 'Paladin', 60, to_date('2020-01-05', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Milikor', 'Shaman', 60, to_date('2020-04-29', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Ciradyl', 'Mage', 60, to_date('2020-05-30', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Brimzly', 'Mage', 50, to_date('2020-10-03', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Iproc', 'Death Knight', 43, to_date('2020-12-11', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Thomas', 'Warlock', 52, to_date('2020-08-16', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Sore', 'Priest', 59, to_date('2020-05-22', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Kim', 'Hunter', 47, to_date('2020-02-11', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Sparac', 'Monk', 29, to_date('2020-08-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Craze', 'Warrior', 39, to_date('2020-07-16', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Alla', 'Mage', 41, to_date('2020-11-13', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Altissa', 'Shaman', 18, to_date('2020-02-10', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Vana', 'Rogue', 21, to_date('2020-06-30', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Rambo', 'Paladin', 58, to_date('2020-02-18', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Tinyg', 'Hunter', 60, to_date('2020-03-24', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Timbersaw', 'Death Knight', 60, to_date('2020-03-25', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Cav', 'Demon Hunter', 3, to_date('2020-09-12', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Lambert', 'Rogue', 10, to_date('2020-07-22', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('SamFisher', 'Monk', 23, to_date('2020-05-18', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Pernie', 'Warrior', 46, to_date('2020-04-19', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Pilav', 'Priest', 45, to_date('2020-03-30', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Jumbo', 'Hunter', 28, to_date('2020-06-28', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Yumina', 'Mage', 1, to_date('2020-08-13', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Altimore', 'Mage', 52, to_date('2020-05-18', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Bamboo', 'Monk', 13, to_date('2020-01-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Fern', 'Paladin', 33, to_date('2020-01-03', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Gill', 'Death Knight', 37, to_date('2020-09-01', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Kerrie', 'Shaman', 44, to_date('2020-07-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Mordecai', 'Warrior', 26, to_date('2021-01-14', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Meister', 'Priest', 60, to_date('2021-02-18', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Humblegod', 'Rogue', 59, to_date('2020-07-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Ripped', 'Shaman', 37, to_date('2021-03-24', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('DeadInside', 'Death Knight', 60, to_date('2021-04-30', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Davion', 'Warrior', 60, to_date('2021-05-13', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Mirana', 'Hunter', 59, to_date('2020-09-08', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Benend', 'Monk', 18, to_date('2020-12-03', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Vortex', 'Mage', 19, to_date('2020-11-24', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Koven', 'Paladin', 54, to_date('2020-07-26', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Muzzy', 'Demon Hunter', 60, to_date('2020-03-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Shadowgrip', 'Rogue', 5, to_date('2021-03-09', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('SpareParts', 'Warrior', 12, to_date('2021-02-06', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Babylon', 'Priest', 37, to_date('2020-02-27', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Invoker', 'Mage', 60, to_date('2020-05-11', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Prism', 'Demon Hunter', 55, to_date('2020-09-27', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Spectrum', 'Shaman', 38, to_date('2020-02-19', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Truid', 'Druid', 60, to_date('2021-02-19', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('LifeBender', 'Druid', 59, to_date('2021-01-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Pirateguy', 'Rogue', 26, to_date('2021-04-29', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('HalfLife', 'Druid', 39, to_date('2020-01-10', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Birdie', 'Druid', 29, to_date('2020-11-16', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('DotBot', 'Warlock', 60, to_date('2021-03-20', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('ShadowPlay', 'Priest', 60, to_date('2021-03-21', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Scimitar', 'Shaman', 55, to_date('2020-08-03', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Frenzy', 'Paladin', 8, to_date('2020-08-25', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Kiln', 'Druid', 10, to_date('2020-06-04', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('FiveSeven', 'Warrior', 6, to_date('2020-09-17', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('FireStorm', 'Mage', 19, to_date('2021-05-20', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Prid', 'Hunter', 48, to_date('2021-04-19', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Van', 'Demon Hunter', 36, to_date('2021-02-13', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Darkholme', 'Death Knight', 57, to_date('2021-01-29', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Brad', 'Shaman', 11, to_date('2021-04-03', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Yrel', 'Shaman', 60, to_date('2020-12-10', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Argus', 'Monk', 57, to_date('2020-10-26', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Eonar', 'Druid', 7, to_date('2020-03-15', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Bolvar', 'Warrior', 59, to_date('2020-07-21', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('DarkHorse', 'Paladin', 8, to_date('2020-08-09', 'yyyy-mm-dd'));
insert into Character (character_name, character_class, character_level, creation_date) values ('Hulk', 'Rogue', 60, to_date('2020-09-14', 'yyyy-mm-dd'));

create table player_Char_Relation (
    player_ID number not null,
    character_name varchar2(50 char) not null,
    foreign key (player_ID) references Player (player_ID),
    foreign key (character_name) references Character (character_name),
    unique (player_ID, character_name)
);

insert into player_Char_Relation (player_ID, character_name) values (1, 'Thalador');
insert into player_Char_Relation (player_ID, character_name) values (1, 'HolyTank');
insert into player_Char_Relation (player_ID, character_name) values (2, 'Rylothh');
insert into player_Char_Relation (player_ID, character_name) values (3, 'Raiderck');
insert into player_Char_Relation (player_ID, character_name) values (4, 'Milikor');
insert into player_Char_Relation (player_ID, character_name) values (4, 'Ciradyl');
insert into player_Char_Relation (player_ID, character_name) values (4, 'Brimzly');
insert into player_Char_Relation (player_ID, character_name) values (5, 'Iproc');
insert into player_Char_Relation (player_ID, character_name) values (6, 'Thomas');
insert into player_Char_Relation (player_ID, character_name) values (7, 'Sore');
insert into player_Char_Relation (player_ID, character_name) values (8, 'Kim');
insert into player_Char_Relation (player_ID, character_name) values (9, 'Sparac');
insert into player_Char_Relation (player_ID, character_name) values (9, 'Craze');
insert into player_Char_Relation (player_ID, character_name) values (9, 'Alla');
insert into player_Char_Relation (player_ID, character_name) values (9, 'Altissa');
insert into player_Char_Relation (player_ID, character_name) values (10, 'Vana');
insert into player_Char_Relation (player_ID, character_name) values (11, 'Rambo');
insert into player_Char_Relation (player_ID, character_name) values (12, 'Timbersaw');
insert into player_Char_Relation (player_ID, character_name) values (13, 'Cav');
insert into player_Char_Relation (player_ID, character_name) values (14, 'Lambert');
insert into player_Char_Relation (player_ID, character_name) values (15, 'SamFisher');
insert into player_Char_Relation (player_ID, character_name) values (15, 'Pernie');
insert into player_Char_Relation (player_ID, character_name) values (16, 'Pilav');
insert into player_Char_Relation (player_ID, character_name) values (16, 'Jumbo');
insert into player_Char_Relation (player_ID, character_name) values (17, 'Yumina');
insert into player_Char_Relation (player_ID, character_name) values (17, 'Altimore');
insert into player_Char_Relation (player_ID, character_name) values (18, 'Bamboo');
insert into player_Char_Relation (player_ID, character_name) values (19, 'Fern');
insert into player_Char_Relation (player_ID, character_name) values (20, 'Gill');
insert into player_Char_Relation (player_ID, character_name) values (21, 'Kerrie');
insert into player_Char_Relation (player_ID, character_name) values (22, 'Mordecai');
insert into player_Char_Relation (player_ID, character_name) values (23, 'Meister');
insert into player_Char_Relation (player_ID, character_name) values (24, 'Humblegod');
insert into player_Char_Relation (player_ID, character_name) values (24, 'Ripped');
insert into player_Char_Relation (player_ID, character_name) values (24, 'DeadInside');
insert into player_Char_Relation (player_ID, character_name) values (25, 'Davion');
insert into player_Char_Relation (player_ID, character_name) values (26, 'Mirana');
insert into player_Char_Relation (player_ID, character_name) values (26, 'Benend');
insert into player_Char_Relation (player_ID, character_name) values (27, 'Vortex');
insert into player_Char_Relation (player_ID, character_name) values (27, 'Koven');
insert into player_Char_Relation (player_ID, character_name) values (27, 'Muzzy');
insert into player_Char_Relation (player_ID, character_name) values (27, 'Shadowgrip');
insert into player_Char_Relation (player_ID, character_name) values (28, 'SpareParts');
insert into player_Char_Relation (player_ID, character_name) values (29, 'Babylon');
insert into player_Char_Relation (player_ID, character_name) values (30, 'Invoker');
insert into player_Char_Relation (player_ID, character_name) values (31, 'Prism');
insert into player_Char_Relation (player_ID, character_name) values (32, 'Spectrum');
insert into player_Char_Relation (player_ID, character_name) values (32, 'Truid');
insert into player_Char_Relation (player_ID, character_name) values (32, 'LifeBender');
insert into player_Char_Relation (player_ID, character_name) values (32, 'Pirateguy');
insert into player_Char_Relation (player_ID, character_name) values (33, 'HalfLife');
insert into player_Char_Relation (player_ID, character_name) values (34, 'Birdie');
insert into player_Char_Relation (player_ID, character_name) values (35, 'DotBot');
insert into player_Char_Relation (player_ID, character_name) values (36, 'ShadowPlay');
insert into player_Char_Relation (player_ID, character_name) values (37, 'Scimitar');
insert into player_Char_Relation (player_ID, character_name) values (38, 'Frenzy');
insert into player_Char_Relation (player_ID, character_name) values (39, 'Kiln');
insert into player_Char_Relation (player_ID, character_name) values (40, 'FiveSeven');
insert into player_Char_Relation (player_ID, character_name) values (41, 'FireStorm');
insert into player_Char_Relation (player_ID, character_name) values (42, 'Prid');
insert into player_Char_Relation (player_ID, character_name) values (43, 'Van');
insert into player_Char_Relation (player_ID, character_name) values (44, 'Darkholme');
insert into player_Char_Relation (player_ID, character_name) values (44, 'Brad');
insert into player_Char_Relation (player_ID, character_name) values (45, 'Yrel');
insert into player_Char_Relation (player_ID, character_name) values (46, 'Argus');
insert into player_Char_Relation (player_ID, character_name) values (47, 'Eonar');
insert into player_Char_Relation (player_ID, character_name) values (48, 'Bolvar');
insert into player_Char_Relation (player_ID, character_name) values (48, 'DarkHorse');
insert into player_Char_Relation (player_ID, character_name) values (48, 'Hulk');
insert into player_Char_Relation (player_ID, character_name) values (48, 'Tinyg');

commit;

--drop table Player_Char_Relation;
--drop table Player_Service_Relation;
--drop table Character;
--drop table Service;
--drop table Player;
--drop table Game;
--drop table Company;
--drop table Realm;
--drop table Server;

-- ANGELESCU HORIA-GABRIEL, GR 212.

/*
select * from Character;
select * from Company;
select * from Game;
select * from Player;
select * from Realm;
select * from Service;
select * from Player_Char_Relation;
select * from Player_Service_Relation;
*/

-- operatie join pe cel putin 4 tabele

select distinct sv.server_region
from server sv 
left join realm r on r.server_region = sv.server_region -- exact cele 16 realm-uri cu regiunile sale
left join player p on p.region = sv.server_region -- exact coloana p.region
left join game g on g.player_count > sv.player_count;

-- filtrare la nivel de linii

--select psr.player_ID, psr.service_ID
--from player_service_relation psr
--where psr.service_ID is null;

-- iau toti jucatorii care n-au niciun service

-- subcereri sincronizate în care intervin cel putin 3 tabele +
-- grupari de date, functii grup, filtrare la nivel de grupuri +
-- ordonari +
-- filtrare la nivel de linii

select r.realm_name
from realm r
where r.realm_name in (
    select p.realm_name
    from player p
    where p.player_ID in (
        select psr.player_ID
        from player_service_relation psr
        having 2 < count(psr.service_ID)
        group by psr.player_ID
    )
)
order by r.realm_name desc;
--iau toate realm_name-urile unde jucatorii au cel putin 2 service-uri si le ordonez invers alfabetic.

-- subcereri nesincronizate în care intervin cel putin 3 tabele +
-- filtrare +
-- functie 1 sir de caractere

select pcr.character_name
from Player_Char_Relation pcr
where pcr.player_ID in (
    select p.player_ID
    from player p
    where p.realm_name in (
        select r.realm_name
        from realm r
        where length(r.realm_name) <= 4
    )
)
order by pcr.player_ID;
--iau toate numele caracterelor, tuturor jucatorilor de pe realm-urile ce au un nume <= 4 caractere

-- grupari de date, functii grup, filtrare la nivel de grupuri

--select psr.player_ID, sum(s.service_price)
--from Player_Service_Relation psr, service s
--where psr.service_ID = s.service_ID
--group by psr.player_ID
--having sum(s.service_price) > 60
--order by psr.player_ID;
-- iau toti jucatorii care au platit mai mult de $60 pe service-uri

-- utilizarea a cel putin 2 functii pe siruri de caractere, 2 functii pe date calendaristice, 
-- a functiilor NVL si DECODE, a cel putin unei expresii CASE

-- functia 2 pe sir de caractere +
-- functia 1 pe data calendaristica +
-- ordonare

select distinct c.character_name, c.creation_date, replace('PvE', 'E', 'P') as New_Realm_Type
from Realm r, Character c, Player p, Player_Char_Relation pcr
where r.realm_type = 'PvE' and r.realm_name = p.realm_name and p.player_ID = pcr.player_ID and c.creation_date > add_months('02-MAR-2020', 6)
order by c.creation_date;
-- iau fiecare Caracter creat dupa data de 02-SEP-2020 de pe toate realm-urile de tip "PvE" si le transform in tip "PvP,
-- ordonand tot dupa data la care a fost creat caracterul respectiv" 


-- functia DECODE +
-- functia NVL

select s.service_ID, nvl(psr.service_ID, 1), decode(psr.service_ID, 1, 'Character Boost',
                                                                    2, 'Realm Transfer',
                                                                    3, 'Server Change',
                                                                    4, 'Name Change',
                                                                    5, 'Faction Change',
                                                                    6, 'Appearance Change',
                                                                    7, 'Race Change',
                                                                    null, 'Nothing') as Result
from Service s
right join Player_Service_Relation psr on s.service_ID = psr.service_ID;
-- iau fiecare service in parte, si incerc sa fac corespondenta dintre id-ul service-ului si numele acestuia (1 - Character Boost, ... , 7 - Race Change).
-- Cand nu am niciun service, imi apare ca respectivul nu poseda un astfel de lucru, asa ca dau din partea casei serviciul cu id = 1

-- expresie CASE +
-- functie 2 pe data calendaristica

select p.player_ID, p.name, p.surname,
case
    when months_between('01-JAN-2021', c.creation_date) > 0 then 'Character was created in 2020!'
    else 'Character was created in 2021!'
end as Status,
case
    when psr.service_ID is null then 'Player has no services!'
    else 'Player has 1 or more services!'
end as Service_Status
from player p, Character c, Player_Char_Relation pcr, Player_Service_Relation psr
where p.player_ID = pcr.player_ID and p.player_ID = psr.player_ID and  pcr.character_name = c.character_name;
-- Iau fiecare jucator in parte si vad in ce an si-au creat caracterele cat si daca poseda un serviciu sau nu.

-- clauza WITH

with temp(avgVal) as (
    select avg(r.player_count)
    from Realm r
)
select r.realm_name
from Realm r, temp
where r.player_count > temp.avgVal;
-- creez un tabel temporar 'temp' unde am un average value. Ma folosesc de acest tabel pentru a lua realm-name-urile care au un numar de jucatori mai mare decat
-- media tuturor realm-urilor

-- Implementarea a 3 operatii de actualizare sau suprimare a datelor utilizand subcereri

-- 1) Inserare

Insert into (select * from Game g where g.player_count > 1000000) values ('Beat Saber', 1100000, 'VR Rythm Game', 25);
-- inserez un nou joc daca acesta are peste 1 milion  de jucatori;

-- 2) Stergere

Delete (select * from Game g where g.player_count <= 1000000) where game_name = 'Beat Saber';
-- sterg un joc daca se numeste 'Beat Saber' si are sub 1 milion de jucatori

-- 3) Actualizare

Update (select * from Game g where g.player_count <= 1100000) set player_count = player_count + 300000;
-- iau toate jocurile care au sub 1.1mil jucatori si adaug 300000;

-- Crearea unei secvente ce va fi utilizat in inserarea inregistrarilor in tabele (punctul 10).

create sequence multiple_insert
start with 49
increment by 1
nocache
nocycle;
-- creez o secventa pentru a adauga jucatori incepand cu id-ul 49 (ultimul fiind 48)

--select multiple_insert.CURRVAL, multiple_insert.NEXTVAL from dual;

insert into Player values (multiple_insert.nextval, 'Nightmare', 'Clinton', 'Loomis', 'NA');
insert into Player values (multiple_insert.nextval, 'Dream', 'Lian', 'Lee', 'CHINA');

-- Crearea  unei  vizualizari  compuse.  Dati  un  exemplu  de  operatie  LMD permisa pe vizualizarea respectiva si un exemplu de operatie LMD nepermisa.

create or replace view Server_Status as
select r.realm_name, s.server_region
from Realm r, Server s
where r.server_region = s.server_region;
-- creez sau actualizez o vizualizare formata din doua coloane din 2 tabele diferite (Realm si Server) 
-- operatie LMD permisa

select * from Server_Status;

-- operatie LMD nepermisa

select ss.realm_name 
from Server_Status ss
group by ss.server_region;
-- clauza 'group by' nu merge pe vizualizari, se poate folosi in schimb la interogarea acesteia.

-- Crearea  unui index care sa optimizeze o cerere de tip c?utare cu 2 criterii. Specificati cererea.

create index Search_Players
on Player (realm_name, region);
--drop index Search_Players;

select count(*)
from Player p
where p.region = 'EU' and p.realm_name like '%t%';
--iau toti jucatorii din Europa care joaca pe un realm ce contine caracterul "t".

-- Formulati în limbaj natural si implementati în SQL:
-- o cerere ce utilizeaza operatia outer-join pe minimum 4 tabele si doua cereri ce utilizeaza operatia division.

-- outer join
select p.player_ID
from Player p
full outer join Player_Char_Relation pcr on p.player_ID = pcr.player_ID
full outer join Player_Service_Relation psr on p.player_ID = psr.player_ID
full outer join Realm r on p.realm_name = r.realm_name;

/*
 primul full outer join ia toate ID-urile jucatorilor in functie de cate caractere au (inafara de ultimele doua (56 si 55) care au fost create in urma sequence-ului)
 astfel rezultand coloana "Player_ID" din tabelul "Player_Char_Relation"
 in momentul in care facem al doilea full outer join, coloana "Player_ID" din tabelul "Player_Char_Relation" si coloana "Player_ID" din tabelul "Player_Service_Relation"
 se combina. De exemplu sa luam ID_ul jucatorului = 1. Cand se da outer join intre tabelele "Player" si "Player_Char_Relation" o sa avem de doua ori valoarea 1 (deoarece
 jucatorul cu ID_ul 1 are 2 caractere) Totodata, daca dam individual full outer join pe tabelele "Player" si "Player_Service_Relation", constatam ca jucatorul 1 are
 doua servicii, deci o sa apara valoarea 1 tot de doua ori.
 In momentul in care facem full outer join pe toate cele 3 tabele, o sa avem valoarea 1 de 4 ori (fiind doua blocuri a cate doua coloane (1 1)) deci primele 
 4 valori sunt: 1 1 1 1. Analog si pentru restul ID-urilor.
 In momentul in care facem full outer join si pe tabelul "Realm", nu o sa se schimbe nimic deoarece avem conditia "p.realm_name = r.realm_name" ce leaga fiecare jucator
 de fiecare realm pe care joaca.
 */
 
 -- cerere 1 operatia division
select p.name
from Player p
where not exists (
    select null
    from Player_Service_Relation psr
    where psr.service_ID is not null and psr.player_ID = p.player_ID
)
order by p.name;
-- iau toti jucatorii care nu au niciun service.
 
-- cerere 2 operatia division
select p.name
from Player p
where not exists (
    select null
    from Player_Char_Relation pcr
    having count(pcr.player_ID) < 2 and pcr.player_ID = p.player_ID
    group by pcr.player_ID
);

-- iau fiecare jucator care are >= 2 caractere.