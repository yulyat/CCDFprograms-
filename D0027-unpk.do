/**************************************************************************
 |                                                                         
 |                    STATA SETUP FILE FOR ICPSR 34902
 |       CHILD CARE AND DEVELOPMENT FUND (CCDF) POLICIES DATABASE,
 |                                  2012
 |        (DATASET 0027: OTHER PROVIDER POLICIES: WHO MAY PROVIDE
 |                               CARE DATA)
 |
 |
 |  Please edit this file as instructed below.
 |  To execute, start Stata, change to the directory containing:
 |       - this do file
 |       - the ASCII data file
 |       - the dictionary file
 |
 |  Then execute the do file (e.g., do 34902-0027-statasetup.do)
 |
 **************************************************************************/

set mem 6m  /* Allocating 6 megabyte(s) of RAM for Stata SE to read the
                 data file into memory. */


set more off  /* This prevents the Stata output viewer from pausing the
                 process */

/****************************************************

Section 1: File Specifications
   This section assigns local macros to the necessary files.
   Please edit:
        "data-filename" ==> The name of data file downloaded from ICPSR
        "dictionary-filename" ==> The name of the dictionary file downloaded.
        "stata-datafile" ==> The name you wish to call your Stata data file.

   Note:  We assume that the raw data, dictionary, and setup (this do file) all
          reside in the same directory (or folder).  If that is not the case
          you will need to include paths as well as filenames in the macros.

********************************************************/
global d_root `"/Users/truskinovsky/Documents/Prospectus/CCDF_data"'
global d_working `"$d_root/CCDF_working"'
global d_27 `"$d_root/ICPSR_34902/DS0027"' 
global raw_data `"$d_27/34902-0027-Data.txt"'
global dict `"$d_working/dictionary/DS0027.do"'
global outfile `"$d_working/clean data/DS0027new.dta"'

/********************************************************

Section 2: Infile Command

This section reads the raw data into Stata format.  If Section 1 was defined
properly, there should be no reason to modify this section.  These macros
should inflate automatically.

**********************************************************/
clear
set trace on
infile using "$dict", using ("$raw_data") clear



/*********************************************************

Section 3: Value Label Definitions
This section defines labels for the individual values of each variable.
We suggest that users do not modify this section.

**********************************************************/


label data "Child Care and Development Fund (CCDF) Policies Database, 2012, Other Provider Policies: Who May Provide Care Data"

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
                       199 "Group E Counties" ;
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
                       92 "Registered Accredited" ;
label define AUTHORIZEDRELATIVEINUNIT 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define AUTHORIZEDRELATIVENOTINUNIT 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define AUTHORIZEDRELATIVELIVINGOUTSIDE 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define AUTHORIZEDNONRELATIVEINUNIT 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;
label define AUTHORIZEDNONRELATIVENOTINUNIT 0 "NA" 1 "Yes" 2 "No"
                       91 "Not enough information to code accurately"
                       92 "Not in manual" ;


#delimit cr


/***************************************************************************

 Section 4: Missing Values

 This section will replace numeric missing values (i.e., -9) with generic
 system missing ".".  By default the code in this section is commented out.
 Users wishing to apply the generic missing values should remove the comment
 at the beginning and end of this section.  Note that Stata allows you to
 specify up to 27 unique missing value codes.

****************************************************************/

/*
replace AUTHORIZEDRELATIVEINUNIT = . if (AUTHORIZEDRELATIVEINUNIT == 91 | AUTHORIZEDRELATIVEINUNIT == 92)
replace AUTHORIZEDRELATIVENOTINUNIT = . if (AUTHORIZEDRELATIVENOTINUNIT == 91 | AUTHORIZEDRELATIVENOTINUNIT == 92)
replace AUTHORIZEDRELATIVELIVINGOUTSIDE = . if (AUTHORIZEDRELATIVELIVINGOUTSIDE == 91 | AUTHORIZEDRELATIVELIVINGOUTSIDE == 92)
replace AUTHORIZEDNONRELATIVEINUNIT = . if (AUTHORIZEDNONRELATIVEINUNIT == 91 | AUTHORIZEDNONRELATIVEINUNIT == 92)
replace AUTHORIZEDNONRELATIVENOTINUNIT = . if (AUTHORIZEDNONRELATIVENOTINUNIT == 91 | AUTHORIZEDNONRELATIVENOTINUNIT == 92)


*/
/********************************************************************

 Section 5: Save Outfile

  This section saves out a Stata system format file.  There is no reason to
  modify it if the macros in Section 1 were specified correctly.

*********************************************************************/

save `outfile', replace

