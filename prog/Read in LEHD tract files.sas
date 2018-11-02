/**************************************************************************
 Program:  Read in LEHD tract files.sas
 Library:  LEHD
 Project:  Urban-Greater DC
 Author:   L. Hendey
 Created:  10/26/18
 Version:  SAS 9.4
 Environment:  Local Windows session
 
 Description:  Read in LEHD data from Vivian Zheng in TECH

**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCdata_lib( LEHD ) 

%let revisions=New file.; 


libname raw "L:\Libraries\LEHD\Raw";

  data WORK.rac_primary_1 (drop=ucounty where=( year > 2009 & metro15="47900"))   ;

infile 'L:\Libraries\LEHD\Raw\rac_primary.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

length stname ctyname $25. trctname $35. geo2010 $11. ucounty county metro15 $5. st $2.  ;
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

  metro15=put(ucounty,$ctym15f.);
  county=ucounty; 

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
ctyname="County name"
geo2010="Full census tract ID (2010): ssccctttttt" 
county="Regional county (2017)" 
metro15="Metropolitan statistical area (2015 definition)"
st="State FIPS" 
stname="State name"
trctname="Census tract name"
year="Year" 
;
  run;
  
  data WORK.rac_all_1 (drop=ucounty where=( year > 2009 & metro15="47900"));

infile 'L:\Libraries\LEHD\Raw\rac_all.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

length stname ctyname $25. trctname $35. geo2010 $11. ucounty county metro15 $5. st $2.  ;
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

  metro15=put(ucounty,$ctym15f.);
  county=ucounty; 

  label 

C000 ="Total jobs"
CA01 ="Number of jobs for workers age 29 or younger"
CA02 ="Number of jobs for workers age 30 to 54"
CA03 ="Number of jobs for workers age 55 or older"
CE01 ="Number of jobs with earnings $1250/month or less"
CE02 ="Number of jobs with earnings $1251/month to $3333/month"
CE03 ="Number of jobs with earnings greater than $3333/month"
CNS01 ="Number of jobs in NAICS sector 11 (Agriculture, Forestry, Fishing and Hunting)"
 CNS02 ="Number of jobs in NAICS sector 21 (Mining, Quarrying, and Oil and Gas Extraction)"
 CNS03 ="Number of jobs in NAICS sector 22 (Utilities)"
 CNS04 ="Number of jobs in NAICS sector 23 (Construction)"
 CNS05 ="Number of jobs in NAICS sector 31-33 (Manufacturing)"
 CNS06 ="Number of jobs in NAICS sector 42 (Wholesale Trade)"
 CNS07 ="Number of jobs in NAICS sector 44-45 (Retail Trade)"
 CNS08 ="Number of jobs in NAICS sector 48-49 (Transportation and Warehousing)"
 CNS09 ="Number of jobs in NAICS sector 51 (Information)"
 CNS10 ="Number of jobs in NAICS sector 52 (Finance and Insurance)"
 CNS11 ="Number of jobs in NAICS sector 53 (Real Estate and Rental and Leasing)"
 CNS12 ="Number of jobs in NAICS sector 54 (Professional, Scientific, and Technical Services)"
 CNS13 ="Number of jobs in NAICS sector 55 (Management of Companies and Enterprises)"
 CNS14 ="Number of jobs in NAICS sector 56 (Administrative and Support and Waste Management and Remediation Services)"
CNS15 ="Number of jobs in NAICS sector 61 (Educational Services)"
CNS16 ="Number of jobs in NAICS sector 62 (Health Care and Social Assistance)"
CNS17="Number of jobs in NAICS sector 71 (Arts, Entertainment, and Recreation)"
CNS18="Number of jobs in NAICS sector 72 (Accommodation and Food Services)"
CNS19="Number of jobs in NAICS sector 81 (Other Services [except Public Administration])"
CNS20="Number of jobs in NAICS sector 92 (Public Administration)"
CR01="Number of jobs for workers with Race: White, Alone"
CR02="Number of jobs for workers with Race: Black or African American Alone"
CR03="Number of jobs for workers with Race: American Indian or Alaska Native Alone"
CR04="Num Number of jobs for workers with Race: Asian Alone"
CR05="Num Number of jobs for workers with Race: Native Hawaiian or Other Pacific Islander Alone"
CR07="Number of jobs for workers with Race: Two or More Race Groups"
CT01="Number of jobs for workers with Ethnicity: Not Hispanic or Latino"
CT02="Number of jobs for workers with Ethnicity: Hispanic or Latino"
CD01="Number of jobs for workers age 30+ with Edu Attainment: Less than high school"
CD02="Number of jobs for workers age 30+ with Edu Attainment: High school or equivalent, no college"
CD03="Number of jobs for workers age 30+ with Edu Attainment: Some college or Associate degree"
CD04="Number of jobs for workers age 30+ with Edu Attainment: Bachelor's degree or advanced degree"
CS01="Number of jobs for workers with Sex: Male"
CS02="Number of jobs for workers with Sex: Female"
ctyname="County name"
geo2010="Full census tract ID (2010): ssccctttttt" 
county="Regional county (2017)" 
metro15="Metropolitan statistical area (2015 definition)"
st="State FIPS" 
stname="State name"
trctname="Census tract name"
year="Year" 
;
  run;

  
  data WORK.wac_all_1 (drop=ucounty where=( year > 2009 & metro15="47900"));

infile 'L:\Libraries\LEHD\Raw\wac_all.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

length stname ctyname $25. trctname $35. geo2010 $11. ucounty county metro15 $5. st $2.  ;
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
  cs02
  ;

  metro15=put(ucounty,$ctym15f.);
  county=ucounty; 

  label 

C000 ="Total jobs"
CA01 ="Number of jobs for workers age 29 or younger"
CA02 ="Number of jobs for workers age 30 to 54"
CA03 ="Number of jobs for workers age 55 or older"
CE01 ="Number of jobs with earnings $1250/month or less"
CE02 ="Number of jobs with earnings $1251/month to $3333/month"
CE03 ="Number of jobs with earnings greater than $3333/month"
CNS01 ="Number of jobs in NAICS sector 11 (Agriculture, Forestry, Fishing and Hunting)"
 CNS02 ="Number of jobs in NAICS sector 21 (Mining, Quarrying, and Oil and Gas Extraction)"
 CNS03 ="Number of jobs in NAICS sector 22 (Utilities)"
 CNS04 ="Number of jobs in NAICS sector 23 (Construction)"
 CNS05 ="Number of jobs in NAICS sector 31-33 (Manufacturing)"
 CNS06 ="Number of jobs in NAICS sector 42 (Wholesale Trade)"
 CNS07 ="Number of jobs in NAICS sector 44-45 (Retail Trade)"
 CNS08 ="Number of jobs in NAICS sector 48-49 (Transportation and Warehousing)"
 CNS09 ="Number of jobs in NAICS sector 51 (Information)"
 CNS10 ="Number of jobs in NAICS sector 52 (Finance and Insurance)"
 CNS11 ="Number of jobs in NAICS sector 53 (Real Estate and Rental and Leasing)"
 CNS12 ="Number of jobs in NAICS sector 54 (Professional, Scientific, and Technical Services)"
 CNS13 ="Number of jobs in NAICS sector 55 (Management of Companies and Enterprises)"
 CNS14 ="Number of jobs in NAICS sector 56 (Administrative and Support and Waste Management and Remediation Services)"
CNS15 ="Number of jobs in NAICS sector 61 (Educational Services)"
CNS16 ="Number of jobs in NAICS sector 62 (Health Care and Social Assistance)"
CNS17="Number of jobs in NAICS sector 71 (Arts, Entertainment, and Recreation)"
CNS18="Number of jobs in NAICS sector 72 (Accommodation and Food Services)"
CNS19="Number of jobs in NAICS sector 81 (Other Services [except Public Administration])"
CNS20="Number of jobs in NAICS sector 92 (Public Administration)"
CR01="Number of jobs for workers with Race: White, Alone"
CR02="Number of jobs for workers with Race: Black or African American Alone"
CR03="Number of jobs for workers with Race: American Indian or Alaska Native Alone"
CR04="Num Number of jobs for workers with Race: Asian Alone"
CR05="Num Number of jobs for workers with Race: Native Hawaiian or Other Pacific Islander Alone"
CR07="Number of jobs for workers with Race: Two or More Race Groups"
CT01="Number of jobs for workers with Ethnicity: Not Hispanic or Latino"
CT02="Number of jobs for workers with Ethnicity: Hispanic or Latino"
CD01="Number of jobs for workers age 30+ with Edu Attainment: Less than high school"
CD02="Number of jobs for workers age 30+ with Edu Attainment: High school or equivalent, no college"
CD03="Number of jobs for workers age 30+ with Edu Attainment: Some college or Associate degree"
CD04="Number of jobs for workers age 30+ with Edu Attainment: Bachelor's degree or advanced degree"
CS01="Number of jobs for workers with Sex: Male"
CS02="Number of jobs for workers with Sex: Female"

ctyname="County name"
geo2010="Full census tract ID (2010): ssccctttttt" 
county="Regional county (2017)" 
metro15="Metropolitan statistical area (2015 definition)"
st="State FIPS" 
stname="State name"
trctname="Census tract name"
year="Year" 
;
  run;
  data WORK.wac_primary_1 (drop=ucounty where=( year > 2009 & metro15="47900"));

infile 'L:\Libraries\LEHD\Raw\wac_primary.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

length stname ctyname $25. trctname $35. geo2010 $11. ucounty county metro15 $5. st $2.  ;
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
  cs02
  /*only available for all private jobs (JT02)
  cfa01
  cfa02
  cfa03
  cfa04
  cfa05
  cfs01
  cfs02
  cfs03
  cfs04
  cfs05*/;

  metro15=put(ucounty,$ctym15f.);
  county=ucounty; 

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
/*CFA01="Number of primary jobs for workers at firms with Firm Age: 0-1 Years"
CFA02="Number of primary jobs for workers at firms with Firm Age: 2-3 Years"
CFA03="Number of primary jobs for workers at firms with Firm Age: 4-5 Years"
CFA04="Number of primary jobs for workers at firms with Firm Age: 6-10 Years"
CFA05="Number of primary jobs for workers at firms with Firm Age: 11+ Years"
CFS01="Number of primary jobs for workers at firms with Firm Size: 0-19 Employees"
CFS02="Number of primary jobs for workers at firms with Firm Size: 20-49 Employees"
CFS03="Number of primary jobs for workers at firms with Firm Size: 50-249 Employees"
CFS04="Number of primary jobs for workers at firms with Firm Size: 250-499 Employees"
CFS05="Number of primary jobs for workers at firms with Firm Size: 500+ Employees"*/
ctyname="County name"
geo2010="Full census tract ID (2010): ssccctttttt" 
county="Regional county (2017)" 
metro15="Metropolitan statistical area (2015 definition)"
st="State FIPS" 
stname="State name"
trctname="Census tract name"
year="Year" 
;
  run;


**** Finalize data set ****;

  %Finalize_data_set( 
  /** Finalize data set parameters **/
  data=rac_primary_1,
  out=rac_primary,
  outlib=LEHD,
  label="LEHD Residence Area Characteristics (Primary Jobs)",
  sortby=geo2010 year,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=5,
  freqvars=year
  );

  %Finalize_data_set( 
  /** Finalize data set parameters **/
  data=rac_all_1,
  out=rac_all,
  outlib=LEHD,
  label="LEHD Residence Area Characteristics (All Jobs)",
  sortby=geo2010 year,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=5,
  freqvars=year
  );

    %Finalize_data_set( 
  /** Finalize data set parameters **/
  data=wac_primary_1,
  out=wac_primary,
  outlib=LEHD,
  label="LEHD Worker Area Characteristics (Primary Jobs)",
  sortby=geo2010 year,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=5,
  freqvars=year
  );

  %Finalize_data_set( 
  /** Finalize data set parameters **/
  data=wac_all_1,
  out=wac_all,
  outlib=LEHD,
  label="LEHD Worker Area Characteristics (All Jobs)",
  sortby=geo2010 year,
  /** Metadata parameters **/
  restrictions=None,
  revisions=%str(&revisions),
  /** File info parameters **/
  printobs=5,
  freqvars=year
  );
