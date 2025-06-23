
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('u1', 'Tolu', 'Adetuyi', 'tolu@example.com', 'hashed_pw1', '08012345678', 'guest', NOW()),
  ('u2', 'Chioma', 'Okafor', 'chioma@example.com', 'hashed_pw2', '08123456789', 'host', NOW()),
  ('u3', 'Ifeanyi', 'Eze', 'ifeanyi@example.com', 'hashed_pw3', '07098765432', 'guest', NOW()),
  ('u4', 'Amina', 'Bello', 'amina@example.com', 'hashed_pw4', '08087654321', 'host', NOW()),
  ('u5', 'Femi', 'Johnson', 'femi@example.com', 'hashed_pw5', '09011223344', 'admin', NOW());


INSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at) VALUES
  ('p1', 'u2', 'Lekki Apartment', 'Modern apartment in Lekki Phase 1.', 'Lagos', 45000.00, NOW(), NOW()),
  ('p2', 'u4', 'Maitama Villa', 'Luxury villa in Abuja with pool.', 'Abuja', 120000.00, NOW(), NOW()),
  ('p3', 'u2', 'Yaba Studio', 'Affordable studio for students.', 'Lagos', 20000.00, NOW(), NOW()),
  ('p4', 'u4', 'Kaduna Cottage', 'Quiet 2-bedroom cottage.', 'Kaduna', 30000.00, NOW(), NOW()),
  ('p5', 'u2', 'Ibadan Retreat', 'Nature-filled shortlet with calm view.', 'Ibadan', 25000.00, NOW(), NOW());


INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('b1', 'p1', 'u1', '2025-07-01', '2025-07-03', 90000.00, 'confirmed', NOW()),
  ('b2', 'p2', 'u3', '2025-07-05', '2025-07-07', 240000.00, 'confirmed', NOW()),
  ('b3', 'p3', 'u1', '2025-07-10', '2025-07-12', 40000.00, 'cancelled', NOW()),
  ('b4', 'p4', 'u3', '2025-08-01', '2025-08-04', 90000.00, 'confirmed', NOW()),
  ('b5', 'p5', 'u1', '2025-08-10', '2025-08-13', 75000.00, 'pending', NOW());


INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('pay1', 'b1', 90000.00, NOW(), 'bank_transfer'),
  ('pay2', 'b2', 240000.00, NOW(), 'credit_card'),
  ('pay3', 'b3', 40000.00, NOW(), 'paypal'),
  ('pay4', 'b4', 90000.00, NOW(), 'ussd'),
  ('pay5', 'b5', 75000.00, NOW(), 'wallet');


INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('r1', 'p1', 'u1', 5, 'Lovely experience. Will return.', NOW()),
  ('r2', 'p2', 'u3', 4, 'Clean and spacious.', NOW()),
  ('r3', 'p3', 'u1', 3, 'Noisy neighborhood.', NOW()),
  ('r4', 'p4', 'u3', 5, 'Exactly as described.', NOW()),
  ('r5', 'p5', 'u1', 4, 'Beautiful view, but Wi-Fi was weak.', NOW());


INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('m1', 'u1', 'u2', 'Hi Chioma, is the Lekki Apartment available next weekend?', NOW()),
  ('m2', 'u2', 'u1', 'Yes, it is available. Feel free to book.', NOW()),
  ('m3', 'u3', 'u4', 'Hello Amina, can I get a discount on Maitama Villa?', NOW()),
  ('m4', 'u4', 'u3', 'Yes, we offer 10% off for 3+ nights.', NOW()),
  ('m5', 'u1', 'u2', 'Can I check-in early?', NOW());
