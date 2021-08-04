SELECT fare AS Transaction_amount
	FROM customer_transaction 
	WHERE booking_date BETWEEN '2021-7-3' AND '2021-7-6' AND payment_mode = 'Credit'; 