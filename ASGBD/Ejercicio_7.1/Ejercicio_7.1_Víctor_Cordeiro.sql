DELIMITER $$
CREATE FUNCTION f_suma(i INT, j INT)
RETURNS INT
DETERMINISTIC
BEGIN
	RETURN i + j;
END $$

SELECT f_suma(5, 6);

DELIMITER $$
CREATE PROCEDURE p_suma(IN i INT, IN j INT, OUT k INT)
BEGIN
	SET k = i + j;
END $$

SET @mivariable = 0;

CALL p_suma(2, 3, @mivariable);
SELECT @mivariable;