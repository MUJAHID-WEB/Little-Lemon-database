CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(quantity) AS max_quantity
    FROM your_table_name;
END;
