SELECT WEEK(booking_date), SUM(0.15*fare + service_tax) 
	AS weekly_revenue FROM customer_transaction 
	GROUP BY WEEK(booking_date);