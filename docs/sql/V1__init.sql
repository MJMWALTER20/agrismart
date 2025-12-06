-- ============================================================
-- AgriSmart - Initial SQL Migration (V1)
-- ============================================================

-- ===========================
-- USERS
-- ===========================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    phone VARCHAR(20) UNIQUE NOT NULL,
    full_name VARCHAR(100),
    role VARCHAR(30) DEFAULT 'PRODUCER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================
-- PRODUCERS
-- ===========================
CREATE TABLE producers (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    region VARCHAR(100),
    village VARCHAR(100),
    gps_latitude DECIMAL(10,6),
    gps_longitude DECIMAL(10,6),
    land_area FLOAT,
    main_crops TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ===========================
-- CROP PROFILES (CULTURES)
-- ===========================
CREATE TABLE crops (
    id SERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    description TEXT,
    planting_period VARCHAR(120),
    cycle_duration INT, -- en jours
    watering_frequency VARCHAR(100),
    fertilizer_guidelines TEXT
);

-- ===========================
-- EVENTS (CALENDRIER)
-- ===========================
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    producer_id INT NOT NULL,
    crop_id INT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    due_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING', -- PENDING / DONE
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producer_id) REFERENCES producers(id) ON DELETE CASCADE,
    FOREIGN KEY (crop_id) REFERENCES crops(id)
);

-- ===========================
-- MARKETPLACE LISTINGS
-- ===========================
CREATE TABLE listings (
    id SERIAL PRIMARY KEY,
    producer_id INT NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    category VARCHAR(50),
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producer_id) REFERENCES producers(id) ON DELETE CASCADE
);

-- ===========================
-- MESSAGES (CHAT)
-- ===========================
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (receiver_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ===========================
-- NOTIFICATIONS
-- ===========================
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    title VARCHAR(200),
    body TEXT,
    read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- ============================================================
-- FIN DE LA MIGRATION V1
-- ============================================================

