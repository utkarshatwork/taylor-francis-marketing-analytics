-- 1. Create the dedicated Data Warehouse for this project
CREATE DATABASE IF NOT EXISTS publishing_roi_audit;
USE publishing_roi_audit;

-- 2. Authors Table
CREATE TABLE authors (
    author_id VARCHAR(10) PRIMARY KEY,
    job_title VARCHAR(100),
    institution_type VARCHAR(50),
    historical_publications INT,
    email_consent VARCHAR(10),
    country VARCHAR(50)
);

-- 3. Marketing Spend Table
CREATE TABLE marketing_spend (
    campaign_id VARCHAR(20) PRIMARY KEY,
    channel VARCHAR(50),
    campaign_budget_gbp DECIMAL(10, 2)
);

-- 4. Article Submissions Table
CREATE TABLE submissions (
    submission_id VARCHAR(10) PRIMARY KEY,
    author_id VARCHAR(10),
    submission_date DATE, -- Cleanly ingested as a native SQL Date
    journal_name VARCHAR(100),
    subject_area VARCHAR(50),
    status VARCHAR(50),
    apc_gbp DECIMAL(10, 2)
);

-- 5. Marketing Interactions Table
CREATE TABLE interactions (
    interaction_id VARCHAR(10) PRIMARY KEY,
    author_id VARCHAR(10),
    campaign_id VARCHAR(20),
    channel VARCHAR(50),
    interaction_type VARCHAR(50),
    interaction_date DATE -- Cleanly ingested as a native SQL Date
);