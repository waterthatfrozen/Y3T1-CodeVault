DELIMITER $$

CREATE FUNCTION Box(amount decimal(12,2),box_size INT)
RETURNS INT DETERMINISTIC
BEGIN
DECLARE result INT;
SET result = amount/box_size;
RETURN (result);
END $$ 

DELIMITER ;