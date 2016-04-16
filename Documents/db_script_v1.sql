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
    PRIMARY KEY(Id),
    UNIQUE (Name)
);

CREATE TABLE Videos(
	Id INT AUTO_INCREMENT NOT NULL,
    Name VARCHAR(200) NOT NULL,
    Filename VARCHAR(200) NOT NULL,
    GenreId INT NOT NULL,
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
    FOREIGN KEY (GenreId) REFERENCES Genres(Id)
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

CREATE TABLE VideosStatusCount(
    Pending INT NOT NULL,
    Processsing INT NOT NULL,
    Successed INT NOT NULL,
    Failed INT NOT NULL
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
    DECLARE TProcesssing integer;
    DECLARE TSuccessed integer;
	DECLARE TFailed integer;

    SET @TPending := (SELECT COUNT(*) FROM Videos WHERE Status = 0);
	UPDATE VideosStatusCount SET Pending = @TPending;
    
	SET @TProcesssing := (SELECT COUNT(*) FROM Videos WHERE Status = 1);
	UPDATE VideosStatusCount SET Processsing = @TProcesssing;
	
    SET @TSuccessed := (SELECT COUNT(*) FROM Videos WHERE Status = 2);
    UPDATE VideosStatusCount SET Successed = @TSuccessed;
	
    SET @TFailed := (SELECT COUNT(*) FROM Videos WHERE Status = 3);
	UPDATE VideosStatusCount SET Failed = @TFailed;
END;

delimiter //
CREATE TRIGGER CountVideoStatus 
AFTER INSERT ON Videos FOR EACH ROW
BEGIN
   CALL UpdateCounts();
END//
