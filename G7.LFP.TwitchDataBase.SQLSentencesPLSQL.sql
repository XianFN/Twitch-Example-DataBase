drop table FUTUREEVENTS;
drop table PASTEVENTS;
drop table EVENTS;
drop table FRIENDS;
drop table USERCARD;
drop table USERS CASCADE CONSTRAINTS;
drop table SUBSCRIBE;
drop table SUBSCRIBERS;
drop table USERPHONE;
drop table FOLLOWED;
drop table MODERATORS;
drop table FOLLOWERS;
drop table CLIPS;
drop table GAMES CASCADE CONSTRAINTS;
drop table CATEGORIESG CASCADE CONSTRAINTS;
drop table FOLLOWINGCG;
drop table COMPANIES CASCADE CONSTRAINTS;
drop table GAMCAT;
drop table GAMCOM;
drop table STREAMING CASCADE CONSTRAINTS;
drop table AGES;
drop table STRCATAGE;
drop table VIDEOS CASCADE CONSTRAINTS;
drop table COMPANYBELONG;
drop table COLLECTIONS CASCADE CONSTRAINTS;
drop table CATEGORIESS;
drop table SPONSORS CASCADE CONSTRAINTS;
drop table CATEGORIESV CASCADE CONSTRAINTS;
drop table AGEV CASCADE CONSTRAINTS;
drop table ADDS;
drop table ADDCOMPANY;
drop table VIDCATEAGE;
drop table COLLVID;

drop database TwichDataBase;
CREATE DATABASE TwichDataBase;

CREATE TABLE USERS(

    UserID number(12) not null constraint PK_USERS_USERID primary key check (UserID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    UserName nvarchar2(20) not null,
    Email nvarchar2(30) not null,
    Password nvarchar2(20) not null,
    Status number(1) not null check (Status >=0),
    BirthDate date default to_date('01/01/2000', 'MM/DD/YYYY') not null,
    Turbo number(1) not null check (Turbo >=0),
    VerifiedProfile number(1) not null check (VerifiedProfile >=0),
    Icon blob,
    BannedUsers number(4) not null check (BannedUsers like '[0-9][0-9][0-9][0-9]')
);

CREATE TABLE GAMES(

    GameID number(12) not null constraint PK_GAMES_GameID primary key check (GameID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    GameName nvarchar2(30) not null,
    Year number(4) not null check (Year like '[0-9][0-9][0-9][0-9]'),
    GameYear number(4) not null check (GameYear like '[0-9][0-9][0-9][0-9]'),
    GamePhoto blob
);

CREATE TABLE FUTUREEVENTS(

    NameFE varchar2 (50) not null constraint PK_FUTUREEVENTS_NAMEFE primary key 
);


CREATE TABLE PASTEVENTS(

    NamePE varchar2 (50) not null constraint PK_PASTEVENTS_NAMEPE primary key 
);


CREATE TABLE EVENTS(

    NameEvent nvarchar2 (50) not null constraint PK_EVENTS_NAMEEVENT primary key,
    Description nvarchar2(700) null,
    DateDay number(2) not null check (DateDay >=0 AND DateDay <=31),
    DateMonth number(2) not null check (DateMonth >=0 AND DateMonth <=12),
    DateYear number(4) not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
    EventTime number(12) not null check (EventTime like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    UserID number(12) not null
   
);

ALTER TABLE EVENTS 
    ADD CONSTRAINT FK_EVENTS_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE USERPHONE(
    
    PhoneNumber number(9) not null check (PhoneNumber like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    PhoneCompany nvarchar2 (20) not null,
    UserID number(12) not null
);


ALTER TABLE USERPHONE
    ADD CONSTRAINT FK_USERPHONE_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE USERCARD (

    CardNum number(16) not null check (CardNum like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    CardDate date default to_date('01/01/1900', 'DD/MM/YYYY') not null,
    CardCCV number(3) not null check(CardCCV like'[0-9][0-9][0-9]'),
    UserID number(12) not null
);

ALTER TABLE USERCARD
    ADD CONSTRAINT FK_USERCARD_USERID foreign key (UserID) references USERS(USERID);


CREATE TABLE FRIENDS(
  
    DateDay number(2) not null check (DateDay >=0 AND DateDay <=31),
    DateMonth number(2) not null check (DateMonth >=0 AND DateMonth <=12),
    DateYear number(4) not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
    NumFriends number(3) not null check (NumFriends like '[0-9][0-9][0-9]'),
    UserID number(12) not null
);

ALTER TABLE FRIENDS
    ADD CONSTRAINT FK_FRIENDS_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE SUBSCRIBE(

    DateDay number(2) not null check (DateDay >=0 AND DateDay <=31),
    DateMonth number(2) not null check (DateMonth >=0 AND DateMonth <=12),
    DateYear number(4) not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
    NumSubscriptions number(6) not null check (NumSubscriptions like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    UserID number(12) not null
);

 ALTER TABLE SUBSCRIBE
    ADD CONSTRAINT FK_SUBSCRIBE_USERID foreign key (UserID) references USERS(UserID);



CREATE TABLE SUBSCRIBERS(

    NumSubscribers number(6) not null  check (NumSubscribers like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    UserID number(12) not null
);

ALTER TABLE SUBSCRIBERS
    ADD CONSTRAINT FK_SUBSCRIBERS_USERID foreign key (UserID) references USERS(UserID);

    

CREATE TABLE FOLLOWED(
        
    DateDay number(2) not null check (DateDay >=0 AND DateDay <=31),
    DateMonth number(2) not null check (DateMonth >=0 AND DateMonth <=12),
    DateYear number(4) not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
    NumFollowed number(6) not null check (NumFollowed like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    UserID number(12) not null
);
    

ALTER TABLE FOLLOWED
    ADD CONSTRAINT FK_FOLLOWED_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE MODERATORS(

    UserID number(12) not null,
    NumModerators number(10) not null check (NumModerators >=0)
    
);
    
 ALTER TABLE MODERATORS
    ADD CONSTRAINT FK_MODERATORS_USERID foreign key (UserID) references USERS(UserID);



CREATE TABLE FOLLOWERS(

    NumFollowers number(6) not null check (NumFollowers like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    UserID number(12) not null
);

 ALTER TABLE FOLLOWERS
    ADD CONSTRAINT FK_FOLLOWERS_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE CLIPS(

    ClipID number(12) not null constraint PK_CLIPS_ClipID primary key check (ClipID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    TotalViews number(14) not null check(TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Chat nvarchar2(400) null,
    Title nvarchar2(20) not null,
    Game nvarchar2(20) not null,
    EmoteChat number(1) not null check (EmoteChat = 0 OR EmoteChat = 1),
    Thumbnail blob not null,
    UserID number(12) not null
);

 ALTER TABLE CLIPS
    ADD CONSTRAINT FK_CLIPS_USERID foreign key (UserID) references USERS(UserID);


CREATE TABLE FOLLOWINGCG (
    
    NumGames number(3) not null check (NumGames like '[0-9][0-9][0-9]'),
    UserID number(12) not null,
    GameID number(12) not null
);

ALTER TABLE FOLLOWINGCG
   ADD CONSTRAINT FK_FOLLOWINGCG_USERID foreign key (UserID) references USERS(UserID);

ALTER TABLE FOLLOWINGCG
   ADD CONSTRAINT FK_FOLLOWINGCG_GAMESID foreign key (GameID) references GAMES(GameID);
    

CREATE TABLE CATEGORIESG(

    CategoryGName nvarchar2(20) not null constraint PK_CATEGORIESG_CategoryGName primary key , 
    TotalViews number(14) not null check (TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
   
    
CREATE TABLE COMPANIES(

    NameC nvarchar2(20) not null constraint PK_COMPANIES_NameC primary key ,     
    YearCreate number(4) not null check (YearCreate like '[0-9][0-9][0-9][0-9]'),
    IsSponsor number(1) not null check (IsSponsor = 0 OR IsSponsor = 1)
);


CREATE TABLE GAMCAT(
    
  --constraint PK_GAMCAT primary key(UserID,CategoryGName)
    UserID number(12) not null,
    CategoryGName nvarchar2(20) not null
    
);

ALTER TABLE GAMCAT
   ADD CONSTRAINT FK_GAMCAT_USERID foreign key (UserID) references USERS(UserID);

ALTER TABLE GAMCAT
   ADD CONSTRAINT FK_GAMCAT_CATEGORYGNAME foreign key (CategoryGName) references CATEGORIESG(CategoryGName);
    



CREATE TABLE GAMCOM(

    GameID number(12) not null,
    NameC nvarchar2(20) not null
    
);
    
ALTER TABLE GAMCOM
   ADD CONSTRAINT FK_GAMCOM_USERID foreign key (GameID) references GAMES(GameID);

ALTER TABLE GAMCOM
   ADD CONSTRAINT FK_GAMCOM_NAMEC foreign key (NameC) references COMPANIES(NameC);
    


CREATE TABLE COMPANYBELONG(

    GNBelong nvarchar2(40) not null constraint PK_COMPANYBELONG_GNBelong primary key, 
    NameC nvarchar2(20) not null
    
);

ALTER TABLE  COMPANYBELONG
   ADD CONSTRAINT FK_COMPANYBELONG_NAMEC foreign key (NameC) references COMPANIES(NameC);

CREATE TABLE SPONSORS(

    SponsorID number(12) not null constraint PK_SPONSORS_SponsorID primary key check (SponsorID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    Company nvarchar2(30) not null,
    Priorityn number(1) not null,
    DateToPayDay number(2) not null check (DateToPayDay >=0 AND DateToPayDay <=31),
    DateToPayMonth number(2) not null check (DateToPayMonth >=0 AND DateToPayMonth <=12),
    DateToPayYear number(4) not null check (DateToPayYear like '[0-9][0-9][0-9][0-9]')
   
);
    
CREATE TABLE STREAMING(

    StreamID number(12) not null constraint PK_STREAMING_StreamID primary key check (StreamID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    TotalViews number(14) not null check (TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    ActuallyViews number(14) not null check (ActuallyViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Title nvarchar2(30) not null,
    Game nvarchar2(20) not null,
    Uptime number(14) not null check (Uptime like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Rooms number (2) not null,
    Chat nvarchar2(400),
    ChatMode number(1) not null check (ChatMode = 0 OR ChatMode = 1),
    EmotesChat number(1) not null check (EmotesChat = 0 OR EmotesChat = 1),
    Lenguaje nvarchar2(13) not null,
    UserID number(12) not null,
    GameID number(12) not null,
    SponsorID number(12) not null
    
);

ALTER TABLE STREAMING
   ADD CONSTRAINT FK_STREAMING_USERID foreign key (UserID) references USERS(UserID);

ALTER TABLE STREAMING
   ADD CONSTRAINT FK_STREAMING_GAMESID foreign key (GameID) references GAMES(GameID);

ALTER TABLE STREAMING
   ADD CONSTRAINT FK_STREAMING_SPONSORID foreign key (SponsorID) references SPONSORS(SponsorID);


CREATE TABLE AGES(
    
    AgeNumber number(2) not null constraint PK_C_AgeNumber primary key check (AgeNumber like '[0-9][0-9]'),
    UnderAge number(1) not null check (UnderAge = 0 OR UnderAge = 1),
    Inapropiate number(1) not null check (Inapropiate = 0 OR Inapropiate = 1)
    
);
    

CREATE TABLE STRCATAGE(

    CategorySName nvarchar2(20) not null constraint PK_STRCATAGE_CategorySName primary key,  
    AgeNumber number(2) not null check (AgeNumber like '[0-9][0-9]'),
    StreamID number(12) not null
);

 ALTER TABLE STRCATAGE
   ADD CONSTRAINT FK_STRCATAGE_STREAMID foreign key (StreamID) references STREAMING(StreamID);
    

CREATE TABLE CATEGORIESS(

    CategorySName nvarchar2(20) not null constraint PK_CATEGORIESS_CategorySName primary key, 
    FilterGame nvarchar2(30) not null,
    FilterLenguage nvarchar2(30) not null,
    FilterStreamer nvarchar2(30) not null
    
);

CREATE TABLE VIDEOS(

    VideoID number(12) constraint PK_VIDEOS_VideoID primary key check (VideoID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    TotalViews number(14) not null check (TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    Title nvarchar2(30) not null,
    Game varchar2(20) not null,
    Time number(14) not null check (Time like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    EmotesChat number(1) not null check (EmotesChat = 0 AND EmotesChat = 1),
    Thumbnail blob not null,
    UserID number(12) not null,
    StreamID number(12) not null
); 

ALTER TABLE VIDEOS
   ADD CONSTRAINT FK_VIDEOS_USERID foreign key (UserID) references USERS(UserID);

ALTER TABLE VIDEOS
   ADD CONSTRAINT FK_VIDEOS_STREAMID foreign key (StreamID) references STREAMING(StreamID);



CREATE TABLE COLLECTIONS(

    NameCollections nvarchar2(20) not null constraint PK_COLLECTIONS_NameCollections primary key, 
    NumOfVideos number(3) not null check (NumOfVideos like '[0-9][0-9][0-9]'),
    DateDay number(2) not null check (DateDay >=0 AND DateDay <=31),
    DateMonth number(2) not null check (DateMonth >=0 AND DateMonth <=12),
    DateYear number(4) not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
    NameVideo nvarchar2(30) not null,
    UserID number(12) not null
    
);
    
 ALTER TABLE COLLECTIONS
   ADD CONSTRAINT FK_COLLECTIONS_USERID foreign key (UserID) references USERS(UserID);



CREATE TABLE COLLVID(
    NameCollections nvarchar2(20) not null,
    VideoID number(12) not null
);

 ALTER TABLE COLLVID
   ADD CONSTRAINT FK_COLLVID_NAMECOLLECTIONS foreign key (NameCollections) references COLLECTIONS(NameCollections);

 ALTER TABLE COLLVID
   ADD CONSTRAINT FK_COLLVID_VIDEOID foreign key (VideoID) references VIDEOS(VideoID);
    




CREATE TABLE CATEGORIESV(

    CategoryVName nvarchar2(20) not null constraint PK_CATEGORIESV_CategoryVName primary key , 
    FilterGame nvarchar2(30) not null,
    FilterLenguage nvarchar2(30) not null,
    FilterStreamer nvarchar2(30) not null
);
    


CREATE TABLE AGEV(

    AgeVNumber number(18) not null constraint PK_AGEV_AgeVNumber primary key , 
    UnderAge number(1) not null check (UnderAge = 0 OR UnderAge = 1),
    Inapropiate number(1) not null check (Inapropiate = 0 OR Inapropiate = 1)
);


CREATE TABLE VIDCATEAGE(

 --constraint PK_VIDCATEAGE primary key(VideoID,CategoryVName,AgeV)
        VideoID number(12) not null,
        CategoryVName nvarchar2(20) not null,
        AgeVNumber number(18) not null
    
);
 ALTER TABLE VIDCATEAGE
   ADD CONSTRAINT FK_VIDCATEAGE_VIDEOID foreign key (VideoID) references VIDEOS(VideoID);
    
ALTER TABLE VIDCATEAGE
   ADD CONSTRAINT FK_VIDCATEAGE_CATEGORYVNAME foreign key (CategoryVName) references CATEGORIESV(CategoryVName);

 ALTER TABLE VIDCATEAGE
   ADD CONSTRAINT FK_VIDCATEAGE_AGEVNUMBER foreign key (AgeVNumber) references AGEV(AgeVNumber);



CREATE TABLE ADDS(    

    AddID number(12) not null constraint PK_ADDS_AddID primary key check (AddID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
    Longg number(10) not null check (longg > 0),
    Frecuency number(3) not null check(Frecuency like '[0-9][0-9][0-9]'),
    Subscriber number(1) not null check (Subscriber = 0 OR Subscriber = 1)
);

CREATE TABLE ADDCOMPANY(

    CompanyName nvarchar2(30) not null,
    CompanyMoney nvarchar2(30) not null,
    AgeVNumber number(18) not null
);
    
 ALTER TABLE ADDCOMPANY
   ADD CONSTRAINT FK_ADDCOMPANY_AGEVNUMBER foreign key (AgeVNumber) references AGEV(AgeVNumber);