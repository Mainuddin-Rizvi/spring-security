-- Drop tables if they exist
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS customer;

-- Create customer table
CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  mobile_number VARCHAR(20) NOT NULL,
  pwd VARCHAR(500) NOT NULL,
  role VARCHAR(100) NOT NULL,
  create_dt DATE DEFAULT NULL
);

-- Insert data into customer table
INSERT INTO customer (name, email, mobile_number, pwd, role, create_dt)
VALUES ('Happy', 'happy@example.com', '5334122365', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'admin', CURRENT_DATE);

-- Create accounts table
CREATE TABLE accounts (
  customer_id INT NOT NULL,
  account_number BIGINT NOT NULL PRIMARY KEY,
  account_type VARCHAR(100) NOT NULL,
  branch_address VARCHAR(200) NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

-- Insert data into accounts table
INSERT INTO accounts (customer_id, account_number, account_type, branch_address, create_dt)
VALUES (1, 1865764534, 'Savings', '123 Main Street, New York', CURRENT_DATE);

-- Create account_transactions table
CREATE TABLE account_transactions (
  transaction_id SERIAL PRIMARY KEY,
  account_number BIGINT NOT NULL,
  customer_id INT NOT NULL,
  transaction_dt DATE NOT NULL,
  transaction_summary VARCHAR(200) NOT NULL,
  transaction_type VARCHAR(100) NOT NULL,
  transaction_amt INT NOT NULL,
  closing_balance INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (account_number) REFERENCES accounts (account_number) ON DELETE CASCADE,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

-- Insert data into account_transactions table
INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30, 34500, CURRENT_DATE - INTERVAL '7 days');

INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '6 days', 'Uber', 'Withdrawal', 100, 34400, CURRENT_DATE - INTERVAL '6 days');

INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '5 days', 'Self Deposit', 'Deposit', 500, 34900, CURRENT_DATE - INTERVAL '5 days');

INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '4 days', 'Ebay', 'Withdrawal', 600, 34300, CURRENT_DATE - INTERVAL '4 days');

INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700, 35000, CURRENT_DATE - INTERVAL '2 days');

INSERT INTO account_transactions (account_number, customer_id, transaction_dt, transaction_summary, transaction_type, transaction_amt, closing_balance, create_dt)
VALUES (1865764534, 1, CURRENT_DATE - INTERVAL '1 day', 'Amazon.com', 'Withdrawal', 100, 34900, CURRENT_DATE - INTERVAL '1 day');

-- Create loans table
CREATE TABLE loans (
  loan_number SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  start_dt DATE NOT NULL,
  loan_type VARCHAR(100) NOT NULL,
  total_loan INT NOT NULL,
  amount_paid INT NOT NULL,
  outstanding_amount INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

-- Insert data into loans table
INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');

INSERT INTO loans (customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
VALUES (1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');

-- Create cards table
CREATE TABLE cards (
  card_id SERIAL PRIMARY KEY,
  card_number VARCHAR(100) NOT NULL,
  customer_id INT NOT NULL,
  card_type VARCHAR(100) NOT NULL,
  total_limit INT NOT NULL,
  amount_used INT NOT NULL,
  available_amount INT NOT NULL,
  create_dt DATE DEFAULT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE
);

-- Insert data into cards table
INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, CURRENT_DATE);

INSERT INTO cards (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
VALUES ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, CURRENT_DATE);

-- Create notice_details table
CREATE TABLE notice_details (
  notice_id SERIAL PRIMARY KEY,
  notice_summary VARCHAR(200) NOT NULL,
  notice_details VARCHAR(500) NOT NULL,
  notic_beg_dt DATE NOT NULL,
  notic_end_dt DATE DEFAULT NULL,
  create_dt DATE DEFAULT NULL,
  update_dt DATE DEFAULT NULL
);

-- Insert data into notice_details table
INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the government guidelines. The updated rates will be effective immediately',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Net Banking Offers', 'Customers who opt for Internet banking while opening a saving account will get a $50 amazon voucher',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Mobile App Downtime', 'The mobile application of EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('E Auction notice', 'There will be an e-auction on 12/08/2020 on the Bank website for all the stubborn arrears. Interested parties can participate in the e-auction',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

INSERT INTO notice_details (notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('COVID-19 Insurance', 'EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
CURRENT_DATE - INTERVAL '30 days', CURRENT_DATE + INTERVAL '30 days', CURRENT_DATE, NULL);

-- Create contact_messages table
CREATE TABLE contact_messages (
  contact_id SERIAL PRIMARY KEY,
  contact_name VARCHAR(50) NOT NULL,
  contact_email VARCHAR(100) NOT NULL,
  subject VARCHAR(500) NOT NULL,
  message VARCHAR(2000) NOT NULL,
  create_dt DATE DEFAULT NULL
);

CREATE TABLE authorities (
  id SERIAL PRIMARY KEY,
  customer_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWACCOUNT');

INSERT INTO authorities (customer_id, name)
 VALUES (1, 'VIEWCARDS');

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'VIEWLOANS');

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'VIEWBALANCE');

DELETE FROM authorities;

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'ROLE_USER');

INSERT INTO authorities (customer_id, name)
  VALUES (1, 'ROLE_ADMIN');
