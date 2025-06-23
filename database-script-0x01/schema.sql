CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role ENUM('guest', 'host', 'admin') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);


CREATE TABLE properties (
    property_id CHAR(50) PRIMARY KEY,
    host_id CHAR(50) NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_host FOREIGN KEY (host_id) REFERENCES users(user_id)
);

CREATE INDEX idx_properties_host_id ON properties(host_id);

CREATE TABLE bookings (
    booking_id CHAR(50) PRIMARY KEY,
    property_id CHAR(50) NOT NULL,
    user_id CHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

CREATE TABLE payments (
    payment_id CHAR(50) PRIMARY KEY,
    booking_id CHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,

    CONSTRAINT fk_payment_booking FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);

CREATE INDEX idx_payments_booking_id ON payments(booking_id);

CREATE TABLE reviews (
    review_id CHAR(50) PRIMARY KEY,
    property_id CHAR(50) NOT NULL,
    user_id CHAR(50) NOT NULL,
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_review_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
    CONSTRAINT fk_review_user FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);


CREATE TABLE messages (
    message_id CHAR(50) PRIMARY KEY,
    sender_id CHAR(50) NOT NULL,
    recipient_id CHAR(50) NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES users(user_id),
    CONSTRAINT fk_message_recipient FOREIGN KEY (recipient_id) REFERENCES users(user_id)
);

CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);


