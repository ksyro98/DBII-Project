create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.NAME VARCHAR, BASE.STATE VARCHAR, BASE.STARS VARCHAR, BASE.ISOPEN VARCHAR);

select BASE.NAME, BASE.STATE, BASE.STARS from USER16.YELP_BUSINESS where BASE.ISOPEN = '1' limit 1000;

drop view USER16.YELP_BUSINESS;




create view USER16.YELP_BUSINESS (pk VARCHAR PRIMARY KEY, BASE.NAME VARCHAR, BASE.STATE VARCHAR, BASE.STARS VARCHAR, BASE.ISOPEN VARCHAR) SALT_BUCKETS=16, COMPRESSION='GZ', IMMUTABLE_ROWS=true;

create index BIDX on USER16.YELP_BUSINESS (BASE.NAME, BASE.STATE, BASE.STARS, BASE.ISOPEN);

select BASE.NAME, BASE.STATE, BASE.STARS from USER16.YELP_BUSINESS where BASE.ISOPEN = '1' limit 1000;

drop view USER16.YELP_BUSINESS;













