create table carriers(
ccode char(2) collate ucs_basic,
carrier char(25) collate ucs_basic
)
\p\g


INSERT INTO carriers VALUES
('AS','Alaska Airlines (AS)'),
('AA','American Airlines (AA)'),
('DL','Delta Air Lines (DL)'),
('EV','ExpressJet Airlines (EV)'),
('F9','Frontier Airlines (F9)'),
('HA','Hawaiian Airlines (HA)'),
('B6','JetBlue Airways (B6)'),
('OO','SkyWest Airlines (OO)'),
('WN','Southwest Airlines (WN)'),
('NK','Spirit Airlines (NK)'),
('UA','United Airlines (UA)'),
('VX','Virgin America (VX)')
\p\g