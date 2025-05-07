SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS feedback_support DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE feedback_support;

CREATE TABLE customer (
  id int(11) NOT NULL,
  name varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO customer (id, name) VALUES
(1, 'Acme Corporation'),
(2, 'Globex Inc.'),
(3, 'Initech'),
(4, 'Umbrella Corp'),
(5, 'Stark Industries');

CREATE TABLE feedback (
  id int(11) NOT NULL,
  arrived timestamp NOT NULL DEFAULT current_timestamp(),
  from_user int(11) DEFAULT NULL,
  guest_name varchar(256) DEFAULT NULL,
  guest_email varchar(256) DEFAULT NULL,
  feedback varchar(1024) DEFAULT NULL,
  handled timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO feedback (id, arrived, from_user, guest_name, guest_email, feedback, handled) VALUES
(1, '2025-04-08 16:50:29', NULL, 'John Doe', 'john@example.com', 'Great service overall!', NULL),
(2, '2025-04-08 16:50:29', NULL, 'Jane Roe', 'jane@example.com', 'I had some trouble finding help.', NULL),
(3, '2025-04-08 16:50:29', NULL, 'Bob Guest', 'bob.guest@example.com', 'The website is very user friendly.', NULL),
(4, '2025-04-08 16:50:29', NULL, 'Alice Visitor', 'alice.visitor@example.com', 'Support was a bit slow.', NULL),
(5, '2025-04-08 16:50:29', NULL, 'Sam Tester', 'sam@test.com', 'Loved the quick responses!', NULL),
(6, '2025-04-08 16:50:29', NULL, 'Megan Public', 'megan.public@example.com', 'Good, but could be improved.', NULL),
(7, '2025-04-08 16:50:29', NULL, 'Tom Random', 'tom.random@example.com', 'Satisfied with the service.', NULL),
(8, '2025-04-08 16:50:29', NULL, 'Lucy Lee', 'lucy.lee@example.com', 'Feedback: service quality is high.', NULL),
(9, '2025-04-08 16:50:29', NULL, 'Gary Nonuser', 'gary@example.com', 'I appreciate the follow-ups.', NULL),
(10, '2025-04-08 16:50:29', NULL, 'Nina External', 'nina@extern.com', 'Helpful and friendly support.', NULL),
(11, '2025-04-08 16:50:29', NULL, 'Oliver Out', 'oliver.out@example.com', 'The support portal is intuitive.', NULL),
(12, '2025-04-08 16:50:29', NULL, 'Paula Free', 'paula.free@example.com', 'No issues so far.', NULL),
(13, '2025-04-08 16:50:29', NULL, 'Quincy Q', 'quincyq@example.com', 'Very prompt assistance!', NULL),
(14, '2025-04-08 16:50:29', NULL, 'Rachel R', 'rachel.r@example.com', 'Great experience.', NULL),
(15, '2025-04-08 16:50:29', NULL, 'Steve S', 'steve.s@example.com', 'Could use more updates.', NULL);

CREATE TABLE support_message (
  id int(11) NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp(),
  ticket_id int(11) DEFAULT NULL,
  reply_to int(11) DEFAULT NULL,
  from_user int(11) DEFAULT NULL,
  body varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE support_ticket (
  id int(11) NOT NULL,
  arrived timestamp NOT NULL DEFAULT current_timestamp(),
  customer_id int(11) DEFAULT NULL,
  description varchar(1024) DEFAULT NULL,
  handled timestamp NULL DEFAULT NULL,
  status int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO support_ticket (id, arrived, customer_id, description, handled, status) VALUES
(1, '2025-04-08 17:01:20', 1, 'Ticket 1 for Acme Corporation', NULL, 1),
(2, '2025-04-08 17:01:20', 1, 'Ticket 2 for Acme Corporation', NULL, 2),
(3, '2025-04-08 17:01:20', 1, 'Ticket 3 for Acme Corporation', NULL, 3),
(4, '2025-04-08 17:01:20', 1, 'Ticket 4 for Acme Corporation', NULL, 4),
(5, '2025-04-08 17:01:20', 1, 'Ticket 5 for Acme Corporation', NULL, 1),
(6, '2025-04-08 17:01:20', 1, 'Ticket 6 for Acme Corporation', NULL, 2),
(7, '2025-04-08 17:01:20', 2, 'Ticket 1 for Globex Inc.', NULL, 1),
(8, '2025-04-08 17:01:20', 2, 'Ticket 2 for Globex Inc.', NULL, 2),
(9, '2025-04-08 17:01:20', 2, 'Ticket 3 for Globex Inc.', NULL, 3),
(10, '2025-04-08 17:01:20', 2, 'Ticket 4 for Globex Inc.', NULL, 4),
(11, '2025-04-08 17:01:20', 2, 'Ticket 5 for Globex Inc.', NULL, 1),
(12, '2025-04-08 17:01:20', 2, 'Ticket 6 for Globex Inc.', NULL, 2),
(13, '2025-04-08 17:01:20', 2, 'Ticket 7 for Globex Inc.', NULL, 3),
(14, '2025-04-08 17:01:20', 3, 'Ticket 1 for Initech', NULL, 1),
(15, '2025-04-08 17:01:20', 3, 'Ticket 2 for Initech', NULL, 2),
(16, '2025-04-08 17:01:20', 3, 'Ticket 3 for Initech', NULL, 3),
(17, '2025-04-08 17:01:20', 3, 'Ticket 4 for Initech', NULL, 4),
(18, '2025-04-08 17:01:20', 3, 'Ticket 5 for Initech', NULL, 1),
(19, '2025-04-08 17:01:20', 3, 'Ticket 6 for Initech', NULL, 2);

CREATE TABLE system_user (
  id int(11) NOT NULL,
  fullname varchar(256) DEFAULT NULL,
  email varchar(256) NOT NULL,
  mailing_list tinyint(1) NOT NULL DEFAULT 0,
  customer_id int(11) DEFAULT NULL,
  admin tinyint(1) NOT NULL DEFAULT 0,
  password varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO system_user (id, fullname, email, mailing_list, customer_id, admin, password) VALUES
(1, 'Admin User', 'admin@example.com', 0, NULL, 1, '$2b$10$sBN9fBwhXviM.nw0PA478Og7VC12JihDrPjQ1OkqjSlsRpQPE5Ha6'),
(14, 'Operator B', 'bee@feedback.example.com', 0, NULL, 1, '1'),
(15, 'A Operator', 'a.op@feedback.example.com', 0, NULL, 1, '1'),
(16, 'Support Tech', 'support@feedback.example.com', 0, NULL, 1, '1');

CREATE TABLE ticket_status (
  id int(11) NOT NULL,
  description varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO ticket_status (id, description) VALUES
(1, 'open'),
(2, 'working on'),
(3, 'done'),
(4, 'closed');


ALTER TABLE customer
  ADD PRIMARY KEY (id);

ALTER TABLE feedback
  ADD PRIMARY KEY (id),
  ADD KEY fk_feedback_user (from_user);

ALTER TABLE support_message
  ADD PRIMARY KEY (id),
  ADD KEY fk_message_ticket (ticket_id),
  ADD KEY fk_message_reply (reply_to),
  ADD KEY fk_message_user (from_user);

ALTER TABLE support_ticket
  ADD PRIMARY KEY (id),
  ADD KEY fk_ticket_customer (customer_id),
  ADD KEY fk_ticket_status (status);

ALTER TABLE system_user
  ADD PRIMARY KEY (id),
  ADD KEY fk_user_customer (customer_id);

ALTER TABLE ticket_status
  ADD PRIMARY KEY (id);


ALTER TABLE customer
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE feedback
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE support_message
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE support_ticket
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE system_user
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE ticket_status
  MODIFY id int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE feedback
  ADD CONSTRAINT fk_feedback_user FOREIGN KEY (from_user) REFERENCES system_user (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE support_message
  ADD CONSTRAINT fk_message_reply FOREIGN KEY (reply_to) REFERENCES support_message (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_message_ticket FOREIGN KEY (ticket_id) REFERENCES support_ticket (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_message_user FOREIGN KEY (from_user) REFERENCES system_user (id);

ALTER TABLE support_ticket
  ADD CONSTRAINT fk_ticket_customer FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT fk_ticket_status FOREIGN KEY (status) REFERENCES ticket_status (id);

ALTER TABLE system_user
  ADD CONSTRAINT fk_user_customer FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
