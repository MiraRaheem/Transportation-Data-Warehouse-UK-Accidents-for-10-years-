
 Update [dbo].[Accidents]
 set [dbo].[Accidents].[Month] = MONTH([dbo].[Accidents].[Date])

ALTER TABLE [dbo].[Accidents]
ADD CONSTRAINT FK_Month
FOREIGN KEY ([Month]) REFERENCES  [dbo].[Month_of_Year] ([code]);



select Distinct Cast(((DATEADD(day, 0, DATEDIFF(day, 0,Date)) + DATEADD(day, 0 -
DATEDIFF(day, 0, cast(Time as datetime)), cast(Time as datetime)))) as datetime)
as 'DateTime',
Date, Time, YEAR(Date) as 'year', MONTH(Date) as 'month', DAY(Date) as 'day', DatePart (HOUR,[Time]) as 'hour' , DatePart ( MINUTE,[Time]) as 'minute',
[dbo].[Day_of_Week].[label] as 'day_of_week' ,[dbo].[Month_of_Year].[label] as 'month_name'

from Accidents , [Day_of_Week] , [dbo].[Month_of_Year]

where [dbo].[Month_of_Year].[code] = [dbo].[Accidents].[Month] and [dbo].[Day_of_Week].[code] = [Day_of_Week]

------------------------

Select Distinct(Cast([Longitude] as varchar(25)) + ' ' + cast([Latitude]as
varchar(25))) as combined, Longitude, Latitude, [Location_Easting_OSGR],
[Location_Northing_OSGR], [dbo].[LocalAuthority_District].[label] as 'District' , [dbo].[LocalAuthority_Highway].Label as 'Highway'
from Accidents , [dbo].[LocalAuthority_District] , [dbo].[LocalAuthority_Highway]

where [Local_Authority__District_] = [dbo].[LocalAuthority_District].code and [Local_Authority__Highway_] = [dbo].[LocalAuthority_Highway].[Code]

-------------------------

Select Distinct[dbo].[Light_Conditions].label as 'Light_Condition', [dbo].[Weather].label as
'Weather_Condition', [dbo].[PoliceOfficer_Attend].label as 'Officer_Attend'

from [dbo].[Accidents], [dbo].[Light_Conditions], [dbo].[Weather], [dbo].[PoliceOfficer_Attend]

where [dbo].[Accidents].Light_Conditions = [dbo].[Light_Conditions].code and 
	[dbo].[Accidents].[Weather_Conditions] = [dbo].[Weather].code and 
	[dbo].[Accidents].[Did_Police_Officer_Attend_Scene_of_Accident] = [dbo].[PoliceOfficer_Attend].code

--------------------------
select Distinct [dbo].[Road_Type].label as 'RoadType' ,[dbo].[Road_Surface].label as 'Road_Surface' ,[dbo].[Junction_Control].label as ' junction_Conrol', [dbo].[Special_Conditions_at_Site].label as 'Special_Conditions_at_Site', [Speed_limit]

from [dbo].[Accidents],[dbo].[Road_Surface],[dbo].[Special_Conditions_at_Site],[dbo].[Junction_Control], [dbo].[Road_Type]

where [dbo].[Accidents].Road_Surface_Conditions = [dbo].[Road_Surface].code and
		[dbo].[Accidents].Junction_Control = [dbo].[Junction_Control].code and
		[dbo].Accidents.Special_Conditions_at_Site = [dbo].[Special_Conditions_at_Site].code and
		[dbo].[Accidents].Road_Type = [dbo].[Road_Type].code
--------------------------

Select Accidents.Accident_Index, Accident_Severity, DateID, LocationID, ConditionsID, RoadID,
COUNT([Casualty_Reference]) as 'Num_of_Casualties',
COUNT(Vehicles.[Vehicle_Reference]) as 'Num_of_Vehicals'

from Accidents, DateDim, [dbo].[LocationDim] , AccidentConditionsDim, [dbo].[Vehicles],
[dbo].[Casualties], [dbo].[RoadDim], [dbo].[Light_Conditions], [dbo].[Weather], [dbo].[PoliceOfficer_Attend], [dbo].[Road_Surface],
[dbo].[Junction_Control],[dbo].[Road_Type], [dbo].[Special_Conditions_at_Site]

where  Accidents.Date = DateDim.Date And Accidents.Time = DateDim.Time AND 

		Accidents.Latitude = [dbo].[LocationDim].Latitude and Accidents.Longitude = [dbo].[LocationDim].Longitude And 

		Accidents.Light_Conditions = [dbo].[Light_Conditions].[code] AND 
		[dbo].[Light_Conditions].[label] = AccidentConditionsDim.Light_Conditions And 
		Accidents.[Weather_Conditions] = [dbo].[Weather].[code] AND 
		[dbo].[Weather].[label] = AccidentConditionsDim.[Weather_Conditions] AND
		Accidents.[Did_Police_Officer_Attend_Scene_of_Accident] = [dbo].[PoliceOfficer_Attend].[code] and
		[dbo].[PoliceOfficer_Attend].[label] = [dbo].[AccidentConditionsDim].[Officer_Attend] and
	
		Accidents.[Road_Surface_Conditions] = [dbo].[Road_Surface].[code] and 
		[dbo].[Road_Surface].[label] = [dbo].[RoadDim].[Road_Surface] and
		Accidents.[Junction_Control] = [dbo].[Junction_Control].[code] and
		[dbo].[Junction_Control].[label] = [dbo].[RoadDim].[Junction_Control] and
		Accidents.Special_Conditions_at_Site = [dbo].[Special_Conditions_at_Site].[code] and
		[dbo].[Special_Conditions_at_Site].label = [dbo].[RoadDim].Special_Conditions_at_Site and
		Accidents.[Road_Type] = [dbo].[Road_Type].[code] and
		[dbo].[Road_Type].label = [dbo].[RoadDim].[RoadType] And 
		Accidents.[Speed_limit] = [dbo].[RoadDim].[SpeedLimit] AND 

		Accidents.Accident_Index = Vehicles.Accident_Index And 
		Accidents.Accident_Index = Casualties.Accident_Index

	Group By Accidents.Accident_Index, Accident_Severity, DateID, LocationID, ConditionsID, RoadID