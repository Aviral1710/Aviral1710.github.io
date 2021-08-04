CREATE DATABASE cab_rental;
 USE cab_rental;
 CREATE TABLE driver (
	id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100)
);
 CREATE TABLE driver_payments (
	ids INT,
    payment FLOAT,
     FOREIGN KEY (ids) REFERENCES driver(id) ON DELETE CASCADE
    );
    
INSERT INTO driver (full_name) VALUES 
	('Mark Davis'),
    ('Thomas White'),
    ('Malcolm Wright')
    ;
 
CREATE TABLE customer_transaction (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	booking_date DATE,
    fare FLOAT,
	payment_mode VARCHAR(100),
	service_tax FLOAT,
	driver_ids INT ,
	FOREIGN KEY (driver_ids) REFERENCES driver(id) ON DELETE CASCADE
     );
     
INSERT INTO driver_payments (ids, payment) VALUES 
	(1 , 255.95),
    (1, 170.425),
    (2, 167.841),
    (3, 340.195),
    (2, 446.726),
    (1, 239.394),
    (2, 410.643),
    (2, 234.872),
    (3, 473.042),
    (3, 383.979),
    (1, 273.122),
    (3, 323.646),
    (2, 211.301),
    (2, 595.111),
    (1, 546.354),
    (1, 248.991),
    (3, 318.716),
    (2, 384.013),
    (2, 385.526),
    (3, 579.479),
    (1, 283.39),
    (3, 150.909),
    (1, 364.276),
    (2, 554.532),
    (3, 391.204)
    ;
    
    INSERT INTO customer_transaction (booking_date, fare, payment_mode, service_tax, driver_ids) 
		VALUES
        ('2021-7-3', 300.23, 'Credit', 54.0414, 1),
        ('2021-7-3', 200.5, 'Credit', 36.09, 1),
        ('2021-7-4', 197.46, 'Netbanking', 35.5428, 2),
        ('2021-7-4', 400.23, 'Wallet', 72.0414, 3),
        ('2021-7-4', 525.56, 'Wallet', 94.6008, 2),
        ('2021-7-6', 281.64, 'Credit', 50.6952, 1),
        ('2021-7-8', 483.11, 'Netbanking', 86.9598, 2),
        ('2021-7-8', 276.32, 'Netbanking', 49.7376, 2),
        ('2021-7-10', 556.52, 'Wallet', 100.174, 3),
        ('2021-7-10', 451.74, 'Wallet', 81.3132, 3),
        ('2021-7-10', 321.32, 'Wallet', 48.198, 1),
        ('2021-7-11', 380.76, 'Wallet', 68.5368, 3),
        ('2021-7-11', 248.59, 'Netbanking', 44.7462, 2),
        ('2021-7-12', 700.13, 'Credit', 126.023, 2),
        ('2021-7-12', 642.77, 'Credit', 115.699, 1),
        ('2021-7-12', 292.93, 'Credit', 52.7274, 1),
        ('2021-7-15', 374.96, 'Wallet', 67.4928, 3),
        ('2021-7-15', 451.78, 'Netbanking', 81.3204, 2),
        ('2021-7-19', 453.56, 'Netbanking', 81.6408, 2),
        ('2021-7-19', 681.74, 'Netbanking', 122.713, 3),
        ('2021-7-19', 333.4, 'Credit', 60.012, 1),
        ('2021-7-22', 177.54, 'Wallet', 31.9572, 3),
        ('2021-7-24', 428.56, 'Wallet', 77.1408, 1),
        ('2021-7-24', 652.39, 'Wallet', 117.4302, 2),
        ('2021-7-24', 460.24, 'Credit', 82.8432, 3)
        ;
     
SELECT fare AS Transaction_amount
	FROM customer_transaction 
	WHERE booking_date BETWEEN '2021-7-3' AND '2021-7-6' AND payment_mode = 'Credit'; 
     

        
SELECT SUM(payment), driver_ids
	FROM driver_payments
		LEFT JOIN customer_transaction
		ON driver_payments.ids = customer_transaction.driver_ids 
        AND CEILING(driver_payments.payment) = CEILING(ABS(customer_transaction.fare - 0.15 * customer_transaction.fare))
        WHERE booking_date BETWEEN '2021-7-3' AND '2021-7-6'
        GROUP BY ids;
        
SELECT WEEK(booking_date), SUM(0.15*fare + service_tax) AS weekly_revenue FROM customer_transaction GROUP BY WEEK(booking_date);

SELECT WEEK(booking_date), driver_ids, SUM(fare - 0.15*fare) AS weekly_salary FROM customer_transaction GROUP BY WEEK(booking_date), driver_ids ;