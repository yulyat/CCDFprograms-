sort county providertype begindat2 
local rates reimburseweeklyfull1 reimburseweeklypart1 reimburseweeklyfull2 reimburseweeklypart2 
format %9.0g `rates'

format %-28.0g county providertype providersubtype
list county  providertype providersubtype begindat2 `rates' if state == 9, noobs sepby(county) ab(5) table 


