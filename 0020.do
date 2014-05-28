/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 34902
 |       CHILD CARE AND DEVELOPMENT FUND (CCDF) POLICIES DATABASE,
 |                                  2012
 |                (DATASET 0020: REIMBURSEMENT RATES DATA)
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 34902-0020-statasetup.do)

 | ReimburseBase - This is the record with the base reimbursement rates for this type of provider for the Book of Tables.
 | ReimburseHigh - This is the record with the highest reimbursement rates for this type of provider for the Book of Tables.
 |  
  For each of the above variables, there are six values, one each for age groups 1 through 5, and one for school age summer care (SC):
 | ReimburseHourly
 | ReimburseDailyFull
 | ReimburseDailyPart
 | ReimburseWeeklyFull
 | ReimburseWeeklyPart
 | ReimburseMonthlyFull
 | ReimburseMonthlyPart

 | Table: Reimbursement Rates for Before-and-After Care
 |    
 For each of the above variables, there are four values: hourly, daily, weekly, and monthly.
 | BeforeAfterCare
 | BeforeCare
 | AfterCare

 | ReimburseSchoolClose - If there is a different rate for schoolage children for days when school is closed during the school year.
 | ReimburseSchoolCloseDescribe - If there is a different rate for school closings, the description of those rates.
 | ReimburseSpecialNeedsRate - If there are different reimbursement rates for special needs children.
 | ReimburseOtherRates - If the state uses any other rates.
 | ReimburseOtherRatesDescribe If the state uses any other rates, the description of those rates.
 |
 ReimburseBase ReimburseHigh ReimburseHourly ReimburseDailyFull ReimburseWeeklyFull ReimburseWeeklyPart ReimburseMonthlyFull ReimburseMonthlyPart
 BeforeAfterCare BeforeCare AfterCare ReimburseSchoolClose ReimburseSchoolCloseDescribe ReimburseSpecialNeedsRate ReimburseOtherRates ReimburseOtherRatesDescribe
 **************************************************************************/
/*
* code for creating local for relavent variables in this dataset

local reimburse reimbursehourly reimbursedailyfull reimburseweeklyfull reimburseweeklypart reimbursemonthlyfull reimbursemonthlypart
foreach var of local reimburse {
  local `var' `var'1 - `var'5 `var'sc  
}

local care beforeaftercare beforecare aftercare
foreach var of local care{
 local `var' `var'time `var'hourly `var'daily `var'weekly `var'monthly
}


 local keepers reimbursebase reimbursehigh `reimbursehourly' `reimbursedailyfull' `reimburseweeklyfull' `reimburseweeklypart' `reimbursemonthlyfull' `reimbursemonthlypart' `beforeaftercare' `beforecare' `aftercare' reimburseschoolclose reimburseschoolclosedescribe reimbursespecialneedsrate reimburseotherrates reimburseotherratesdescribe
*/

clear
set more off  

*******************************************************/
global Nm  `"20"'
global d_root `"/Users/truskinovsky/Documents/Prospectus/CCDF data"'
global d_working `"$d_root/CCDF working"'
global d_file `"$d_root/ICPSR_34902/DS00$Nm"' 
global raw_data `"$d_file/34902-00$Nm-Data.txt"'
global dict `"$d_file/34902-00$Nm-Setup.dct"'
global outfile `"$d_working/clean data/DS00${Nm}new.dta"'
global statelist `"$d_working/clean data/statelist.dta"'
global panelfile `"$d_working/clean data/panelfile.dta"'

global outfilePTall `"$d_working/clean data/DS00${Nm}newPTall.dta"'
global outfilePT1 `"$d_working/clean data/DS00${Nm}newPT1.dta"'
global outfilePT2 `"$d_working/clean data/DS00${Nm}newPT2.dta"'
global outfilePT3 `"$d_working/clean data/DS00${Nm}newPT3.dta"'
global outfilePT4 `"$d_working/clean data/DS00${Nm}newPT4.dta"'

global bigfile `"$d_working/clean data/DS00${Nm}newbigfile.dta"'
global bigfilePTall `"$d_working/clean data/DS00${Nm}newbigfilePTall.dta"'
global bigfilePT1 `"$d_working/clean data/DS00${Nm}newbigfilePT1.dta"'
global bigfilePT2 `"$d_working/clean data/DS00${Nm}newbigfilePT2.dta"'
global bigfilePT3 `"$d_working/clean data/DS00${Nm}newbigfilePT3.dta"'
global bigfilePT4 `"$d_working/clean data/DS00${Nm}newbigfilePT4.dta"'

global log `"$d_working/log/D00$Nm -`c(current_date)'.smcl"'

/********************************************************

Section 2: Infile Command

**********************************************************/

clear
set more off
capture log close
log using "$log", replace
infile using "$dict", using ("$raw_data") clear


 

/*********************************************************

section 3: value label definitions
this section defines labels for the individual values of each variable.
we suggest that users do not modify this section.

**********************************************************/

rename *, l 


label data "Child Care and Development Fund (CCDF) Policies Database, 2012, Reimbursement Rates Data"

#delimit ;
label define STATE     1 "Alabama" 2 "Alaska" 4 "Arizona" 5 "Arkansas"
                       6 "California" 8 "Colorado" 9 "Connecticut"
                       10 "Delaware" 11 "District of Columbia" 12 "Florida"
                       13 "Georgia" 15 "Hawaii" 16 "Idaho" 17 "Illinois"
                       18 "Indiana" 19 "Iowa" 20 "Kansas" 21 "Kentucky"
                       22 "Louisiana" 23 "Maine" 24 "Maryland"
                       25 "Massachusetts" 26 "Michigan" 27 "Minnesota"
                       28 "Mississippi" 29 "Missouri" 30 "Montana"
                       31 "Nebraska" 32 "Nevada" 33 "New Hampshire"
                       34 "New Jersey" 35 "New Mexico" 36 "New York"
                       37 "North Carolina" 38 "North Dakota" 39 "Ohio"
                       40 "Oklahoma" 41 "Oregon" 42 "Pennsylvania"
                       44 "Rhode Island" 45 "South Carolina"
                       46 "South Dakota" 47 "Tennessee" 48 "Texas" 49 "Utah"
                       50 "Vermont" 51 "Virginia" 53 "Washington"
                       54 "West Virginia" 55 "Wisconsin" 56 "Wyoming"
                       60 "American Samoa" 66 "Guam"
                       69 "Northern Mariana Islands" 72 "Puerto Rico"
                       78 "Virgin Islands" ;
label define COUNTY    1 "All Counties" 2 "All Counties" 3 "All Counties"
                       4 "All Counties" 5 "All Counties" 6 "All Counties"
                       7 "All Counties" 8 "All Counties" 9 "All Counties"
                       10 "All Counties" 11 "All Counties" 12 "All Counties"
                       13 "All Counties" 14 "All Counties" 15 "All Counties"
                       16 "All Counties" 17 "All Counties" 18 "All Counties"
                       19 "All Counties" 20 "All Counties" 21 "All Counties"
                       22 "All Counties" 23 "All Counties" 24 "All Counties"
                       25 "All Counties" 26 "All Counties" 27 "All Counties"
                       28 "All Counties" 29 "All Counties" 30 "All Counties"
                       31 "All Counties" 32 "All Counties" 33 "All Counties"
                       34 "All Counties" 35 "All Counties" 36 "All Counties"
                       37 "All Counties" 38 "All Counties" 39 "All Counties"
                       40 "All Counties" 41 "All Counties" 42 "All Counties"
                       43 "All Counties" 44 "All Counties" 45 "All Counties"
                       46 "All Counties" 47 "All Counties" 48 "All Counties"
                       49 "All Counties" 50 "All Counties" 51 "All Counties"
                       52 "All Counties" 53 "All Counties" 54 "All Counties"
                       55 "All Counties" 56 "All Counties" 57 "All Counties"
                       58 "All Counties" 59 "All Counties" 60 "All Counties"
                       61 "test2 county" 62 "test3 county"
                       63 "Birmingham Region" 64 "Huntsville Region"
                       65 "Mobile Region" 66 "Montgomery Region"
                       67 "Opelika Region" 68 "Tuscaloosa Region"
                       69 "Ft. Payne Region" 70 "Talladega Region"
                       71 "Dothan Region" 72 "Denver" 73 "Zone 1" 74 "Zone 2"
                       75 "Zone 3" 76 "Group 1A" 77 "Group 1B" 78 "Group 2"
                       79 "Region 1" 80 "Region 2" 81 "Region 3"
                       82 "Region 4" 83 "Region 5" 84 "Region 6"
                       85 "Region 7" 86 "Marion" 87 "Billings Region"
                       88 "Bozeman Region" 89 "Butte Region"
                       90 "Glasgow Region" 91 "Glendive Region"
                       92 "Great Falls Region" 93 "Havre Region"
                       94 "Helena Region" 95 "Kalispell Region"
                       96 "Lewiston Region" 97 "Miles City Region"
                       98 "Missoula Region" 99 "Out of State" 100 "Clark"
                       101 "Washoe" 102 "Carson" 103 "Douglas"
                       104 "Rural Counties" 105 "Eastern Region"
                       106 "North Central Region" 107 "Northwest Region"
                       108 "South Central Region" 109 "Southwest Region"
                       110 "District I" 111 "District II" 112 "District III"
                       113 "District IV" 114 "District V" 115 "District VI"
                       116 "Anchorage" 117 "Fairbanks" 118 "Gulf Coast"
                       119 "Interior" 120 "Juneau"
                       121 "Matanuska-Susitna Valley" 122 "Northern"
                       123 "Southeast" 124 "Southwest" 125 "Group Area A"
                       126 "Group Area B" 127 "Group Area C" 128 "Group I"
                       129 "Group II" 130 "Group III" 131 "Montgomery"
                       132 "Richmond" 133 "Roanoke" 134 "Virginia Beach"
                       135 "Fairfax" 136 "Lancaster and Dakota Counties"
                       137 "Douglas and Sarpy Counties"
                       138 "Lancaster, Dakota, Douglas, and Sarpy Counties"
                       139 "All Other Counties" 140 "Minnehaha County"
                       141 "Baltimore City" 142 "Region U" 143 "Region V"
                       144 "Region W" 145 "Region X" 146 "Region Y"
                       147 "Region Z" 148 "Metro" 149 "Rural" 150 "Hennepin"
                       151 "St. Louis County" 152 "Urban Counties"
                       153 "Rural Counties"
                       154 "Central Region Urban Counties"
                       155 "Central Region Non-Urban Counties"
                       156 "East Region Urban Counties"
                       157 "East Region Non-Urban Counties"
                       158 "West Region Urban Counties"
                       159 "West Region Non-Urban Counties"
                       160 "Philadelphia" 161 "Region 1" 162 "Region 2"
                       163 "Region 3" 164 "Region 4" 165 "Region 5"
                       166 "Region 6" 167 "Shelter Area I"
                       168 "Shelter Area II" 169 "Shelter Area III"
                       170 "Shelter Area IV" 171 "Shelter Area V"
                       172 "Shelter Area VI" 173 "New Castle" 174 "Kent"
                       175 "Sussex" 176 "Milwaukee" 177 "Top 21"
                       178 "Other 74" 179 "Standard Area" 180 "Metro Area"
                       181 "Enhanced Area" 182 "Miami-Dade" 183 "Region 1"
                       184 "Spokane County" 185 "Region 2" 186 "Region 3"
                       187 "Region 4" 188 "Region 5" 189 "Region 6"
                       190 "Cuyahoga" 191 "Los Angeles"
                       192 "Gulf Coast Region" 193 "Sedgwick"
                       194 "Mecklenburg" 195 "New York City" 196 "Top Tier"
                       197 "Lower Tier" 198 "Cumberland"
                       199 "Group E Counties" 200 "Pulaski" ;
label define PROGRAM   1 "Unspecified" 2 "NA" 3 "All" 4 "Care 4 Kids"
                       5 "Employment-Related Day Care (ERDC)"
                       6 "Child Care Subsidy Program"
                       7 "Colorado Child Care Assistance Program (CCCAP)"
                       8 "Child Care"
                       9 "Childcare and Parent Services (CAPS)"
                       10 "Child Care Assistance Program" 11 "CCDF Program"
                       12 "Idaho Child Care Program (ICCP)"
                       13 "Child Care Assistance (CCA)"
                       14 "Best Beginnings Child Care Scholarship Program"
                       18 "California Alternative Payment Programs"
                       19 "Child Care Certificate Program"
                       20 "Subsidized Child Care Program"
                       21 "Child Care Program"
                       22 "Child Care Subsidy and Services"
                       23 "Purchase of Care" 24 "NH Child Care Scholarship"
                       25 "Subsidized Child Care" 26 "Child Care Assistance"
                       27 "Early Education and Care Financial Assistance"
                       28 "ABC Child Care Program"
                       29 "Child Development and Care (CDC)"
                       30 "Wisconsin Shares Child Care"
                       31 "Child Care Services"
                       32 "Working Connections Child Care (WCCC)"
                       33 "School Readiness"
                       34 "Workforce Solutions Child Care"
                       35 "Publicly Funded Child Care"
                       36 "Child Care Financial Assistance Program"
                       37 "Child Care and Development Block Grant Program"
                       38 "Child Care and Development Program"
                       39 "DHHS Child Care Subsidy"
                       40 "Child Care Works Subsidized Child Care"
                       41 "Child Care Connection Hawaii"
                       42 "Child Care Subsidy"
                       43 "Child Care Payment Program"
                       44 "DCCA Child Care and Development Fund Program" ;
label define FAMILYGROUP 1 "Unspecified" 2 "TANF Recipients"
                       3 "Families with special needs children" 4 "CPS Cases"
                       5 "Foster Care Cases"
                       6 "Families with 1 child in care"
                       7 "Families with 2 children in care"
                       8 "Families with 3 children in care"
                       9 "CalWORKS Stage 2" 10 "CalWORKS Stage 3"
                       11 "Alternative Payment (Non CalWORKS)"
                       12 "Low Income Families" 13 "Transitional Child Care"
                       14 "Families with 1 child in care under 2"
                       15 "Families with 1 child in care over 2"
                       16 "Families with 2 children in care (1 under 2 and one over 2)"
                       17 "Families with 3 children in care (1 under 2 and 2 over 2)"
                       18 "Families without special needs children"
                       19 "Familes without special needs children: 1 child in care"
                       20 "Families without special needs children: 2 children in care"
                       21 "Families without special needs children: more than 2 children in care"
                       22 "Families with special needs children: 1 child in care"
                       23 "Families with special needs children: 2 children in care"
                       24 "Families with special needs children: more than 2 children in care"
                       25 "Families with 2 or more children in care"
                       26 "Non-TCC Families"
                       27 "Families with 1 child in care, school age"
                       28 "Families with 2 or more children in care, all school age"
                       29 "Families with 1 child in care, not school age"
                       30 "Families with 2 or more children in care that are not school age"
                       31 "Families with 2 or more children in care, 1 full time and the rest part time"
                       32 "Non-TANF, Non-TCC Families" 98 "All" 99 "NA" ;
label define PROVIDERTYPE 1 "Center" 2 "Family Child Care Home" 3 "In-Home"
                       4 "Group Family Child Care Home" 98 "All" 99 "NA" ;
label define PROVIDERSUBTYPE 0 "NA" 1 "Licensed" 2 "Accredited" 3 "License-Exempt"
                       4 "Religion-Sponsored" 5 "No Rating"
                       6 "Certified in CPR" 7 "Rating 0-1" 8 "Rating 2"
                       9 "Rating 3" 10 "Rating 4" 11 "Tier 1" 12 "Tier 2"
                       13 "Tier 3" 14 "Unlicensed" 15 "Standard"
                       16 "Enhanced" 17 "Registered" 18 "Certified"
                       19 "Nonregistered" 20 "Level 1" 21 "Level 2"
                       22 "Unaccredited" 23 "InformalRelative" 24 "All"
                       25 "Unregulated" 26 "Regulated" 27 "Non-Certified"
                       28 "Self-Certified" 29 "Non-Contract License-Exempt"
                       30 "Non-Contract Licensed" 31 "Contract"
                       32 "Licensed Unaccredited" 33 "Licensed Accredited"
                       34 "Non-Licensed Unaccredited"
                       35 "Non-Licensed Accredited" 36 "Licensed 2-Star"
                       37 "Licensed 3-Star" 38 "Licensed 4-Star"
                       39 "Licensed 5-Star" 40 "Regulated Faith Based"
                       41 "Level AA" 42 "Level A" 43 "Level BB" 44 "Level B"
                       45 "Level CC" 46 "Level C" 47 "Star 2" 48 "Star 3"
                       49 "Star 4" 50 "Tier 4" 51 "Relative Home"
                       52 "Day Care Aide" 53 "Level 3" 54 "Level 4"
                       55 "Provisionally Certified (Level II)"
                       56 "Regularly Certified (Level I)" 57 "One Star Plus"
                       58 "One Star" 59 "Two Star" 60 "Three Star"
                       61 "Certified Professional"
                       62 "Certified Limited (AI)"
                       63 "Certified Limited (PPI)" 64 "Systems Tier 1"
                       65 "Systems Tier 2" 66 "Systems Tier 3"
                       67 "Systems Tier 4" 68 "Non-Systems Tier 1"
                       69 "Non-Systems Tier 2" 70 "Non-Systems Tier 3"
                       71 "Non-Systems Tier 4" 72 "Systems" 73 "Non-Systems"
                       74 "Licensed 1-Star" 75 "Gold Seal"
                       76 "Licensed or Exempt" 77 "Informal"
                       78 "Legally-Exempt" 79 "Legally-Exempt Enhanced"
                       80 "Registered 1-Star" 81 "Registered 2-Star"
                       82 "Registered 3-Star" 83 "Registered 4-Star"
                       84 "Registered 5-Star" 85 "Non-Certified Relatives"
                       86 "Non-Certified in Provider's Home" 87 "Relative"
                       88 "Gold" 89 "Silver" 90 "Bronze"
                       91 "Regulated Faith Based Accredited"
                       92 "Registered Accredited" 93 "Tier 0" 94 "Tier 5"
                       95 "Regularly Certified 2-Star"
                       96 "Regularly Certified 3-Star"
                       97 "Regularly Certified 4-Star"
                       98 "Regularly Certified 5-Star"
                       99 "Provisionally Certified 2-Star"
                       100 "Provisionally Certified 3-Star"
                       101 "Provisionally Certified 4-Star"
                       102 "Provisionally Certified 5-Star"
                       103 "QRIS Level 2 and above"
                       104 "Systems QRIS Level 2 and above"
                       105 "Systems No Rating"
                       106 "Non-Systems QRIS Level 2 and above"
                       107 "Non-Systems No Rating" 108 "Star 1" ;
label define REIMBURSEBASE -1 "Record reflects base rates for provider type"
                       0 "Record does not reflect base rates for provider type" ;
label define REIMBURSEHIGH -1 "Record reflects highest rates for provider type"
                       0 "Record does not reflect highest rates for provider type" ;
label define REIMBURSEHOURLY1 -4 "NA or missing values" ;
label define REIMBURSEDAILYFULL1 -4 "NA or missing values" ;
label define REIMBURSEDAILYPART1 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULL1 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPART1 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULL1 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPART1 -4 "NA or missing values" ;
label define REIMBURSEHOURLY2 -4 "NA or missing values" ;
label define REIMBURSEDAILYFULL2 -4 "NA or missing values" ;
label define REIMBURSEDAILYPART2 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULL2 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPART2 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULL2 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPART2 -4 "NA or missing values" ;
label define REIMBURSEHOURLY3 -4 "NA or missing values" ;
label define REIMBURSEDAILYFULL3 -4 "NA or missing values" ;
label define REIMBURSEDAILYPART3 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULL3 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPART3 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULL3 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPART3 -4 "NA or missing values" ;
label define REIMBURSEHOURLY4 -4 "NA or missing values" ;
label define REIMBURSEDAILYFULL4 -4 "NA or missing values" ;
label define REIMBURSEDAILYPART4 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULL4 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPART4 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULL4 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPART4 -4 "NA or missing values" ;
label define REIMBURSEHOURLY5 -4 "NA or missing values" ;
label define REIMBURSEDAILYFULL5 -4 "NA or missing values" ;
label define REIMBURSEDAILYPART5 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULL5 -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPART5 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULL5 -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPART5 -4 "NA or missing values" ;
label define REIMBURSEHOURLYSC -4 "NA or missing values" ;
label define REIMBURSEDAILYFULLSC -4 "NA or missing values" ;
label define REIMBURSEDAILYPARTSC -4 "NA or missing values" ;
label define REIMBURSEWEEKLYFULLSC -4 "NA or missing values" ;
label define REIMBURSEWEEKLYPARTSC -4 "NA or missing values" ;
label define REIMBURSEMONTHLYFULLSC -4 "NA or missing values" ;
label define REIMBURSEMONTHLYPARTSC -4 "NA or missing values" ;
label define BEFOREAFTERCAREHOURLY -4 "NA or missing values" ;
label define BEFOREAFTERCAREDAILY -4 "NA or missing values" ;
label define BEFOREAFTERCAREWEEKLY -4 "NA or missing values" ;
label define BEFOREAFTERCAREMONTHLY -4 "NA or missing values" ;
label define BEFORECAREHOURLY -4 "NA or missing values" ;
label define BEFORECAREDAILY -4 "NA or missing values" ;
label define BEFORECAREWEEKLY -4 "NA or missing values" ;
label define BEFORECAREMONTHLY -4 "NA or missing values" ;
label define AFTERCAREHOURLY -4 "NA or missing values" ;
label define AFTERCAREDAILY -4 "NA or missing values" ;
label define AFTERCAREWEEKLY -4 "NA or missing values" ;
label define AFTERCAREMONTHLY -4 "NA or missing values" ;
label define REIMBURSESCHOOLCLOSE 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define REIMBURSESPECIALNEEDSRATE 0 "NA" 1 "No, same as for non-special needs children"
                       2 "Yes, varies on a case by case basis"
                       3 "Yes, the state adds-on to a base rate"
                       4 "Yes, specific rates defined for special needs children"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" 99 "Other" ;
label define REIMBURSESPECIALNEEDSRATETIME 0 "NA" 1 "Hourly" 2 "Daily" 3 "Weekly" 4 "Monthly"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define REIMBURSESPECIALNEEDSGROUPONE -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSGROUPTWO -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSGROUPTHREE -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSGROUPFOUR -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSGROUPFIVE -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSSUMMERCARE -5 "Not in manual" -4 "NA" ;
label define REIMBURSESPECIALNEEDSBEFOREAFTER -5 "Not in manual" -4 "NA" ;
label define REIMBURSEOTHERRATES 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;


#delimit cr




* convert begin date and end date to monthdate format
cap drop begindat2 begindattm
tempvar date 
gen `date' = date(begindat, "YMD")
gen begindat2 = mofd(`date')
format begindat2 %tm 

tempvar date 
gen `date' = date(enddat, "YMD")
gen enddat2 = mofd(`date')
format enddat2 %tm 

save "$outfile", replace


clear 
use "$outfile"


* identify variables to keep:
* note, not keeping reimburseotherratesdescribe reimburseschoolclosedescribe for now because to long

              local reimburse reimbursehourly reimbursedailyfull reimburseweeklyfull reimburseweeklypart reimbursemonthlyfull reimbursemonthlypart
              foreach var of local reimburse {
                   local `var' `var'1 `var'2 `var'3 `var'4 `var'5 `var'sc  
              }

              local care beforeaftercare beforecare aftercare
              foreach var of local care{
                    local `var' `var'hourly `var'daily `var'weekly `var'monthly
              }
              

              global keepers  reimbursebase reimbursehigh `reimbursehourly' `reimbursedailyfull' `reimburseweeklyfull' `reimburseweeklypart' `reimbursemonthlyfull' `reimbursemonthlypart' `beforeaftercare' `beforecare' `aftercare'  reimburseschoolclose  reimbursespecialneedsrate reimburseotherrates 


              global leaders  county program familygroup providertype providersubtype begindat enddat beginmajority endmajority enddat2 _merge
         

** divide into 4 data sets based on provider type:**
****************************************************
  *tab providertype, m


  /*
  The provider type to which |
     the rules of the record |
                       apply |      Freq.     Percent        Cum.
-----------------------------+-----------------------------------
                      Center |        745       32.62       32.62
      Family Child Care Home |        865       37.87       70.49
                     In-Home |        284       12.43       82.92
Group Family Child Care Home |        373       16.33       99.26
                         All |         17        0.74      100.00
-----------------------------+-----------------------------------
                       Total |      2,284      100.00

  */

  * first cut: variables for ALL provider types (98) *
  ****************************************************

              
              keep if providertype == 98
              save "$outfilePTall", replace

              clear
              use "$outfilePTall"
              cap drop __000000 __000001

              ** check for duplicates 
               *duplicates list state begindat2
               duplicates tag state begindat2, generate (dups)
               sort begindat2
               *list state county program familygroup providertype providersubtype begindat begindat2 if dups > 0

              /*
     +--------------------------------------------------------------------------------------------------------------------------------------+
     |         state         county                     program   family~p   pr~rtype               providersubtype     begindat   begind~2 |
     |--------------------------------------------------------------------------------------------------------------------------------------|
  1. | New Hampshire   All Counties   NH Child Care Scholarship        All        All   Non-Contract License-Exempt   2006/07/01     2006m7 |
  2. | New Hampshire   All Counties   NH Child Care Scholarship        All        All         Non-Contract Licensed   2006/07/01     2006m7 |
  3. | New Hampshire   All Counties   NH Child Care Scholarship        All        All                      Contract   2006/07/01     2006m7 |
  4. | New Hampshire   All Counties   NH Child Care Scholarship        All        All   Non-Contract License-Exempt   2007/07/01     2007m7 |
  5. | New Hampshire   All Counties   NH Child Care Scholarship        All        All         Non-Contract Licensed   2007/07/01     2007m7 |
     |--------------------------------------------------------------------------------------------------------------------------------------|
  6. | New Hampshire   All Counties   NH Child Care Scholarship        All        All                      Contract   2007/07/01     2007m7 |
  7. | New Hampshire   All Counties   NH Child Care Scholarship        All        All                License-Exempt   2008/07/01     2008m7 |
  8. | New Hampshire   All Counties   NH Child Care Scholarship        All        All                      Licensed   2008/07/01     2008m7 |
  9. | New Hampshire   All Counties   NH Child Care Scholarship        All        All                      Contract   2008/07/01     2008m7 |
     +--------------------------------------------------------------------------------------------------------------------------------------+
NOTE ANNOYING NEW HAMPSHIRE!! WHY WHY WHY?

              */


              ** keep only the first line in each group for Now 

              * keep the first record of each ( registered) ( all seem to be the same generally)

                  bys begindat2: drop if dups >0 & _n > 1
/*
local reimburse reimbursehourly reimbursedailyfull reimburseweeklyfull reimburseweeklypart reimbursemonthlyfull reimbursemonthlypart
foreach var of local reimburse {
  local `var' `var'1-`var'5 `var'sc  
}

local care beforeaftercare beforecare aftercare
foreach var of local care{
 local `var' `var'time `var'hourly `var'daily `var'weekly `var'monthly
}

 local keepers reimbursebase reimbursehigh `reimbursehourly' `reimbursedailyfull' `reimburseweeklyfull' `reimburseweeklypart' `reimbursemonthlyfull' `reimbursemonthlypart' `beforeaftercare' `beforecare' `aftercare' reimburseschoolclose reimburseschoolclosedescribe reimbursespecialneedsrate reimburseotherrates reimburseotherratesdescribe
*/           
              /*
              foreach var of local keepers {
                list state county begindat begindat2 `var' if dups > 0
              }
              
              */



              * check if unique ID
              isid state begindat2
              save "$outfilePTall", replace


              * run panel file program 

              makepanel "$outfilePTall" "$bigfilePTall"

              local leaderkeepers $keepers $leaders
              foreach var of local leaderkeepers {
                   rename `var' `var'PTall  
                }
              

              save "$bigfilePTall", replace


  * next cut: variables for Center based provider types (1) *
  ****************************************************
              clear
              use "$outfile"

              tab providertype, m
              keep if providertype == 1
              cap drop __000000 __000001
              save "$outfilePT1", replace

              clear
              use "$outfilePT1"

              ** check for duplicates 
               duplicates list state begindat2
              duplicates tag state begindat2, generate (dups)
               sort begindat2
               list state county program  providersubtype begindat if dups > 0, c
               * yay no duplicates! *

              * check if unique ID
              isid state begindat2
              save "$outfilePT1", replace


              * run panel file program 

              makepanel "$outfilePT1" "$bigfilePT1"
             
            
             local leaderkeepers $keepers $leaders
              foreach var of local leaderkeepers {
                rename `var' `var'PT1 
              }


              save "$bigfilePT1", replace

  * 3rd  cut: variables for FAmily Child Care Home provider types (2) *
  ****************************************************

              clear
              use "$outfile"

              tab providertype, m
              keep if providertype == 2
              cap drop __000000 __000001
              save "$outfilePT2", replace

              clear
              use "$outfilePT2"

              ** check for duplicates 
               duplicates list state begindat2
               
               *no duplicates!* 

              * check if unique ID
              isid state begindat2
              save "$outfilePT2", replace



               * run panel file program 

                makepanel "$outfilePT2" "$bigfilePT2"

              ** rename variables with PT2 ending: 

               local leaderkeepers $keepers $leaders
               foreach var of local leaderkeepers {
                  rename `var' `var'PT2 
              }
              


              save "$bigfilePT2", replace

  * 4rth  cut: variables for IN-Home provider types (3) *
  ****************************************************

              clear
              use "$outfile"

              tab providertype, m
              keep if providertype == 3
              cap drop __000000 __000001
              save "$outfilePT3", replace

              clear
              use "$outfilePT3"

              ** check for duplicates 
               duplicates list state begindat2
               
               *no duplicates!* 

              * check if unique ID
              isid state begindat2
              save "$outfilePT3", replace


              * run panel file program
              makepanel "$outfilePT3" "$bigfilePT3"

              ** rename variables with PT3 ending: 
              local leaderkeepers $keepers $leaders
               foreach var of local leaderkeepers {
                rename `var' `var'PT3 
              }
              cap drop _merge
              save "$bigfilePT3", replace


  * 5rth  cut: variables for group family child care home provider types (4) *
  ****************************************************

              clear
              use "$outfile"

              tab providertype, m
              keep if providertype == 4
              cap drop __000000 __000001
              save "$outfilePT4", replace

              clear
              use "$outfilePT4"

              ** check for duplicates 
               duplicates list state begindat2
               
               *no duplicates!* 

              * check if unique ID
              isid state begindat2
              save "$outfilePT4", replace

              * run panel file program
              makepanel "$outfilePT4" "$bigfilePT4"

              ** rename variables with PT4 ending: 
              local leaderkeepers $keepers $leaders
               foreach var of local leaderkeepers {
                rename `var' `var'PT4 
              }

              cap drop _merge
              save "$bigfilePT4", replace

** merge together all provider types to make balanced panel:


clear
use "$bigfilePTall"
save "$bigfile", replace


forvalues i = 1/4 {
  merge 1:1 state begindat2 using "${bigfilePT`i'}", update replace
  rename _merge _merge`i'
  save "$bigfile", replace
}


 

