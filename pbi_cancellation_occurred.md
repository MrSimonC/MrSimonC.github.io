# Power BI Refresh not working after publishing
"Cancellation occurred when sending or receiving a request" or a more technical "GatewayPipelineErrorCode=DM_GWPipeline_Gateway_SpooledOperationMissing" error occuring when refreshing data from PowerBI website will mask the true problem of either duplicates in an ID column, or for me, dates which aren't valid in the cloud:

## Fix
I removed all tables and added them back in one by one. The error changed to an OleAut date error in a certain table.

[From this reference](https://msdn.microsoft.com/en-us/library/system.datetime.fromoadate(v=vs.110).aspx) I found any date on or before 30/12/1899 (e.g. 11/12/1089) would cause an error. Replacing/removing these would cause the whole original report to work. In query editor, order your date field to find the problem dates.

As values can be introduced to your Dataset over time, replacing each one isn't a good solution. I've come up with the following M code which you can add to your query editor (Query Editor, View, Advanced Editor) to remove any dates which will cause this error:

```m
#"Remove inappropriate dates" = Table.TransformColumns(PREVIOUS_STEP_OR_TABLE_NAME, {"COLUMN_TO_AFFECT", each if _ < #date(1900, 1, 1) then #date(1900, 1, 1) else _}),
```

real-life-example:

```m
e.g. #"Remove inappropriate dates" = Table.TransformColumns(dbo_tblAccounts, {"DOB", each if _ < #date(1900, 1, 1) then #date(1900, 1, 1) else _}),
Remember to take off any filters/sorting you introduced whilst diagnosing your issue!
```

Hope this helps someone!