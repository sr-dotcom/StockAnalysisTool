# StockAnalysisTool
# By: Gona Naga Sathwik Reddy

#__________________________________________________(1)________________________________________________________________

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA.

create table bajaj1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from bajaj_auto;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update bajaj1 set `20 Day MA` = null
where `row number` > (select count(*) from bajaj_auto) - 19;
update bajaj1 set `50 Day MA` = null
where `row number` > (select count(*) from bajaj_auto) - 49;

# Droping column name 'row number' from table bajaj1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table bajaj1 drop `row number`;

#select * from bajaj1;

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA.

create table eicher1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from eicher_motors;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update eicher1 set `20 Day MA` = null
where `row number` > (select count(*) from eicher_motors) - 19;
update eicher1 set `50 Day MA` = null
where `row number` > (select count(*) from eicher_motors) - 49;

# Droping column name 'row number' from table eicher1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table eicher1 drop `row number`;

#select * from eicher1;

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'hero1' containing the date, close price, 20 Day MA and 50 Day MA.

create table hero1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from hero_motocorp;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update hero1 set `20 Day MA` = null
where `row number` > (select count(*) from hero_motocorp) - 19;
update hero1 set `50 Day MA` = null
where `row number` > (select count(*) from hero_motocorp) - 49;

# Droping column name 'row number' from table hero1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table hero1 drop `row number`;

#select * from hero1;

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'infosys1' containing the date, close price, 20 Day MA and 50 Day MA.

create table infosys1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from infosys;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update infosys1 set `20 Day MA` = null
where `row number` > (select count(*) from infosys) - 19;
update infosys1 set `50 Day MA` = null
where `row number` > (select count(*) from infosys) - 49;

# Droping column name 'row number' from table infosys1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table infosys1 drop `row number`;

#select * from infosys1;

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'tcs1' containing the date, close price, 20 Day MA and 50 Day MA.

create table tcs1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from tcs;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update tcs1 set `20 Day MA` = null
where `row number` > (select count(*) from tcs) - 19;
update tcs1 set `50 Day MA` = null
where `row number` > (select count(*) from tcs) - 49;

# Droping column name 'row number' from table tcs1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table tcs1 drop `row number`;

#select * from tcs1;

#---------------------------------------------------------------------------------------------------------------------

# Create a new table named 'tvs1' containing the date, close price, 20 Day MA and 50 Day MA.

create table tvs1 as
select `Date`,`close price`,row_number() over() `row number`,
avg(`close price`) over( order by `Date` asc rows between current row and 19 following ) as `20 Day MA`,
avg(`close price`) over( order by `Date` asc rows between current row and 49 following ) as `50 Day MA`
from tvs_motors;

# filling the values for oldest 20 and 50 rows with null because we want moving average of 20 and 50 days.

update tvs1 set `20 Day MA` = null
where `row number` > (select count(*) from tvs_motors) - 19;
update tvs1 set `50 Day MA` = null
where `row number` > (select count(*) from tvs_motors) - 49;

# Droping column name 'row number' from table tvs1 to get the desired table date, close price, 20 Day MA and 50 Day MA

alter table tvs1 drop `row number`;

#select * from tvs1;

#---------------------------------------------------------------------------------------------------------------------

#__________________________________________________(2)________________________________________________________________

#---------------------------------------------------------------------------------------------------------------------

# Create a master table containing the date and close price of all the six stocks. Column header for the price is the name of the stock

create table master_table  as
select bajaj1.`Date`,bajaj1.`close price`   as Bajaj,
					 eicher1.`close price`  as Eicher,
                     hero1.`close price`    as Hero,
                     infosys1.`close price` as Infosys,
                     tcs1.`close price`     as TCS,
                     tvs1.`close price`     as TVS
from bajaj1 inner join eicher1  on bajaj1.`Date` = eicher1.`Date`
			inner join hero1    on bajaj1.`Date` = hero1.`Date`
            inner join infosys1 on bajaj1.`Date` = infosys1.`Date`
            inner join tcs1     on bajaj1.`Date` = tcs1.`Date`
            inner join tvs1     on bajaj1.`Date` = tvs1.`Date`;
            
#select * from master_table;

#---------------------------------------------------------------------------------------------------------------------

#__________________________________________________(3)________________________________________________________________

#---------------------------------------------------------------------------------------------------------------------

# Use the tables created in Part(1) to generate buy and sell signal. Store this in another table named 'bajaj2'.Perform this operation for all stocks.

# Steps involved are :-
# 1)When the shorter-term moving average crosses above the longer-term moving average, it is a signal to BUY, as it indicates that the trend is shifting up. 
# 2)On the opposite when the shorter term moving average crosses below the longer term moving average, it is a signal to SELL, as it indicates the trend is shifting down.
# 3)When the signal is neither buy nor sell, it is classified as hold. If you already own the stock, keep it and if you don't then don't buy it now.

#---------------------------------------------------------------------------------------------------------------------

create table bajaj2 as
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from bajaj1 ;

#select * from bajaj2;

#---------------------------------------------------------------------------------------------------------------------

CREATE TABLE eicher2 AS
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from eicher1 ;

#select * from eicher2;

#---------------------------------------------------------------------------------------------------------------------

CREATE TABLE hero2 AS
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from hero1 ;

#select * from hero2;

#---------------------------------------------------------------------------------------------------------------------

CREATE TABLE infosys2 AS
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from infosys1 ;

#select * from infosys2;

#---------------------------------------------------------------------------------------------------------------------

CREATE TABLE tcs2 AS
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from tcs1 ;

#select * from tcs2;

#---------------------------------------------------------------------------------------------------------------------

CREATE TABLE tvs2 AS
select `Date`, `Close Price`,
	case
		when (`20 Day MA` > `50 Day MA`)   then 'Buy'
		when (`20 Day MA` < `50 Day MA`)   then 'Sell'
		else 'Hold'
	end as `Signal`
from tvs1 ;

#select * from tvs2;

#---------------------------------------------------------------------------------------------------------------------

#__________________________________________________(4)________________________________________________________________

#---------------------------------------------------------------------------------------------------------------------

# Create a User defined function, that takes the date as input and returns the signal for that particular day (Buy/Sell/Hold) for the All stocks.

delimiter $$
CREATE FUNCTION generate_signal( t text(20),dt date)
RETURNS char(20)
DETERMINISTIC
BEGIN

case

when t='bajaj' then RETURN (SELECT `Signal` FROM bajaj2 WHERE `Date` = dt);

when t='eicher' then RETURN (SELECT `Signal` FROM eicher2 WHERE `Date` = dt);

when t='hero' then RETURN (SELECT `Signal` FROM hero2 WHERE `Date` = dt);

when t='infosys' then RETURN (SELECT `Signal` FROM infosys2 WHERE `Date` = dt);

when t='tcs' then RETURN (SELECT `Signal` FROM tcs2 WHERE `Date` = dt);

when t='tvs' then RETURN (SELECT `Signal` FROM tvs2 WHERE `Date` = dt);

end case;

END $$
delimiter ;

#---------------------------------------------------------------------------------------------------------------------

# sample query to generate a signal 

SELECT generate_signal('bajaj','2015-01-01') AS Signal_generated;

# Use generate_signal to find the Signal (Buy/Sell/Hold) of the stock 
# parameters of the function 'generate_signal' are 'stock name' and 'stock date'. *(Enter the parameters in apostrophes)

#---------------------------------------------------------------------------------------------------------------------

#____________________________________________________: THE-END :______________________________________________________
