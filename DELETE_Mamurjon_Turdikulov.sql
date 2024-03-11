-- Remove the film and corresponding rental records
DELETE FROM Rental
WHERE inventory_id IN (
    SELECT inventory_id
    FROM Inventory
    WHERE film_id = (SELECT film_id FROM Film WHERE film_title = 'The Conjuring')
);

DELETE FROM Inventory
WHERE film_id = (SELECT film_id FROM Film WHERE film_title = 'The Conjuring');

-- Remove records related to you (as a customer) from all tables except "Customer" and "Inventory"
DELETE FROM Payment
WHERE rental_id IN (
    SELECT rental_id
    FROM Rental
    WHERE customer_id = (SELECT customer_id FROM Customer WHERE customer_name = 'Mamur')
);

DELETE FROM Rental
WHERE customer_id = (SELECT customer_id FROM Customer WHERE customer_name = 'Mamur');

-- You might want to delete any related staff records (if you were a staff member)
DELETE FROM Staff
WHERE staff_id IN (
    SELECT staff_id
    FROM Staff
    WHERE username = 'Mamur'
);

-- Finally, delete the customer record for 'Mamur'
DELETE FROM Customer
WHERE customer_name = 'Mamur';
