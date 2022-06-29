ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT PK_AccidentIndex
    PRIMARY KEY ([Accident_Index])

ALTER TABLE [dbo].[Accident_Severity]
ADD CONSTRAINT PK_AccidentSeverity
    PRIMARY KEY ([code])

	
ALTER TABLE [dbo].[LocalAuthority_District]
ADD CONSTRAINT PK_LocalAuthority_District
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[LocalAuthority_Highway]
ADD CONSTRAINT PK_LocalAuthority_Highway
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Junction_Control]
ADD CONSTRAINT PK_JunctionControl
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Light_Conditions]
ADD CONSTRAINT PK_LightConditions
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Weather]
ADD CONSTRAINT PK_WeatherConditions
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Road_Surface]
ADD CONSTRAINT PK_RoadSurfaceConditions
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Special_Conditions_at_Site]
ADD CONSTRAINT PK_SpecialConditionsAtSite
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Day_of_Week]
ADD CONSTRAINT PK_DayOfWeek
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[PoliceOfficer_Attend]
ADD CONSTRAINT PK_OfficerAttendScene
    PRIMARY KEY ([code])

ALTER TABLE [dbo].[Casualties]
ADD CONSTRAINT PK_PartPK
    PRIMARY KEY ([Accident_Index],[Vehicle_Reference],[Casualty_Reference])


ALTER TABLE [dbo].[Vehicles]
ADD CONSTRAINT PK_Vehicles
    PRIMARY KEY ([Accident_Index],[Vehicle_Reference])

ALTER TABLE [dbo].[Road_Type]
ADD CONSTRAINT PK_Road_Type
    PRIMARY KEY ([code])


ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_AccidentSeverity
    FOREIGN KEY ([Accident_Severity]) REFERENCES [dbo].[Accident_Severity]([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_LocalAuthority_District
    FOREIGN KEY ([Local_Authority__District_]) REFERENCES [dbo].[LocalAuthority_District] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_LocalAuthority_Highway
    FOREIGN KEY ([Local_Authority__Highway_]) REFERENCES [dbo].[LocalAuthority_Highway] ([Code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_JunctionControl
    FOREIGN KEY ([Junction_Control]) REFERENCES [dbo].[Junction_Control] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_LightConditions
    FOREIGN KEY ([Light_Conditions]) REFERENCES [dbo].[Light_Conditions] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_WeatherConditions
    FOREIGN KEY ([Weather_Conditions]) REFERENCES [dbo].[Weather] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_RoadSurfaceConditions
    FOREIGN KEY ([Road_Surface_Conditions]) REFERENCES [dbo].[Road_Surface] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_SpecialConditionsAtSite
    FOREIGN KEY ([Special_Conditions_at_Site]) REFERENCES [dbo].[Special_Conditions_at_Site] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_DayOfWeek
    FOREIGN KEY ([Day_of_Week]) REFERENCES [dbo].[Day_of_Week] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_OfficerAttendScene
    FOREIGN KEY ([Did_Police_Officer_Attend_Scene_of_Accident]) REFERENCES [dbo].[PoliceOfficer_Attend] ([code])
    On delete cascade;

ALTER TABLE [dbo].[Casualties]
ADD CONSTRAINT FK_PartPK
    FOREIGN KEY ([Accident_Index],[Vehicle_Reference]) REFERENCES [dbo].[Vehicles] ([Accident_Index],[Vehicle_Reference])
    On delete cascade;


ALTER TABLE [dbo].[Vehicles]
ADD CONSTRAINT FK_AccidentIndex
    FOREIGN KEY ([Accident_Index]) REFERENCES [dbo].[Accidents] ([Accident_Index])
    On delete cascade;

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_RoadType
    FOREIGN KEY ([Road_Type]) REFERENCES [dbo].[Road_Type]([code])
    On delete cascade;


----------------------

