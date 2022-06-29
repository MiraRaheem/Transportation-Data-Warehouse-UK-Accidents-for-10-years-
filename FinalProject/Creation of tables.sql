create table DateDim
(
	DateID       int not null PRIMARY KEY identity (1,1),
	Date_Time    DATETIME2 (3) NOT NULL,
	Date         DATETIME2(3) NOT NULL,
	Time         DATETIME2(7) NOT NULL,
	Hours        int not null,
	Minutes      int not null,
	Year         int not null,
	Month        int not null,
	Day          int not null,
	Day_name     varchar(10) not null,
	Month_name   varchar(15) not null
)


create table Location
(
LocationID               int NOT Null Primary key identity(1,1),
[Location_Easting_OSGR]  int not Null,
[Location_Northing_OSGR] int not Null,
[Longitude]              float not Null,
[Latitude]               float not Null,
[District]               nvarchar(225) not null,
[Highway]                nvarchar(225) not null
)

create Table AccidentConditionsDim
(
ConditionsID        int not null Primary Key identity(1,1),
Light_Conditions    nvarchar(225) not null,
Weather_Conditions  nvarchar(225) not null,
Officer_Attend      nvarchar(225) not null
)

Create Table AccidentFact
(
ID                    int not null Primary Key identity(1,1),
DateID                int not null,
LocationID            int not null,
AccidentConditionsID  int not null,
RoadID                int not null,
Accident_index        nvarchar(50) not null,
Accident_Severity     int not null,
Num_of_Vehicals       int not null,
Num_of_Casualties     int not null
)

create table RoadDim
(
	RoadID                     int not null Primary Key identity(1,1),
	Road_Surface               nvarchar(225) not null,
	Junction_Control           nvarchar(225) not null,
	Special_Conditions_at_Site nvarchar(225) not null,
	RoadType                   nvarchar(225) not null,
	SpeedLimit                 int not null
)