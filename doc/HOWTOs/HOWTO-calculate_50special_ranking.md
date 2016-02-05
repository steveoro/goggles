## HOWTO: calculate 50special ranking for 2015/2016 CSI season:

The task will calculate standard points and create a csv file with 50special ranking

Use the dedicated rake task and launch it in devel environment without persist data.

Always force the calculation on M25 category type and 25 pool type.

The csv output files should opened considering comma (,) as separator
and not the (;) because used in the spreadshit formulas

The csv output contains two addictional columns with formulas
that evidentiates qualified swimmers. 
Moving the 'X' in the Qualified column will automatic report changes
in the formulas colomns.

Needs the meeting id.
2015/2016 season is the 151 and csi meetings are form 15101 to 15106.
To find meeting id use:

    > zeus rake ut:find_meeting_by_code code=csiprova1

where csiprova1 is the name of the meeting  

#### For info, see:

    > zeus rake -D db:meeting_standard_points


#### Example for meeting csiprova1 (15101)

    > zeus rake db:meeting_standard_points meeting=15101 recalculate=true use_category=M25 use_pool=25 rank=true


