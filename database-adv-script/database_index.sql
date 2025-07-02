-- Before indexing

EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'u1'
  
-- Indexes to improve query performance for Airbnb Clone backend

-- 1. Index on users.user_id (frequently used in JOINs with bookings)
CREATE INDEX idx_users_id ON users(user_id);

-- 2. Index on bookings.user_id (frequent WHERE and JOIN usage)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- 3. Index on bookings.property_id (frequent JOIN with properties, used in analytics)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- 4. Index on bookings.start_date (used in date range searches or ORDER BY)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- 5. Index on properties.property_id (used in JOINs and filtering)
CREATE INDEX idx_properties_id ON properties(property_id);

-- 6. Index on reviews.property_id (used in JOINs and aggregations)
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- AFTER indexing
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'u1'
