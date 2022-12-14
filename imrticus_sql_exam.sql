use exam_imarticus;
SELECT * FROM customer;
SELECT * FROM orders;
SELECT * FROM salesman;

#1. Write a SQL query which will sort out the customer and their grade 
#who made an order. Every customer must have a grade and be served 
#by at least one seller, who belongs to a region
SELECT c.cust_name AS Customer_name,
c.grade AS customer_Grade,o.ord_no AS Order_No
FROM orders as o, salesman as s, customer as c
WHERE o.customer_id = c.custemor_id
AND o.salesman_id = s.salesman_id
AND s.city IS NOT NULL
AND c.grade IS NOT NULL;

#2. Write a query for extracting the data from the order table for the 
#salesman who earned the maximum commission.

select *,max(commision) as s
from orders as o
left join salesman as s
on o.salesman_id = s.salesman_id
group by s.salesman_id
having max(commision)
order by max(commision) desc 
limit 1;

#3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, 
#salesman_id where salesman’s city is Nagpur(Note salesman_id of 
#orderstable must be other than the list within the IN operator.)

SELECT ord_no, purch_amt, ord_date, ord_date, salesman_id
FROM orders
WHERE salesman_id not IN
(SELECT salesman_id FROM salesman WHERE city !='Nagpur');

#4. Write a query to create a report with the order date in such a way 
#that the latest order date will come last along with the total purchase 
#amount and the total commission for that date is (15 % for all 
#sellers).
SELECT *, Sum(purch_amt) as total_purchase_amt, sum(purch_amt)*0.15 as 
total_commission 
FROM exam_imarticus.orders 
GROUP BY ord_date 
ORDER BY ord_date DESC;

#5. Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from 
#Orders table and display only those sellers whose purch_amt is 
#greater than average purch_amt.

SELECT ord_no, purch_amt, ord_date, salesman_id
FROM orders
WHERE purch_amt > 
(SELECT AVG(purch_amt) FROM orders);

#6.Write a query to determine the Nth (Say N=5) highest purch_amt from
#Orders table

SELECT purch_amt
FROM orders
ORDER BY purch_amt DESC
LIMIT 4,1;

#7. What are Entities and Relationships?
-- Entity is like any real object (Name, thing, Place), Entities are stored in table.
-- Relationship are Relations or links between entities which have some connections.
-- Can be relationship between seperate tables.

#8. Print customer_id, account_number and balance_amount, condition 
#that if balance_amount is nil then assign transaction_amount for 
#account_type = "Credit Card"

UPDATE bank_account_details SET Account_type = 'Credit Card'
WHERE Balance_amount = 0;
SELECT * FROM bank_account_details
WHERE Balance_amount = 0;

#9. Print customer_id, account_number, balance_amount, conPrint 
#account_number, balance_amount, transaction_amount from 
#Bank_Account_Details and bank_account_transaction for all the 
#transactions occurred during march, 2020 and april, 2020.

SELECT ba.Customer_id,ba.Account_Number, ba.Balance_amount, bt.Transaction_amount, 
bt.Transaction_Date
FROM bank_account_details ba
INNER JOIN 
bank_account_transaction bt ON ba.Account_Number = bt.Account_Number
WHERE bt.Transaction_Date BETWEEN '2020-03-01' AND '2020-04-30';

#10. Print all of the customer id, account number, balance_amount,
#transaction_amount from bank_cutomer, bank_account_details and 
#bank_account_transactions tables where excluding all of their 
#transactions in march, 2020 month.
Select
ba.Customer_id,
ba.Account_Number, Balance_amount, Transaction_amount, Transaction_Date
from Bank_Account_Details as ba  
Left join bank_account_transaction as bat
on ba.account_number = bat.account_number
And NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );
























