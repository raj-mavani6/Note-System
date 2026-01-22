-- ============================================
-- NOTES SYSTEM ADMIN DATABASE SETUP
-- MySQL Workbench Database Script
-- ============================================

-- Create Database
CREATE DATABASE IF NOT EXISTS NotesSystem;
USE NotesSystem;

-- ============================================
-- ADMINS TABLE (Admin Panel)
-- ============================================
CREATE TABLE IF NOT EXISTS Admins (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    ProfileImageUrl VARCHAR(500) NULL,
    Role VARCHAR(50) DEFAULT 'Admin',
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsActive BOOLEAN DEFAULT TRUE,
    INDEX idx_email (Email),
    INDEX idx_is_active (IsActive)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ============================================
-- INSERT ADMIN QUERY
-- ============================================
INSERT INTO Admins (FullName, Email, Password, Role, IsActive) 
VALUES ('Super Admin', 'admin@notessystem.com', 'admin123', 'Super Admin', TRUE)
ON DUPLICATE KEY UPDATE FullName = FullName;