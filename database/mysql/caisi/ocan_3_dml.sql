delete from OcanFormOption where ocanFormVersion = '3.0';

-- Reason for OCAN

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Reason for OCAN","IA","Initial OCAN" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Reason for OCAN","RA","Reassessment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Reason for OCAN","DIS","(Prior to) discharge" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Reason for OCAN","SC","Significant Change (Please specify)" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- dob type
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","client DOB Type","EST","Estimate" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","client DOB Type","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- gender

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","M","Male" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","F","Female" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","INT","Intersex" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","TM","Trans-Female to Male" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","TF","Trans-Male to Female" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Administrative Gender","OTH","Other" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- family doctor information

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Doctor Psychiatrist","TRUE","Yes" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Doctor Psychiatrist","FALSE","No" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Doctor Psychiatrist","NOTAVAIL","None Available" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Doctor Psychiatrist","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Doctor Psychiatrist","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- other contact

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Other Contacts Agency","TRUE","Yes" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Other Contacts Agency","FALSE","No" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Other Contacts Agency","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Other Contacts Agency","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- consumer capacity / Client Capacity

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Client Capacity","TRUE","Yes" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Client Capacity","FALSE","No" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Client Capacity","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Client Capacity","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Areas Of Concern

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Areas Of Concern","TRUE","Yes" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Areas Of Concern","FALSE","No" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Areas Of Concern","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Age of Onset

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Age of Onset","EST","Estimate" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Age of Onset","CDA","Consumer Declined to Answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Age of Onset","UNK","Unknown" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Age of Onset","NA","N/A" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Sexual Orientation

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","1","Bisexual" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","2","Gay" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","3","Heterosaxual" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","4","Lesbian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","5","Queer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","6","Two-Spirit" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Sexual Orientation","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Citizenship Status


insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","CDN","Canadian Citizen" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","PR","Permanent Resident" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","TR","Temporary Resident" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","REF","Refugee" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Citizenship Status","UNK","Do not know" FROM OcanFormOption;


-- ----------------------------------------------------------------------

-- common_options_yes_no

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","common_options_yes_no","TRUE","Yes" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","common_options_yes_no","FALSE","No" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","common_options_yes_no","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","common_options_yes_no","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Legal Issues

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Legal Issues","Civil","Civil" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Legal Issues","Criminal","Criminal" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Legal Issues","None","None" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Legal Issues","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName)
select max(id)+1 ,"3.0","Legal Issues","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Current legal status
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-01","Pre-charge Diversion" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-02","Court Diversion Program" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-03","Awaiting fitness assessment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-04","Awaiting trial (with or without bail)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-05","Awaiting criminal responsibility assessment (NCR)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-06","In community on own recognizance" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-07","Unfit to stand trial" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-08","Charges withdrawn" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-09","Stay of proceedings" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-10","Awaiting sentence" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-11","NCR" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-12","Conditional discharge" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-13","Conditional sentence" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-14","Restraining order" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-15","Peace bond" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-16","suspended sentence" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-17","ORB detained - community access" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-18","ORB conditional discharge" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-19","On parole" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-20","On probation" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-21","No legal problems (includes absolute discharge and end of sentence)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","013-22","Incarceration" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Legal History Type","CDA","Prefer not to answer" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Residence Type
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-01","Approved Homes & Homes for Special Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-02","Correctional/Probation Facility" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-03","Domicillary Hostel" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-04","General Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-05","Psychiatric Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-06","Other Specialty Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-07","No fixed address" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-08","Hostel/Shelter" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-09","Long term care facility/Nursing Home" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-10","Municipal Non-Profit Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-11","Private Non-Profit Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-12","Private House/Apt. SR Owned/Market Rent" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-13","Private House/Apt. Other/Subsidized" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-14","Retirement Home/Senior's Residence" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-15","Rooming/Boarding House" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-16","Supportive Housing Congregate Living" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","024-17","Supportive Housing - Assisted Living" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residence Type","CDA","Prefer not to answer" FROM OcanFormOption;

-- ----------------------------------------------------------------------

-- Residential Support
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","24A-01","Independent" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","24A-02","Assisted/Supported" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","24A-03","Supervised non-facility" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","24A-04","Supervised facility" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Residential Support","CDA","Prefer not to answer" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Living Arrangement Type

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","025-01","No-on my own" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","025-02","Spouse/Partner" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","025-03","Children" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","025-04","Parents" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","025-05","Relatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","023-06","Non-relatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Living Arrangement Type","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Employment Status

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","224363007","Independent/Competitive" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","ES-1","Assisted/Supported" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","ES-2","Alternative businesses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","224366004","Sheltered Workshop" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","276061003","Non-paid work experience" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","ES-3","No employment - other activity" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","224364001","Casual/Sporadic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","73438004","No employment of any kind" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Employment Status","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Education Program Status

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224304004","Not in school" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224306002","Elementary/Junior High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224308001","Secondary/High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224860003","Trade School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","54106008","Vocational/Training Centre" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","161125007","Adult education" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224870001","Community College" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","224871002","University" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Program Status","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Emergency Department

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","None","None" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","ED-1","1" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","ED-2","2-5" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","ED-6",">6" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Emergency Department","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Community Treatment Orders

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Community Treatment Orders","015-01","Issued CTO" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Community Treatment Orders","015-02","No CTO" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Community Treatment Orders","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Community Treatment Orders","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Diagnostic Categories

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","NEU","Neurodevelopmental Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","SCH","Schizophrenia Spectrum and Other Psychotic Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","BIP","Bipolar and Related Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","DEP","Depressive Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","ANX","Anxiety Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","OCD","Obsessive-Compulsive and Related Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","TSD","Trauma- and Stressor-Related Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","DIS","Dissociative Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","SOM","Somatic Symptom and Related Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","FED","Feeding and Eating Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","ELD","Elimination Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","SWD","Sleep-Wake Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","SEX","Sexual Dysfunctions" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","GEN","Gender Dysphoria" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","DIC","Disruptive, Impulse-Control, and Conduct Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","SAD","Substance-Related and Addictive Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","NCD","Neurocognitive Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","PER","Personality Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","PAR","Paraphilic Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","OMD","Other Mental Disorders" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","MED","Medication-Induced Movement Disorders and Other Adverse Effects of Medication" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","NOT","Not Applicable" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Categories","UNK","Do not know " FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Disabilities

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","1","Chronic Illness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","2","Development Disability" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","3","Drug or Alcohol Dependence" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","4","Learning Disability" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","5","Mental Illness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","6","Physical Disability" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","7","Sensory Disability (i.e. hearing or vision loss)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","8","None" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","CDA","Prefer not to answer " FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Disabilities","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Education Level

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","224294005","No Formal Schooling" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","HLES-2","Some Elementary/Junior High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","224295006","Elementary/Junior High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","HLES-4","Some Secondary/High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","224297003","Secondary/High School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","HLES-6","Some College / University" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","224302000","College / University" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Education Level","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Income Source Type
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-01","Employment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-02","Employment Insurance" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-03","Pension" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-04","ODSP" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-05","Social Assistance" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-06","Disability Assistance" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-07","Family" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","031-08","No source of income" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Source Type","CDA","Prefer not to answer" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Family Income

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","1","$0-$19,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","2","$20,000-$29,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","3","$30,000-$59,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","4","$60,000-$89,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","5","$90,000-$119,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","6","$120,000-$149,999" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","7","$150,000 or more" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Family Income","UNK","Do not know" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Income Support

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","1","1" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","2","2" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","3","3" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","4","4" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","5","5" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","6","6" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","7","7" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","8","8" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","9","9" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","10","10" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","11","11" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","12","12" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","13","13" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","14","14" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","15","15" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","16","16" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","17","17" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","18","18" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","19","19" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","20","20" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","21","21" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","22","22" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","23","23" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","24","24" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","25","25" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","26","26" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","27","27" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","28","28" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","29","29" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","30","30" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","31","31" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","32","32" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","33","33" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","34","34" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","35","35" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","36","36" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","37","37" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","38","38" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","39","39" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","40","40" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","41","41" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","42","42" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","43","43" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","44","44" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","45","45" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","46","46" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","47","47" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","48","48" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","49","49" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","50","50" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","51","51" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","52","52" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","53","53" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","54","54" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","55","55" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","56","56" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","57","57" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","58","58" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","59","59" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","60","60" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","61","61" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","62","62" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","63","63" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","64","64" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","65","65" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","66","66" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","67","67" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","68","68" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","69","69" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","70","70" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","71","71" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","72","72" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","73","73" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","74","74" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","75","75" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","76","76" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","77","77" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","78","78" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","79","79" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","80","80" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","81","81" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","82","82" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","83","83" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","84","84" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","85","85" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","86","86" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","87","87" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","88","88" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","89","89" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","90","90" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","91","91" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","92","92" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","93","93" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","94","94" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","95","95" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","96","96" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","97","97" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","98","98" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","99","99" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","100","100" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Income Support","UNK","Do not know" FROM OcanFormOption;



-- ----------------------------------------------------------------------
-- MIS Functional Centre List

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 09 76","CM - Case Management" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 12","C&T - Counseling & Treatment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 20","ACT - Assertive Community Treatment Teams" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 30","CMH - Community Mental Health Clinic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 40","EMP - Vocational/Employment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 41","CLU - Clubhouses" FROM OcanFormOption;


insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 50","CHI - Child / Adolescent" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 51","EAR - Early Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 55","FOR - Forensic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 56","DCS - Diversion & Court Support" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 60","AS - Abuse Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 70","EAT - Eating Disorder" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 81","SR - Social Rehabilitation/Recreation" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 96","GER - Psycho-geriatric" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 15 76","CRI - Mental Health Crisis Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 20 76","DN - Primary Day/Night Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 40 76 10","HSC - Homes for Special Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 40 76 30","SH - Supportive within Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 40 76 60","CSB - Short term Res.Crisis Support Beds" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 70 10","I&R - Community Service Information and Referral" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 50 76 10","HPA - Health Promotion / Education - Awareness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 50 76 30","HPW - Health Promotion / Education - Women's Health (MH)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 50 76 40","CD - Community Development" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 51 76 11","PSH - Peer / Self-help Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 51 76 12","AB - Alternative Businesses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 51 76 20","FI - Family Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","MIS Functional Centre List","725 10 76 99","OTH - Other MH services not elsewhere classified" FROM OcanFormOption;


-- ----------------------------------------------------------------------
-- Referral Source

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-01","General Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-02","Psychiatric Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-03","Other institution" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-05","Other Community Agencies" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-06","Family Physicians" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-07","Psychiatrists" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-08","Mental Health Worker" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","018-10","Self, Family or Friend" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","OTH","Other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0AS","Abuse Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0AB","Alternative Businesses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","ACT","Assertive Community Treatment Teams" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0CM","Case Management" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CHI","Child/Adolescent" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CLU","Clubhouses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0CD","Community Development" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CMH","Community Mental Health Clinic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0IR","Community Service Information and Referral" FROM OcanFormOption;


insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0CT","Counseling & Treatment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","DCS","Diversion & Court Support" FROM OcanFormOption;


insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","EAR","Early Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","EAT","Eating Disorder" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0FI","Family Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","FOR","Forensic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","HPA","Health Promotion/Education - Awareness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","HPW","Health Promotion/Education - Women's Health (MH)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","HSC","Homes for Special Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CRI","Mental Health Crisis Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","PSH","Peer/Self-help Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0DN","Primary Day/Night Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","GER","Psycho-Geriatric" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0SR","Social Rehabilitation/Recreation" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","0SH","Supports within Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","EMP","Vocational/Employment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","OMHS","Other Mental Health Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","OAS","Other Addiction Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","PSOR","Police" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","COLA","Courts (includes jails and detention centres)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CSOR","Correctional Facilities (includes jails and detention centres)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","4155.1.PPOF","Probation/Parole Officers" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CSB","Short Term Residential Crisis Support Beds" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CJSS","Criminal Justice System Source breakdown not available (use this category if above detailed breakdown is not available)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","CHS","Cultural Healing Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Referral Source","NPH","Non-Profit Housing" FROM OcanFormOption;
-- ----------------------------------------------------------------------
-- Language

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","eng","English" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","fra","French" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","alq","Algonquin" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","atj","Atikamekw" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","bla","Blackfoot" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","crx","Carrier" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","clc","Chilcotin" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","chp","Chipewyan" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","cre","Cree" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","dak","Siouan languages (Dakota/Sioux)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ath","Athapaskan languages" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","dgr","Dogrib" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","git","Gitksan" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ikt","Inuinnaqtun" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","iku","Inuktitut, n.i.e." FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","gwi","Kutchin-Gwich'in (Loucheux)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","pqm","Malecite" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","mic","Mi'kmaq" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","moh","Mohawk" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","moe","Montagnais" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","nks","Naskapi" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ncg","Nisga'a" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","scs","North Slave (Hare)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","oji","Ojibway" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","alg","Oji-Cree" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","shs","Shuswap" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","xsl","South Slave" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tli","Tlingit" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ita","Italian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","por","Portuguese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ron","Romanian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","spa","Spanish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","dan","Danish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","nld","Dutch" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","vls","Flemish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","fry","Frisian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","deu","German" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","nor","Norwegian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","swe","Swedish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","yid","Yiddish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","bos","Bosnian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","bul","Bulgarian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","hrv","Croatian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ces","Czech" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","mkd","Macedonian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","pol","Polish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","prg","Russian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","srp","Serbian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","hbs","Serbo-Croatian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","slk","Slovak" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","slv","Slovenian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ukr","Ukrainian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","lav","Latvian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","lit","Lithuanian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","est","Estonian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","fin","Finnish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","hun","Hungarian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ell","Greek" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","hye","Armenian" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tur","Turkish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","amh","Amharic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ara","Arabic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","heb","Hebrew" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","mlt","Maltese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","som","Somali" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tir","Tigrinya" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ben","Bengali" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","guj","Gujarati" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","hin","Hindi" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","kur","Kurdish" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","pan","Panjabi (Punjabi)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","pus","Pashto" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","fas","Persian (Farsi)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","snd","Sindhi" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","sin","Sinhala (Sinhalese)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","urd","Urdu" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","mal","Malayalam" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tam","Tamil" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tel","Telugu" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","jpn","Japanese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","kor","Korean" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","yue","Cantonese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","zho","Chinese, n.o.s. [2]" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","cmn","Mandarin" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","nan","Taiwanese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","lao","Lao" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","khm","Khmer (Cambodian)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","khn","Khmer (Cambodian)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","vie","Vietnamese" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","bsb","Bisayan languages" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","bsy","Bisayan languages" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","ilo","ilocano" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","zsm","Malay" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","tgl","Tagalog (Pilipino, Filipino)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","aka","Akan (Twi)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","swh","Swahili" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","crp","Creoles" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","CDA","Prefer not to answer" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","UNK","Do not Know" FROM OcanFormOption;

-- 
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","asl","ASL" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","dar","Dari" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","kar","Karen" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","nep","Nepali" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language","OTH","Other" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Language_Comfort

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language_Comfort","eng","English" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Language_Comfort","fra","French" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Ethniticity

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","1","Asian - East (e.g. Chinese, Japanese, Korean)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","2","Asian - South (e.g Indian, Pakistani, Sri Lankan)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","3","Asian - South East (e.g. Malaysian, Filipino, Vietnamese)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","4","Black - African (e.g. Ghanaian, Kenyan, Somali)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","5","Black - Caribbean (e.g. Barbadian, Jamaican)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","6","Black - North American (e.g. Canadian, American)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","7","First Nations" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","8","Indian - Caribbean (e.g. Guyanese with origins in India)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","9","Indigenous/Aboriginal - not included elsewhere" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","10","Inuit" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","11","Latin American (e.g. Argentinean, Chilean, Salvadoran)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","12","Metis" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","13","Middle Eastern (e.g. Egyptian, Iranian, Lebanese)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","14","White - European (e.g. English, Italian, Portuguese, Russian)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","15","White - North American (e.g. Canadian, American)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","16","Mixed Heritage (e.g. Black-African & White-North American) Please specify:" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Ethniticity","OTH","Other" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Diagnostic Source

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Source","1","Self-reported" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Source","2","Diagnosing Practioner" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Diagnostic Source","3","Both" FROM OcanFormOption;
-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- FULL FORM : START
-- ----------------------------------------------------------------------
-- Action List
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0AS","Abuse Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","ADD","Addictions" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0AB","Alternative Businesses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","ACT","Assertive Community Treatment Teams" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0CM","Mental Health Case Management" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CHI","Child/Adolescent" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CLU","Clubhouses" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0CD","Community Development" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CMH","Community Mental Health Clinic" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0IR","Community Service Information and Referral" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","C&T","Counseling & Treatment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","EAR","Early Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","EAT","Eating Disorder" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0FI","Family Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FOR","Forensic (formerly Forensic DCS Diversion & Court Support)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","DCS","Diversion & Court Support " FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","HPA","Health Promotion/Education – Awareness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","HPW","Health Promotion/Education – Women’s Mental Health" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","HSC","Homes for Special Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CRI","Mental Health Crisis Intervention" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","PSH","Peer/Self-help Initiatives" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0DN","Primary Day/Night Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","GER","Psycho-geriatric" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CSB","Short term Res. Crisis Support Beds" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0SR","Social Rehabilitation/Recreation" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0SH","Support within Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","EMP","Vocational/Employment" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","HCC","Home and Community Care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CMS","Faith Based -Church, Mosque, Synagogue, etc. (formerly Church, Mosque, Wynagogue, etc.)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","DNT","Dentist" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FHG","Family help groups (Other than MH)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","AGS","Older adult & geriatric services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","OPT","Optometrists" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","POL","Police" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","PRI","Primary care CHC, FHT, FHG, FHN, GP" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","SCH","School" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","SHG","Self help groups (Other than MH)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0SC","Service clubs" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","SSs","Social Services - ODSP, CPP, EI, etc." FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","YSs","Youth services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0CP","Community psychiatry" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0PP","Private practitioners" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FBS","Food bank/soup kitchens" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0LC","Legal counsel" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0IS","Immigration/Settlement Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0IS","Immigration services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FCP","Financial-credit counseling, financial planning" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FIT","Fitness" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","AHO","Alternative healing options: chiropractic, acupuncture, meditation, herbalist, etc." FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","PSC","Parenting supports: child care" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","CAS","CAS, CCAS, JCFS" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0GH","General Hospital" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0PH","Psychiatric Hospital (formerly Hospital)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","0OI","Other institution (e.g. rehabilitation, long term care)" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","ICHS","Inuit- Cultural Healing Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","INCHS","Indigenous (non-specific)- Cultural Healing Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","MCHS","Metis- Cultural Healing Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","FNCHS","First Nations- Cultural Healing Services" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","PSY","Psychotherapy" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","NPH","Non-Profit Housing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","00S","Shelter" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Action List","OTH","Other" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Reason for Difference

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-1","Service does not exist" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-2","Service not available locally" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-3","Service not available due to language issues" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-4","Service not available due to financial issues" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-5","Service not available due to physical barriers physical, vision, hearing" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-6","Exclusionary criteria" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-7","Excessive wait times for service" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-8","Wait list closed" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-9","Need exists but client not interested" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Reason for Difference","RD-10","Service available but only partially meets client's need" FROM OcanFormOption;

-- ----------------------------------------------------------------------
-- Marital Status
insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","125681006","Single" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","87915002","Married or in common-law relationship" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","42120006","Partner or significant other" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","33553000","Widowed" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","13184001","Separated" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","20295000","Divorced" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","UNK","Do not know" FROM OcanFormOption;

insert into OcanFormOption (id, ocanFormVersion, ocanDataCategory, ocanDataCategoryValue, ocanDataCategoryName) 
select max(id)+1 ,"3.0","Marital Status","CDA","Prefer not to answer" FROM OcanFormOption;



-- ----------------------------------------------------------------------
-- FULL FORM : END
-- ----------------------------------------------------------------------


-- ----------------------------------------------------------------------

