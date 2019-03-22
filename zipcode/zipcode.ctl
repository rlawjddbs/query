LOAD DATA
INFILE "C:/dev/query/zipcode/zipcode_20130201.csv"
INTO TABLE zipcode
INSERT
FIELDS TERMINATED BY ','
(
 zipcode, sido, gugun, dong, bunji, seq
)

