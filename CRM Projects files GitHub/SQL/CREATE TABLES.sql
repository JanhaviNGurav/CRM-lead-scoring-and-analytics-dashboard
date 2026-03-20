CREATE TABLE programs (
    program_id TEXT PRIMARY KEY,
    program_name TEXT,
    college TEXT,
    degree_level TEXT,
    delivery_mode TEXT
);

CREATE TABLE campaigns (
    campaign_id TEXT PRIMARY KEY,
    campaign_name TEXT,
    channel TEXT,
    start_date TEXT,
    end_date TEXT,
    budget REAL
);

CREATE TABLE prospects (
    prospect_id TEXT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    gender TEXT,
    country TEXT,
    state TEXT,
    program_id TEXT,
    inquiry_date TEXT,
    source_channel TEXT,
    funnel_stage TEXT,
    application_status TEXT,
    lead_score INTEGER,
    FOREIGN KEY (program_id) REFERENCES programs(program_id)
);

CREATE TABLE communications (
    comm_id TEXT PRIMARY KEY,
    prospect_id TEXT,
    campaign_id TEXT,
    comm_date TEXT,
    communication_type TEXT,
    opened_flag INTEGER,
    clicked_flag INTEGER,
    replied_flag INTEGER,
    FOREIGN KEY (prospect_id) REFERENCES prospects(prospect_id),
    FOREIGN KEY (campaign_id) REFERENCES campaigns(campaign_id)
);

CREATE TABLE events (
    event_id TEXT PRIMARY KEY,
    event_name TEXT,
    event_type TEXT,
    event_date TEXT
);

CREATE TABLE event_participation (
    participation_id TEXT PRIMARY KEY,
    prospect_id TEXT,
    event_id TEXT,
    attended_flag INTEGER,
    FOREIGN KEY (prospect_id) REFERENCES prospects(prospect_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);