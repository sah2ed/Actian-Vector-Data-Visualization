create table ontime(
year integer not null,
quarter i1 not null,
month i1 not null,
dayofmonth i1 not null,
dayofweek i1 not null,
flightdate ansidate not null,
uniquecarrier char(7) not null collate ucs_basic,
airlineid integer not null,
carrier char(2) default NULL collate ucs_basic,
tailnum varchar(50) default NULL collate ucs_basic,
flightnum varchar(10) not null collate ucs_basic,
originairportid integer default NULL,
originairportseqid integer default NULL,
origincitymarketid integer default NULL,
origin char(5) default NULL collate ucs_basic,
origincityname varchar(35) not null collate ucs_basic,
originstate char(2) default NULL collate ucs_basic,
originstatefips varchar(10) default NULL collate ucs_basic,
originstatename varchar(46) default NULL collate ucs_basic,
originwac integer default NULL,
destairportid integer default NULL,
destairportseqid integer default NULL,
destcitymarketid integer default NULL,
dest char(5) default NULL collate ucs_basic,
destcityname varchar(35) not null collate ucs_basic,
deststate char(2) default NULL collate ucs_basic,
deststatefips varchar(10) default NULL collate ucs_basic,
deststatename varchar(46) default NULL collate ucs_basic,
destwac integer default NULL,
crsdeptime integer default NULL,
deptime integer default NULL,
depdelay integer default NULL,
depdelayminutes integer default NULL,
depdel15 integer default NULL,
departuredelaygroups integer default NULL,
deptimeblk varchar(9) default NULL collate ucs_basic,
taxiout integer default NULL,
wheelsoff varchar(10) default NULL collate ucs_basic,
wheelson varchar(10) default NULL collate ucs_basic,
taxiin integer default NULL,
crsarrtime integer default NULL,
arrtime integer default NULL,
arrdelay integer default NULL,
arrdelayminutes integer default NULL,
arrdel15 integer default NULL,
arrivaldelaygroups integer default NULL,
arrtimeblk varchar(9) default NULL collate ucs_basic,
cancelled i1 default NULL,
cancellationcode char(1) default NULL collate ucs_basic,
diverted i1 default NULL,
crselapsedtime integer default NULL,
actualelapsedtime integer default NULL,
airtime integer default NULL,
flights integer default NULL,
distance integer default NULL,
distancegroup i1 default NULL,
carrierdelay integer default NULL,
weatherdelay integer default NULL,
nasdelay integer default NULL,
securitydelay integer default NULL,
lateaircraftdelay integer default NULL,
firstdeptime varchar(10) default NULL collate ucs_basic,
totaladdgtime varchar(10) default NULL collate ucs_basic,
longestaddgtime varchar(10) default NULL collate ucs_basic,
divairportlandings varchar(10) default NULL collate ucs_basic,
divreacheddest varchar(10) default NULL collate ucs_basic,
divactualelapsedtime varchar(10) default NULL collate ucs_basic,
divarrdelay varchar(10) default NULL collate ucs_basic,
divdistance varchar(10) default NULL collate ucs_basic,
div1airport varchar(10) default NULL collate ucs_basic,
div1airportid integer default NULL,
div1airportseqid integer default NULL,
div1wheelson varchar(10) default NULL collate ucs_basic,
div1totalgtime varchar(10) default NULL collate ucs_basic,
div1longestgtime varchar(10) default NULL collate ucs_basic,
div1wheelsoff varchar(10) default NULL collate ucs_basic,
div1tailnum varchar(10) default NULL collate ucs_basic,
div2airport varchar(10) default NULL collate ucs_basic,
div2airportid integer default NULL,
div2airportseqid integer default NULL,
div2wheelson varchar(10) default NULL collate ucs_basic,
div2totalgtime varchar(10) default NULL collate ucs_basic,
div2longestgtime varchar(10) default NULL collate ucs_basic,
div2wheelsoff varchar(10) default NULL collate ucs_basic,
div2tailnum varchar(10) default NULL collate ucs_basic,
div3airport varchar(10) default NULL collate ucs_basic,
div3airportid integer default NULL,
div3airportseqid integer default NULL,
div3wheelson varchar(10) default NULL collate ucs_basic,
div3totalgtime varchar(10) default NULL collate ucs_basic,
div3longestgtime varchar(10) default NULL collate ucs_basic,
div3wheelsoff varchar(10) default NULL collate ucs_basic,
div3tailnum varchar(10) default NULL collate ucs_basic,
div4airport varchar(10) default NULL collate ucs_basic,
div4airportid integer default NULL,
div4airportseqid integer default NULL,
div4wheelson varchar(10) default NULL collate ucs_basic,
div4totalgtime varchar(10) default NULL collate ucs_basic,
div4longestgtime varchar(10) default NULL collate ucs_basic,
div4wheelsoff varchar(10) default NULL collate ucs_basic,
div4tailnum varchar(10) default NULL collate ucs_basic,
div5airport varchar(10) default NULL collate ucs_basic,
div5airportid integer default NULL,
div5airportseqid integer default NULL,
div5wheelson varchar(10) default NULL collate ucs_basic,
div5totalgtime varchar(10) default NULL collate ucs_basic,
div5longestgtime varchar(10) default NULL collate ucs_basic,
div5wheelsoff varchar(10) default NULL collate ucs_basic,
div5tailnum varchar(10) default NULL collate ucs_basic
)
\p\g