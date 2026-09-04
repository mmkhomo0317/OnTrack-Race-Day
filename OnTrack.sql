Create database OnTrack; 

use OnTrack;

Create table Operater (
UserId INT Identity(1,1)  Not Null,
FirstName VARCHAR(50)  Not Null,
LastName VARCHAR(50)  Not Null,
Email VARCHAR(20)  Not Null, 
PasswordHash VARCHAR(25)  Not Null, 
Role VARCHAR(20)  Not Null,
ProfilePicture_Url VARCHAR(100)  Not Null,
Constraint PK_Operater Primary Key (UserId),
Constraint UQ_User_Email Unique (Email),
Constraint CK_User_Role Check (Role IN ( 'Organiser', 'Participant'))
);

Create Table Event (
EventId INT Identity(1,1)  Not Null,
OrganiserId INT  Not Null,
Name VARCHAR(50)  Not Null, 
Description VARCHAR(MAX)  Null,
EventDate Date  Not Null,
Location  VARCHAR  Not Null,
Distance Decimal(6,2)  Not Null,
EventType VARCHAR(50)  Not Null,
BannerImage VARCHAR(100)  Null,
Constraint PK_Event Primary Key (EventId),
Constraint FK_Event_Organiser Foreign Key (OrganiserId)
	References Operater (UserId),
Constraint CK_Event_Type Check (EventType IN ('Run', 'Walk', 'Cycle'))
);

Create table Category (
CategoryId INT Identity(1,1)  Not Null,
EventId INT  Not Null,
Name VARCHAR(50)  Not Null,
Constraint PK_Category Primary Key (CategoryId),
Constraint FK_Category_Event Foreign Key (EventId)
	References Event(EventId)
	);

Create table Enrolment (
EnrolmentId INT Identity(1,1) Not Null,
ParticipantId INT  Not Null,
EventId INT  Not Null,
CategoryId INT Not Null,
Status VARCHAR(20)  Constraint DF_Enrolment_Status DEFAULT ('Pending'),
    EnrolmentDate   DATETIME  NOT NULL Constraint DF_Enrolment_Date DEFAULT (GETDATE()),
    Constraint PK_Enrolment PRIMARY KEY (EnrolmentId),
    Constraint FK_Enrolment_Participant Foreign Key (ParticipantId)
        References Operater (UserId),
    Constraint FK_Enrolment_Event Foreign Key (EventId)
        References Event(EventId),
    Constraint FK_Enrolment_Category Foreign Key (CategoryId)
        References Category(CategoryId),
    Constraint CK_Enrolment_Status CHECK (Status IN ('Pending', 'Approved', 'Rejected'))
);

Create table SupportingDocument (
DocumentId INT Identity(1,1)  Not Null,
EnrolmentId INT  Not Null,
FileUrl  VARCHAR(100)  Not Null,
UploadDate DateTime  Not Null Constraint DF_Document_Uploaded DEFAULT (GETDATE()),
    Constraint PK_SupportingDocument Primary Key (DocumentId),
    Constraint FK_Document_Enrolment Foreign Key (EnrolmentId)
        References dbo.Enrolment(EnrolmentId)
);

Create table Result (
ResultId INT Identity(1,1)  Not Null,
EnrolmentId INT  Not Null,
FinishTime INT Not Null,
FinishingPosition  INT Null,
PublishedDate DateTime  Null,
Constraint PK_Result PRIMARY KEY (ResultId),
Constraint UQ_Result_Enrolment UNIQUE (EnrolmentId),
Constraint FK_Result_Enrolment FOREIGN KEY (EnrolmentId)
References dbo.Enrolment(EnrolmentId)
);