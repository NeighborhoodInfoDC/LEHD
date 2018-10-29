/**************************************************************************
 Program:  mt_vern_profile_lehdprep.sas
 Library:  MVT
 Project:  Urban-Greater DC
 Author:   L. Hendey
 Created:  10/26/18
 Version:  SAS 9.4
 Environment:  Local Windows session
 
 Description:  Read in LEHD data from Vivian Zheng in TECH

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( MVT )
%DCdata_lib( LEHD ) 
%DCData_lib( acs )


libname raw "L:\Libraries\LEHD\Raw";

  data WORK.rac_primary    ;

infile 'L:\Libraries\LEHD\Raw\rac_primary.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

length stname ctyname $25. trctname $35. geo2010 $11. ucounty $5. st $2. ;
  input
  year
  st $
  stname $
  ucounty $
  ctyname $
  geo2010 $
  trctname $
  c000
  ca01
  ca02
  ca03
  ce01
  ce02
  ce03
  cns01
  cns02
  cns03
  cns04
  cns05
  cns06
  cns07
  cns08
  cns09
  cns10
  cns11
  cns12
  cns13
  cns14
  cns15
  cns16
  cns17
  cns18
  cns19
  cns20
  cr01
  cr02
  cr03
  cr04
  cr05
  cr07
  ct01
  ct02
  cd01
  cd02
  cd03
  cd04
  cs01
  cs02;

  label 

C000 ="Total primary jobs"
CA01 ="Number of primary jobs for workers age 29 or younger"
CA02 ="Number of primary jobs for workers age 30 to 54"
CA03 ="Number of primary jobs for workers age 55 or older"
CE01 ="Number of primary jobs with earnings $1250/month or less"
CE02 ="Number of primary jobs with earnings $1251/month to $3333/month"
CE03 ="Number of primary jobs with earnings greater than $3333/month"
CNS01 ="Number of primary jobs in NAICS sector 11 (Agriculture, Forestry, Fishing and Hunting)"
 CNS02 ="Number of primary jobs in NAICS sector 21 (Mining, Quarrying, and Oil and Gas Extraction)"
 CNS03 ="Number of primary jobs in NAICS sector 22 (Utilities)"
 CNS04 ="Number of primary jobs in NAICS sector 23 (Construction)"
 CNS05 ="Number of primary jobs in NAICS sector 31-33 (Manufacturing)"
 CNS06 ="Number of primary jobs in NAICS sector 42 (Wholesale Trade)"
 CNS07 ="Number of primary jobs in NAICS sector 44-45 (Retail Trade)"
 CNS08 ="Number of primary jobs in NAICS sector 48-49 (Transportation and Warehousing)"
 CNS09 ="Number of primary jobs in NAICS sector 51 (Information)"
 CNS10 ="Number of primary jobs in NAICS sector 52 (Finance and Insurance)"
 CNS11 ="Number of primary jobs in NAICS sector 53 (Real Estate and Rental and Leasing)"
 CNS12 ="Number of primary jobs in NAICS sector 54 (Professional, Scientific, and Technical Services)"
 CNS13 ="Number of primary jobs in NAICS sector 55 (Management of Companies and Enterprises)"
 CNS14 ="Number of primary jobs in NAICS sector 56 (Administrative and Support and Waste Management and Remediation Services)"
CNS15 ="Number of primary jobs in NAICS sector 61 (Educational Services)"
CNS16 ="Number of primary jobs in NAICS sector 62 (Health Care and Social Assistance)"
CNS17="Number of primary jobs in NAICS sector 71 (Arts, Entertainment, and Recreation)"
CNS18="Number of primary jobs in NAICS sector 72 (Accommodation and Food Services)"
CNS19="Number of primary jobs in NAICS sector 81 (Other Services [except Public Administration])"
CNS20="Number of primary jobs in NAICS sector 92 (Public Administration)"
CR01="Number of primary jobs for workers with Race: White, Alone"
CR02="Number of primary jobs for workers with Race: Black or African American Alone"
CR03="Number of primary jobs for workers with Race: American Indian or Alaska Native Alone"
CR04="Num Number of primary jobs for workers with Race: Asian Alone"
CR05="Num Number of primary jobs for workers with Race: Native Hawaiian or Other Pacific Islander Alone"
CR07="Number of primary jobs for workers with Race: Two or More Race Groups"
CT01="Number of primary jobs for workers with Ethnicity: Not Hispanic or Latino"
CT02="Number of primary jobs for workers with Ethnicity: Hispanic or Latino"
CD01="Number of primary jobs for workers age 30+ with Edu Attainment: Less than high school"
CD02="Number of primary jobs for workers age 30+ with Edu Attainment: High school or equivalent, no college"
CD03="Number of primary jobs for workers age 30+ with Edu Attainment: Some college or Associate degree"
CD04="Number of primary jobs for workers age 30+ with Edu Attainment: Bachelor's degree or advanced degree"
CS01="Number of primary jobs for workers with Sex: Male"
CS02="Number of primary jobs for workers with Sex: Female"
;
  run;

data primary_dc;
	set rac_primary (where=(st="11" & year > 2009));
%tr10_to_stdgeos(in_ds=primary_dc, out_ds=primary_dc_geo)
run; 
proc sort data=primary_dc_geo;
by city year;
proc summary data=primary_dc_geo;
by city year;
var C000;
output out=primary_city sum=;
run; 
proc summary data=primary_city;
where year >= 2011 and year <=2015;
var C000;
output out=primary_city_2011_15 mean=;
run; 
proc sort data=primary_dc_geo;
by ward2012 year;
proc summary data=primary_dc_geo;
by ward2012 year;
var C000;
output out=primary_wd12 sum=;
run; 
proc summary data=primary_wd12;
where year >= 2011 and year <=2015;
by ward2012;
var C000;
output out=primard_wd12_2011_15 mean=;
run; 
data acs_emp_city;
	set acs.acs_2011_15_dc_sum_tr_city;
keep city TotPop_2011_15
			popcivilianemployed_2011_15;
 			
		run; 
data acs_emp_wd12;
	set acs.acs_2011_15_dc_sum_tr_wd12;
keep ward2012 TotPop_2011_15
			popcivilianemployed_2011_15;
 			
		run; 
proc sort data=primard_wd12_2011_15 ;
by ward2012;
proc sort data= acs_emp_wd12;
by ward2012;
data testLEHD_ACS_w12;
merge acs_emp_wd12 primard_wd12_2011_15;
by ward2012;

diff_emp=popcivilianemployed_2011_15-c000; 
run; 
proc univariate data=testLEHD_ACS_w12;
var diff_emp;
run; 
proc print data=testLEHD_ACS_w12;
run;


data acs_emp;
	set acs.acs_2011_15_dc_sum_tr_tr10;
keep geo2010 TotPop_2011_15
			popcivilianemployed_2011_15;
 			
		run; 

proc sort data=primary_dc;
by geo2010 year;
proc summary data=primary_dc;
where year >= 2011 and year <=2015;
by geo2010;
var C000; 
output out=primary_dc_2011_15 mean=;
run; 

proc sort data=primary_dc_2011_15 ;
by geo2010;
proc sort data= acs_emp;
by geo2010;
data testLEHD_ACS;
merge acs_emp primary_dc_2011_15;
by geo2010;

diff_emp=popcivilianemployed_2011_15-c000; 
run; 
proc univariate data=testLEHD_ACS;
var diff_emp;
run; 

data test1a;
	set test1 (where=(st=11));

	run; 
proc sort data=test1a;
by year;
proc print data=test1a;
where trct in(11001004702,11001004701) and year > 2009;
run; 


data
