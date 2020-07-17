create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.ISOPEN VARCHAR, BASE.CATEGORIES VARCHAR);

create view USER16.YELP_CHECKIN (pk VARCHAR PRIMARY KEY, PERHOUR.CHECKINS VARCHAR, PERHOUR.BUSINESSID VARCHAR, PERHOUR.WEEKDAY VARCHAR, PERHOUR.HOUR VARCHAR);

select BUSINESSES.BASE.CATEGORIES, sum(TO_NUMBER(CT.PERHOUR.CHECKINS))
from USER16.YELP_CHECKIN as CT inner join USER16.YELP_BUSINESS as BUSINESSES on CT.BUSINESSID = BUSINESSES.pk 
where BUSINESSES.BASE.ISOPEN = '1' and (CT.PERHOUR.WEEKDAY = 'Mon' or CT.PERHOUR.WEEKDAY = 'Tue' or CT.PERHOUR.WEEKDAY = 'Wed' or CT.PERHOUR.WEEKDAY = 'Thu' or CT.PERHOUR.WEEKDAY = 'Fri') and CT.PERHOUR.HOUR > '13:59:00' and CT.PERHOUR.HOUR < '16:O1:00' and not CT.PERHOUR.CHECKINS = 'checkins'
group by BUSINESSES.BASE.CATEGORIES;

drop view USER16.YELP_BUSINESS;
drop view USER16.YELP_CHECKIN;





create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.ISOPEN VARCHAR, BASE.CATEGORIES VARCHAR) SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create view USER16.YELP_CHECKIN (pk VARCHAR PRIMARY KEY, PERHOUR.CHECKINS VARCHAR, PERHOUR.BUSINESSID VARCHAR, PERHOUR.WEEKDAY VARCHAR, PERHOUR.HOUR VARCHAR) SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create index BIDX on BUSINESSES(BASE.ISOPEN, BASE.CATEGORIES);

create index CIDX on "CHECKINS_TABLE"(PERHOUR.CHECKINS, PERHOUR.BUSINESSID, PERHOUR.WEEKDAY, PERHOUR.HOUR);

select BUSINESSES.BASE.CATEGORIES, sum(TO_NUMBER(CT.PERHOUR.CHECKINS))
from USER16.YELP_CHECKIN as CT inner join USER16.YELP_BUSINESS as BUSINESSES on CT.BUSINESSID = BUSINESSES.pk 
where BUSINESSES.BASE.ISOPEN = '1' and (CT.PERHOUR.WEEKDAY = 'Mon' or CT.PERHOUR.WEEKDAY = 'Tue' or CT.PERHOUR.WEEKDAY = 'Wed' or CT.PERHOUR.WEEKDAY = 'Thu' or CT.PERHOUR.WEEKDAY = 'Fri') and CT.PERHOUR.HOUR > '13:59:00' and CT.PERHOUR.HOUR < '16:O1:00' and not CT.PERHOUR.CHECKINS = 'checkins'
group by BUSINESSES.BASE.CATEGORIES;

drop view USER16.YELP_BUSINESS;
drop view USER16.YELP_CHECKIN;












create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.ISOPEN VARCHAR, BASE.CATEGORIES VARCHAR) SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create view USER16.YELP_CHECKIN (pk VARCHAR PRIMARY KEY, PERHOUR.CHECKINS VARCHAR, PERHOUR.BUSINESSID VARCHAR, PERHOUR.WEEKDAY VARCHAR, PERHOUR.HOUR VARCHAR) SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create index BIDX on BUSINESSES(BASE.ISOPEN, BASE.CATEGORIES);

create index CIDX on "CHECKINS_TABLE"(PERHOUR.CHECKINS, PERHOUR.BUSINESSID, PERHOUR.WEEKDAY, PERHOUR.HOUR);

!outputformat csv
!record user16_opt_q6.csv

select BUSINESSES.BASE.CATEGORIES, sum(TO_NUMBER(CT.PERHOUR.CHECKINS))
from USER16.YELP_CHECKIN as CT inner join USER16.YELP_BUSINESS as BUSINESSES on CT.BUSINESSID = BUSINESSES.pk 
where BUSINESSES.BASE.ISOPEN = '1' and (CT.PERHOUR.WEEKDAY = 'Mon' or CT.PERHOUR.WEEKDAY = 'Tue' or CT.PERHOUR.WEEKDAY = 'Wed' or CT.PERHOUR.WEEKDAY = 'Thu' or CT.PERHOUR.WEEKDAY = 'Fri') and CT.PERHOUR.HOUR > '13:59:00' and CT.PERHOUR.HOUR < '16:O1:00'
group by BUSINESSES.BASE.CATEGORIES;

!record

drop view USER16.YELP_BUSINESS;
drop view USER16.YELP_CHECKIN;
