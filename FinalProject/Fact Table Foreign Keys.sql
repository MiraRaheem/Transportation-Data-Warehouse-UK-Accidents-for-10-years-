ALTER TABLE [dbo].[AccidentFact]
ADD CONSTRAINT FK_Date
    FOREIGN KEY ([DateID]) REFERENCES [dbo].[DateDim] ([DateID])
    On delete cascade;

ALTER TABLE [dbo].[AccidentFact]
ADD CONSTRAINT FK_Location
    FOREIGN KEY ([LocationID]) REFERENCES [dbo].[LocationDim] ([LocationID])
    On delete cascade;

ALTER TABLE [dbo].[AccidentFact]
ADD CONSTRAINT FK_Conditions
    FOREIGN KEY ([AccidentConditionsID]) REFERENCES [dbo].[AccidentConditionsDim] ([ConditionsID])
    On delete cascade;


ALTER TABLE [dbo].[AccidentFact]
ADD CONSTRAINT FK_Accident_Severity
    FOREIGN KEY ([Accident_Severity]) REFERENCES [dbo].[Accident_Severity] ([code])
    On delete cascade;

ALTER TABLE [dbo].[AccidentFact]
ADD CONSTRAINT FK_Road
    FOREIGN KEY ([RoadID]) REFERENCES [dbo].[RoadDim] ([RoadID])
    On delete cascade;

