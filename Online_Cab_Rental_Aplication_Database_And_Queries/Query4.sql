SELECT WEEK(booking_date), driver_ids, SUM(fare - 0.15*fare) AS weekly_salary 
	FROM customer_transaction 
	GROUP BY WEEK(booking_date), driver_ids ;