-- Kayole Tenant
CREATE DATABASE IF NOT EXISTS openmrs_kayolesch CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'kayole_user'@'%' IDENTIFIED BY 'kayole_pass';
GRANT ALL PRIVILEGES ON openmrs_kayolesch.* TO 'kayole_user'@'%';

-- Mbagathi Tenant
CREATE DATABASE IF NOT EXISTS openmrs_mbagathicrh CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'mbagathi_user'@'%' IDENTIFIED BY 'mbagathi_pass';
GRANT ALL PRIVILEGES ON openmrs_mbagathicrh.* TO 'mbagathi_user'@'%';
