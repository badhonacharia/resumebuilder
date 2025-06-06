-- Users Table
CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

-- CVs Table
CREATE TABLE cvs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED,
    title VARCHAR(255),
    template_id BIGINT UNSIGNED,
    is_public BOOLEAN DEFAULT FALSE,
    public_link VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (template_id) REFERENCES templates(id)
);

-- Personal Info Table
CREATE TABLE personal_infos (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    full_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(100),
    address TEXT,
    summary TEXT,
    date_of_birth DATE,
    photo_url VARCHAR(255),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Educations
CREATE TABLE educations (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    school_name VARCHAR(255),
    degree VARCHAR(255),
    field_of_study VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Experiences
CREATE TABLE experiences (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    job_title VARCHAR(255),
    company_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Skills
CREATE TABLE skills (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    skill_name VARCHAR(100),
    level ENUM('Beginner', 'Intermediate', 'Advanced', 'Expert'),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Languages
CREATE TABLE languages (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    language VARCHAR(100),
    proficiency ENUM('Basic', 'Conversational', 'Fluent', 'Native'),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Projects
CREATE TABLE projects (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    title VARCHAR(255),
    description TEXT,
    link VARCHAR(255),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Certifications
CREATE TABLE certifications (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    name VARCHAR(255),
    issuer VARCHAR(255),
    issue_date DATE,
    expiry_date DATE,
    description TEXT,
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- References
CREATE TABLE references (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cv_id BIGINT UNSIGNED,
    ref_name VARCHAR(255),
    company VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(100),
    relationship VARCHAR(255),
    FOREIGN KEY (cv_id) REFERENCES cvs(id) ON DELETE CASCADE
);

-- Templates
CREATE TABLE templates (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    preview_image VARCHAR(255),
    file_path VARCHAR(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);
