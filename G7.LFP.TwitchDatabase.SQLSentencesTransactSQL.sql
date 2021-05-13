CREATE DATABASE TwitchDatabase
GO
USE TwitchDatabase
GO

CREATE TABLE USERS(

	UserID int identity(1,1) constraint PK_UserID primary key check (UserID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),  
	UserName varchar(20) not null,
	Email nvarchar(30) not null,
	Password nvarchar(20) not null,
	Status bit not null,
	BirthDate date not null,
	Turbo bit not null,
	VerifiedProfile bit not null,
	Icon image not null,
	BannedUsers int not null check (BannedUsers like '[0-9][0-9][0-9][0-9]')
)





CREATE TABLE EVENTS
(

	NameEvent nvarchar (50) constraint PK_NameEvent primary key  ,
	Description nvarchar (700) null,
	DateDay   smallint not null check (DateDay >=0 AND DateDay <=31),
	DateMonth smallint not null check (DateMonth >=0 AND DateMonth <=12),

	DateYear smallint not null check (DateYear like '[0-9][0-9][0-9][0-9]'),

	EventTime int not null check (EventTime like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	UserID int not null )

	ALTER TABLE	EVENTS ADD CONSTRAINT FK_EVENTS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE FUTUREEVENTS(

	NameFE nvarchar (50) constraint PK_NameFE primary key,
	NameEvent nvarchar (50) not null  )
	ALTER TABLE	FUTUREEVENTS ADD CONSTRAINT FK_FUTUREEVENTS_NameEvent foreign key (NameEvent) references EVENTS (NameEvent)

CREATE TABLE PASTEVENTS(

	NamePE nvarchar (50)constraint PK_NamePE primary key,
	NameEvent nvarchar (50) not null  )  
	ALTER TABLE	PASTEVENTS ADD CONSTRAINT FK_PASTEVENTS_NameEvent foreign key (NameEvent) references EVENTS (NameEvent)

CREATE TABLE USERPHONE(
	
	UserPhoneID int identity(1,1) constraint PK_UserPhoneID primary key , 
	PhoneNumber int not null check (PhoneNumber like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	PhoneCompany nvarchar (20)not null,
	UserID int not null)
	ALTER TABLE	USERPHONE ADD CONSTRAINT FK_USERPHONE_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE USERCARD (

	UserCardID int identity(1,1) constraint PK_UserCardID primary key , 
	CardNum  int not null check (CardNum like'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	CardDate  date not null,
	CardCCV  int null check(CardCCV like'[0-9][0-9][0-9]'),

	UserID int not null)
	ALTER TABLE	USERCARD ADD CONSTRAINT FK_USERCARD_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE FRIENDS(
	
	FriendsID int identity(1,1) constraint PK_FriendsID primary key , 
	DateDay smallint not null check (DateDay >=0 AND DateDay <=31),
	DateMonth smallint not null check (DateMonth >=0 AND DateMonth <=12),

	DateYear smallint not null check (DateYear like '[0-9][0-9][0-9][0-9]'),

	NumFriends int not null check (NumFriends like '[0-9][0-9][0-9]'),
	UserID int not null)
	ALTER TABLE	FRIENDS ADD CONSTRAINT FK_FRIENDS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE SUBSCRIBE(

	SuscribeID  int identity(1,1) constraint PK_SuscribeID primary key, 
	DateDay  smallint not null check (DateDay >=0 AND DateDay <=31),

	DateMonth  smallint not null check (DateMonth >=0 AND DateMonth <=12),
	DateYear smallint not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
	NumSubscriptions int not null check (NumSubscriptions like '[0-9][0-9][0-9][0-9][0-9][0-9]'),

	UserID int not null)
	ALTER TABLE	SUBSCRIBE ADD CONSTRAINT FK_SUBSCRIBE_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE SUBSCRIBERS(

	SuscribersID int identity(1,1) constraint PK_SuscribersID primary key , 
	NumSubscribers smallint not null check (NumSubscribers like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	UserID int not null)
	ALTER TABLE	SUBSCRIBERS ADD CONSTRAINT FK_SUBSCRIBERS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE FOLLOWED(

	FollowedID int identity(1,1) constraint PK_FollowedID primary key, 
	DateDay smallint not null check (DateDay >=0 AND DateDay <=31),

	DateMonth smallint not null check (DateMonth >=0 AND DateMonth <=12),

	DateYear smallint not null check (DateYear like '[0-9][0-9][0-9][0-9]'),
	NumFollowed int not null check (NumFollowed like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
	UserID int not null)
	ALTER TABLE	FOLLOWED ADD CONSTRAINT FK_FOLLOWED_UserID foreign key (UserID) references USERS (UserID)


CREATE TABLE MODERATORS(

	ModeratorID int identity(1,1) constraint PK_ModeratorID primary key, 
	NumModerators int not null check (NumModerators like '[0-9][0-9][0-9][0-9][0-9][0-9]'),

	UserID int not null)
	ALTER TABLE	MODERATORS ADD CONSTRAINT FK_MODERATORS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE FOLLOWERS(

	FollowersID int identity(1,1) constraint PK_FollowersID primary key  ,  
	NumFollowers int not null check (NumFollowers like '[0-9][0-9][0-9][0-9][0-9][0-9]'),

	UserID int not null)
	ALTER TABLE	FOLLOWERS ADD CONSTRAINT FK_FOLLOWERS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE CLIPS(

	ClipID int identity(1,1) constraint PK_ClipID primary key check (ClipID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 
	TotalViews int not null check(TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	Chat nvarchar(4000) null,
	Title nvarchar(20) not null,
	Game nvarchar(20) not null,
	EmoteChat bit not null,
	Thumbnail image not null,
	UserID int not null )
	ALTER TABLE	CLIPS ADD CONSTRAINT FK_CLIPS_UserID foreign key (UserID) references USERS (UserID)


CREATE TABLE GAMES(

	GamesID int identity(1,1) constraint PK_GamesID primary key check (GamesID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
	GameName nvarchar(30) not null,
	Year smallint not null check (Year like '[0-9][0-9][0-9][0-9]'),

	GameYear smallint not null check (GameYear like '[0-9][0-9][0-9][0-9]'),
	GamePhoto  nvarchar(30) null)

CREATE TABLE FOLLOWINGCG (

	FollowinGCGID int identity(1,1) constraint PK_FollowinGCGID primary key ,  
	GamesID int not null,  
	NumGames smallint not null check (NumGames like '[0-9][0-9][0-9]'),
	UserID int not null)
	ALTER TABLE	FOLLOWINGCG ADD CONSTRAINT FK_FOLLOWINGCG_UserID foreign key (UserID) references USERS (UserID)
	ALTER TABLE	FOLLOWINGCG ADD CONSTRAINT FK_FOLLOWINGCG_GamesID foreign key (GamesID) references GAMES (GamesID)

CREATE TABLE CATEGORIESG(

	CategoryGName  nvarchar(20)constraint PK_CategoryGName primary key, 
	TotalViews int not null,
	GamesID int not null)
	ALTER TABLE	FOLLOWINGCG ADD CONSTRAINT FK_CATEGORIESG_GamesID foreign key (GamesID) references GAMES (GamesID)

CREATE TABLE COMPANIES(


	NameC nvarchar(20)constraint PK_NameC primary key, 	
	YearCreate smallint not null check (YearCreate like '[0-9][0-9][0-9][0-9]'),

	IsSponsor bit not null)

CREATE TABLE GAMCAT(

	GameCATID  int identity(1,1) constraint PK_GameCATID primary key, 
	NameG  nvarchar(20) not null,
	GamesID int not null,)
	ALTER TABLE	GAMCAT ADD CONSTRAINT FK_GAMCAT_GamesID foreign key (GamesID) references GAMES (GamesID)

CREATE TABLE GAMCOM(

	GameComID  int identity(1,1) constraint PK_GameComID primary key, 
	NameC nvarchar(20)not null ,
	GamesID int not null, )
	ALTER TABLE	GAMCOM ADD CONSTRAINT FK_GAMCOM_GamesID foreign key (GamesID) references GAMES (GamesID)
	ALTER TABLE	GAMCOM ADD CONSTRAINT FK_GAMCOM_NameC foreign key (NameC) references COMPANIES (NameC)

CREATE TABLE COMPANYBELONG(

	NameC nvarchar(20)not null , 
	GameNameBelong nvarchar(30) constraint PK_GameNameBelong primary key )
	ALTER TABLE	COMPANYBELONG ADD CONSTRAINT FK_COMPANYBELONG_NameC foreign key (NameC) references COMPANIES (NameC)

CREATE TABLE SPONSORS(

	SponsorID int identity(1,1) constraint PK_SponsorID primary key check (SponsorID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
	Company nvarchar(30) not null,
	Priority smallint not null,
	DateToPayDay smallint not null check (DateToPayDay >=0 AND DateToPayDay <=31),
	DateToPayMonth smallint not null check (DateToPayMonth >=0 AND DateToPayMonth <=12),
	DateToPayYear smallint not null check (DateToPayYear like '[0-9][0-9][0-9][0-9]'))


CREATE TABLE STREAMING(

	StreamID  int identity(1,1) constraint PK_StreamID primary key check (StreamID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TotalViews int not null check (TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	ActuallyViews int not null check (ActuallyViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	Title nvarchar(30) not null,
	Game nvarchar(20) not null,
	Uptime int not null check (Uptime like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Lenguaje varchar(30)not null,
	Rooms  smallint not null,
	Chat  nvarchar(1000)null,
	ChatMode  bit not null,
	EmotesChat bit not null,
	UserID int not null,
	GamesID int not null,
	SponsorID int  not null )
	ALTER TABLE	STREAMING ADD CONSTRAINT FK_STREAMING_UserID foreign key (UserID) references USERS (UserID)
	ALTER TABLE	STREAMING ADD CONSTRAINT FK_STREAMING_GamesID foreign key (GamesID) references GAMES (GamesID)
	ALTER TABLE	STREAMING ADD CONSTRAINT FK_STREAMING_SponsorID foreign key (SponsorID) references SPONSORS (SponsorID)

CREATE TABLE AGES(


	AgeNumber int constraint PK_AgeNumber primary key check (AgeNumber like '[0-9][0-9]'),

	UnderAge bit not null,
	Inapropiate bit not null)

CREATE TABLE CATEGORIESS(

	CategorySName nvarchar(20)constraint PK_CategorySName primary key, 
	FilterGame nvarchar(30) not null,
	FilterLenguage nvarchar(30) not null,
	FilterStreamer nvarchar(30) not null)

CREATE TABLE STRCATAGE(

	StrCatAgeID nvarchar(20)constraint PK_StrCatAgeID primary key, 
	CategorySName nvarchar(20)not null , 
	StreamID int not null , 
	AgeNumber int not null  )
	ALTER TABLE	STRCATAGE ADD CONSTRAINT FK_STRCATAGE_CategorySName foreign key (CategorySName) references CATEGORIESS (CategorySName)
	ALTER TABLE	STRCATAGE ADD CONSTRAINT FK_STRCATAGE_StreamID foreign key (StreamID) references STREAMING (StreamID)
	ALTER TABLE	STRCATAGE ADD CONSTRAINT FK_STRCATAGE_AgeNumber foreign key (AgeNumber) references AGES (AgeNumber)



CREATE TABLE VIDEOS(

	VideoID smallint identity(1,1) constraint PK_VideoID primary key check (VideoID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),  
	TotalViews int not null check (TotalViews like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	Title nvarchar(30) not null,
	Game nvarchar(20) not null,
	Time int not null check (Time like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),

	EmotesChat  bit not null,
	Thumbnail nvarchar(30) not null,
	UserID int not null , 
	StreamID int not null ) 
	ALTER TABLE	VIDEOS ADD CONSTRAINT FK_VIDEOS_UserID foreign key (UserID) references USERS (UserID)
	ALTER TABLE	VIDEOS ADD CONSTRAINT FK_VIDEOS_StreamID foreign key (StreamID) references STREAMING (StreamID)

CREATE TABLE COLLECTIONS(

	NameCollections  nvarchar(20)constraint PK_NameColections primary key, 
	NumOfVideos  int not null check (NumOfVideos  like '[0-9][0-9][0-9]'),
	DateDay  smallint not null check (DateDay >=0 AND DateDay <=31),

	DateMonth smallint not null check (DateMonth >=0 AND DateMonth <=12),
	DateYeaR smallint not null check (DateYear like '[0-9][0-9][0-9][0-9]'),

	NameVideo nvarchar(30) not null,
	UserID int not null )
	ALTER TABLE	COLLECTIONS ADD CONSTRAINT FK_COLLECTIONS_UserID foreign key (UserID) references USERS (UserID)

CREATE TABLE COLLVID(

	NameCollectionsV  nvarchar(20)constraint PK_NameColectionsV primary key,
	NameCollections  nvarchar(20) not null , 
	VideoID  smallint not null )
	ALTER TABLE	COLLVID ADD CONSTRAINT FK_COLLVID_NameCollections foreign key (NameCollections) references COLLECTIONS (NameCollections)
	ALTER TABLE	COLLVID ADD CONSTRAINT FK_COLLVID_VideoID foreign key (VideoID) references VIDEOS (VideoID)


CREATE TABLE CATEGORIESV(

	CategoryVName  nvarchar(20)constraint PK_CategoryVName primary key, 
	FilterGame nvarchar(30) not null,
	FilterLenguage nvarchar(30) not null,
	FilterStreamer nvarchar(30) not null)

CREATE TABLE AGEV(

	AgeVNumber  int constraint PK_AgeVNumber primary key, 
	UnderAge  bit not null check (UnderAge = 0 OR UnderAge = 1),
	Inapropiate  bit not null check (Inapropiate = 0 OR Inapropiate = 1))

CREATE TABLE VIDCATEAGE(

	VideoCatAgeId smallint identity(1,1) constraint PK_VideoCatAgeId primary key,
	VideoID  smallint not null , 
	CategoryVName nvarchar(20)not null , 
	AgeVNumber int not null)
	ALTER TABLE	VIDCATEAGE ADD CONSTRAINT FK_VIDCATEAGE_VideoID foreign key (VideoID) references VIDEOS (VideoID)
	ALTER TABLE	VIDCATEAGE ADD CONSTRAINT FK_VIDCATEAGE_CategoryVName foreign key (CategoryVName) references CATEGORIESV (CategoryVName)
	ALTER TABLE	VIDCATEAGE ADD CONSTRAINT FK_VIDCATEAGE_AgeVNumber foreign key (AgeVNumber) references AGEV (AgeVNumber)

CREATE TABLE ADDS(	

	AddID int identity(1,1) constraint PK_AddID primary key check (AddID like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'), 
	Longg  int not null check (longg > 0),
	Frecuency int not null check (Frecuency like '[0-9][0-9][0-9]'),
	StreamID int not null,
	Subscriber bit not null check (Subscriber = 0 OR Subscriber = 1))
	ALTER TABLE	VIDEOS ADD CONSTRAINT FK_ADDS_StreamID foreign key (StreamID) references STREAMING (StreamID)

CREATE TABLE ADDCOMPANY(

	AddCompanyID  int identity(1,1) not null constraint PK_AddCompanyID primary key, 
	CompanyName  nvarchar(30) not null,
	CompanyMoney nvarchar(30) not null,
	
	AddID int not null)
	ALTER TABLE	ADDCOMPANY ADD CONSTRAINT FK_ADDCOMPANY_AddID foreign key (AddID) references ADDS (AddID)



