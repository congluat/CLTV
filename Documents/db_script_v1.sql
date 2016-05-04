DROP database CLMOVIE_DB;

CREATE DATABASE CLMOVIE_DB;

USE CLMOVIE_DB;

CREATE TABLE Users(
	Id INT  AUTO_INCREMENT NOT NULL,
    Username VARCHAR(20)  NOT NULL,
    Password VARCHAR(40) NOT NULL,
    Email VARCHAR(40) NOT NULL,
    DoB VARCHAR(8) NOT NULL,
    Status INT NOT NULL,
    Time DATETIME NOT NULL,
    PRIMARY KEY (Id),
    UNIQUE (Username, Email)
);

CREATE TABLE Permissions(
	Id INT AUTO_INCREMENT NOT NULL,
    Controller VARCHAR(200) NOT NULL,
	PRIMARY KEY (Id),
    UNIQUE (Controller)
);

CREATE TABLE UserPermissions(
	Id INT AUTO_INCREMENT NOT NULL,
    UserId INT NOT NULL,
    PermissionId INT NOT NULL,
    IsAllow BIT NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(UserId) REFERENCES Users(Id),
    FOREIGN KEY(PermissionId) REFERENCES Permissions(Id)
);


CREATE TABLE Genres(
	Id INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(40) NOT NULL,
    photo NVARCHAR(200) ,
    PRIMARY KEY(Id),
    UNIQUE (Name)
);

CREATE TABLE Types(
	Id INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Photo VARCHAR(400),
    PRIMARY KEY (Id),
	UNIQUE (Name)
);


CREATE TABLE Videos(
	Id INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Filename VARCHAR(200) NOT NULL,
    Trailer VARCHAR(200),
    IsYoutube BIT NOT NULL,
    GenreId INT NOT NULL,
    TypeId INT NOT NULL,
    UserId INT NOT NULL,
    Director VARCHAR(200),
    Stars VARCHAR(200),
    Decrtn VARCHAR(800),
    Imdb FLOAT,
    Poster VARCHAR(200),
    Country VARCHAR(40),
    Language VARCHAR(40),
    Tlike INT NOT NULL,
    Tview INT NOT NULL,
    Status INT NOT NULL,
    Time DATETIME NOT NULL,
    PRIMARY KEY (Id),
    UNIQUE (Filename),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (GenreId) REFERENCES Genres(Id),
	FOREIGN KEY (TypeId) REFERENCES Types(Id)
);

CREATE TABLE VideosLikes(
	Id INT AUTO_INCREMENT NOT NULL,
    UserId INT NOT NULL,
    VideoId INT NOT NULL,
    Time DATETIME NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (VideoId) REFERENCES Videos(Id)
);

CREATE TABLE VideosViews(
	Id INT AUTO_INCREMENT NOT NULL,
    UserId INT NULL,
    VideoId INT NOT NULL,
    Time DATETIME NOT NULL,
    PRIMARY KEY(Id),
	FOREIGN KEY (UserId) REFERENCES Users(Id),
    FOREIGN KEY (VideoId) REFERENCES Videos(Id)
);

CREATE TABLE VideosStatusCounts(
	Id INT AUTO_INCREMENT NOT NULL,
    Pending INT,
    Processing INT,
    Successed INT,
    Failed INT,
	PRIMARY KEY(Id)
);

CREATE TABLE VideoComments(
	Id INT AUTO_INCREMENT NOT NULL,
	VideoId INT NOT NULL,
    UserId INT NOT NULL,
	Content VARCHAR(400) NOT NULL,
    Time DATETIME NOT NULL,
    PRIMARY KEY(Id),
    FOREIGN KEY(VideoId) REFERENCES Videos(Id),
    FOREIGN KEY(UserId) REFERENCES Users(Id)
);

/*
CREATE TRIGGER CountVideoStatus 
	AFTER INSERT ON Videos FOR EACH ROW
    BEGIN
    
		UPDATE VideosStatusCount SET Pending = (SELECT COUNT(*) FROM Videos WHERE Status = 0);
        
        UPDATE VideosStatusCount SET Processsing = (SELECT COUNT(*) FROM Videos WHERE Status = 1 );
        
		UPDATE VideosStatusCount SET Successed = (SELECT COUNT(*) FROM Videos WHERE Status = 2 );
		
        UPDATE VideosStatusCount SET Failed = (SELECT COUNT(*) FROM Videos WHERE Status = 3 );
        
    END;
*/
delimiter //

CREATE PROCEDURE UpdateCounts()
BEGIN
	DECLARE TPending integer;
    DECLARE TProcessing integer;
    DECLARE TSuccessed integer;
	DECLARE TFailed integer;

    SET @TPending := (SELECT COUNT(*) FROM Videos WHERE Status = 0);
	UPDATE VideosStatusCounts SET Pending = @TPending;
    
	SET @TProcesssing := (SELECT COUNT(*) FROM Videos WHERE Status = 1);
	UPDATE VideosStatusCounts SET Processing = @TProcessing;
	
    SET @TSuccessed := (SELECT COUNT(*) FROM Videos WHERE Status = 2);
    UPDATE VideosStatusCounts SET Successed = @TSuccessed;
	
    SET @TFailed := (SELECT COUNT(*) FROM Videos WHERE Status = 3);
	UPDATE VideosStatusCounts SET Failed = @TFailed;
END;

delimiter //
CREATE TRIGGER CountVideoStatus 
AFTER INSERT ON Videos FOR EACH ROW
BEGIN
   CALL UpdateCounts();
END//

/*DROP PROCEDURE UpdateCounts*/
/*DROP TRIGGER CountVideoStatus */

INSERT INTO Users(Id, Username, Password,Email, DoB, status,Time) values (0, 'guest', '123','guest','00000000',1,'2000-01-01 00:00:00');
UPDATE `clmovie_db`.`Users` SET `Id`='0' WHERE `Id`='1';


INSERT INTO VideosStatusCounts(Pending,Processing,Successed,Failed) VALUES(0,0,0,0);

INSERT INTO Types(name, photo) values('Phim bộ', 'phimbo.png');
INSERT INTO Types(name, photo) values('Phim lẻ', 'phimle.png');
INSERT INTO Types(name, photo) values('MV âm nhạc', 'amnhac.png');
INSERT INTO Types(name, photo) values('Phim lẻ', 'phimle.png');
INSERT INTO Types(name, photo) values('Loại khác', 'khac.png');
INSERT INTO Types(name, photo) values('Phim ngắn của ngành Quản Trị Công Nghệ & Truyền Thông', '');
INSERT INTO Types(name, photo) values('Phim ngắn trong nước', '');
INSERT INTO Types(name, photo) values('Phim ngắn nước ngoài', '');
INSERT INTO Types(name, photo) values('TCV ngành Quản Trị Công Nghệ & Truyền Thông', '');
INSERT INTO Types(name, photo) values('TCV và clip hài hay trong nước và ngoài nước', '');



INSERT INTO Genres(name, photo) values('Phim hành động', 'phimhanhdong.png');
INSERT INTO Genres(name, photo) values('Phim 18+', 'phim18.png');
INSERT INTO Genres(name, photo) values('Phim hài', 'phimhai.png');
INSERT INTO Genres(name, photo) values('Loại khác', 'khac.png');

INSERT INTO Permissions(Controller) values('/Videos/upload');
INSERT INTO Permissions(Controller) values('/Videos/listVideos');
INSERT INTO Permissions(Controller) values('/Videos/edit');
