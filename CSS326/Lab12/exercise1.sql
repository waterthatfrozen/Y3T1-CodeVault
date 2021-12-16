-- EXERCISE 1
-- a) Define user accounts according to security levels
CREATE USER IF NOT EXISTS 'bank_admin'@'localhost' IDENTIFIED BY 'bank_admin';
GRANT ALL PRIVILEGES ON `bank`.* TO 'bank_admin'@'localhost';
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS 'bank_staff'@'localhost' IDENTIFIED BY 'bank_staff';
GRANT SELECT, INSERT, UPDATE, DELETE ON `bank`.* TO 'bank_staff'@'localhost';
FLUSH PRIVILEGES;

CREATE USER IF NOT EXISTS 'bank_customer'@'localhost' IDENTIFIED BY 'bank_customer';
GRANT SELECT ON `bank`.* TO 'bank_customer'@'localhost';
FLUSH PRIVILEGES;

-- b) protect sensitive data in the database
UPDATE account SET `No.` = AES_ENCRYPT(`No.`,SHA1('secret')), `Name` = AES_ENCRYPT(`Name`,SHA1('secret'));

-- c) create a view that contains the account no., name, balance.
CREATE VIEW view_namebal AS 
SELECT AES_DECRYPT(`No.`,SHA1('secret')) AS `No.`, AES_DECRYPT(`Name`,SHA1('secret')) AS `Name`,
`bal` FROM account;