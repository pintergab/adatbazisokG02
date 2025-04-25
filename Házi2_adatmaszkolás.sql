CREATE Table Ugyfel_Masked
( LOGIN NVARCHAR(255) not null PRIMARY KEY,
 EMAIL nvarchar(255) MASKED WITH (function='email()'),
 NEV nvarchar(255) ,
 SZULEV int MASKED WITH(function='random(1,5)'),
 NEM nvarchar(1),
 CIM nvarchar(255) MASKED WITH (function='partial(1, "XXX",2)') 
)

-- itt szükség lesz az ugyfel tábla letöltésére (nem tudom ez így elfogadható-e, a sorok bemásolása egyesével túl hosszú lett volna)

INSERT INTO Ugyfel_Masked
(LOGIN, EMAIL, NEV, SZULEV, NEM, CIM)
SELECt login, email, nev, szulev, nem, cim
FROM ugyfel

CREAte USER Felhasználó WITHOUT Login;
GRANT SELECT ON Ugyfel_Masked TO Felhasználó

EXECUTE AS User= 'Felhasználó';
SELECT * FROM Ugyfel_Masked
REVERT