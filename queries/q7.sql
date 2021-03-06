create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.NAME VARCHAR, BASE.NEIGHBORHOOD VARCHAR, BASE.ADRRESS VARCHAR, BASE.CITY VARCHAR, BASE.STATE VARCHAR, BASE.POSTALCODE VARCHAR, BASE.LATITUDE VARCHAR, BASE.LONGTITUDE VARCHAR, BASE.STARS VARCHAR, BASE.REVIEWCOUNT VARCHAR, BASE.ISOPEN VARCHAR, BASE.CATEGORIES VARCHAR);


create view USER16.YELP_CHECKIN (pk VARCHAR PRIMARY KEY, PERHOUR.BUSINESSID VARCHAR, PERHOUR.WEEKDAY VARCHAR, PERHOUR.CHECKINS VARCHAR);

select * from USER16.YELP_BUSINESS where 
USER16.YELP_BUSINESS.pk in (select CT.PERHOUR.BUSINESSID
from USER16.YELP_CHECKIN as CT
where CT.PERHOUR.WEEKDAY = 'Sat'
group by CT.PERHOUR.BUSINESSID
order by sum(TO_NUMBER(CT.PERHOUR.CHECKINS)) desc
limit 100)
;

drop view USER16.YELP_BUSINESS;
drop view USER16.YELP_CHECKIN;






create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.NAME VARCHAR, BASE.NEIGHBORHOOD VARCHAR, BASE.ADRRESS VARCHAR, BASE.CITY VARCHAR, BASE.STATE VARCHAR, BASE.POSTALCODE VARCHAR, BASE.LATITUDE VARCHAR, BASE.LONGTITUDE VARCHAR, BASE.STARS VARCHAR, BASE.REVIEWCOUNT VARCHAR, BASE.ISOPEN VARCHAR, BASE.CATEGORIES VARCHAR)  SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create view USER16.YELP_CHECKIN (pk VARCHAR PRIMARY KEY, PERHOUR.BUSINESSID VARCHAR, PERHOUR.WEEKDAY VARCHAR, PERHOUR.CHECKINS VARCHAR)  SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create index CIDX on "CHECKINS_TABLE"(PERHOUR.BUSINESSID, PERHOUR.WEEKDAY, PERHOUR.CHECKINS);

select * from USER16.YELP_BUSINESS where 
USER16.YELP_BUSINESS.pk in (select CT.PERHOUR.BUSINESSID
from USER16.YELP_CHECKIN as CT
where CT.PERHOUR.WEEKDAY = 'Sat'
group by CT.PERHOUR.BUSINESSID
order by sum(TO_NUMBER(CT.PERHOUR.CHECKINS)) desc
limit 100)
;

drop view USER16.YELP_BUSINESS;
drop view USER16.YELP_CHECKIN;


