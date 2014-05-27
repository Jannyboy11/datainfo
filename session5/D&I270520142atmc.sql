--a

--read1(x) - read1(y) read2(x) - write1(x) - write2(x) - write1(y)

SELECT titel FROM Boek WHERE isbn = '0136067018';
SELECT titel FROM Boek WHERE isbn = '0321228383';
SELECT titel FROM Boek WHERE isbn = '0136067018';
UPDATE Boek SET titel = titel || ' deel 1' WHERE isbn = '0136067018';
UPDATE Boek SET titel = titel || ' deel 2' WHERE isbn = ' 0136067018';
UPDATE Boek SET titel = titel || ' deel 1' WHERE isbn = '0321228383';

--b

--read1(x); read1(y); write1(x); read2(x); ... abort/rollback van T1 ...

--c

-- Zet het isolatieniveau van T1 op READ COMMITTED of sterker.




