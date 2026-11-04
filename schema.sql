-- Database Schema for Apex Media

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'advertiser' CHECK (role IN ('advertiser', 'admin')),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS billboards (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) NOT NULL,
    latitude DECIMAL(10, 8) NOT NULL,
    longitude DECIMAL(11, 8) NOT NULL,
    daily_impressions INT NOT NULL,
    daily_rate_usd DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'available'
);

CREATE TABLE IF NOT EXISTS campaigns (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users(id) ON DELETE CASCADE,
    billboard_id UUID REFERENCES billboards(id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost_usd DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS social_ad_sync (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    campaign_id UUID REFERENCES campaigns(id) ON DELETE CASCADE,
    platform VARCHAR(50) NOT NULL,
    radius_miles INT NOT NULL,
    daily_budget_usd DECIMAL(10, 2) NOT NULL,
    sync_status VARCHAR(50) DEFAULT 'queued',
    external_campaign_id VARCHAR(255),
    external_adset_id VARCHAR(255),
    error_log TEXT,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
