SELECT SUM(payment), driver_ids
	FROM driver_payments
		LEFT JOIN customer_transaction
		ON driver_payments.ids = customer_transaction.driver_ids 
        AND CEILING(driver_payments.payment) = CEILING(ABS(customer_transaction.fare - 0.15 * customer_transaction.fare))
        WHERE booking_date BETWEEN '2021-7-3' AND '2021-7-6'
        GROUP BY ids;