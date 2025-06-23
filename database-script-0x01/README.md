# Database Schema – Airbnb Clone

This script defines the `schema.sql` file used to set up a relational database for Airbnb-like platform.

## Contents

The `schema.sql` file includes SQL statements to create the following tables:

- `users` – Stores user information with roles (guest, host, admin).
- `properties` – Listings created by hosts.
- `bookings` – Reservations made by users.
- `payments` – Payment records tied to bookings.
- `reviews` – Ratings and comments by users.
- `messages` – User-to-user communication.

## Key Features

- Primary and foreign key constraints for relational integrity.
- ENUM types for controlled field values (e.g., roles, payment methods).
- Indexes on foreign keys for performance optimization.
- Timestamps to track creation and updates.
- Designed to satisfy 3NF (Third Normal Form) for normalization.

## Usage

Run `schema.sql` on a MySQL-compatible database to initialize the schema.
