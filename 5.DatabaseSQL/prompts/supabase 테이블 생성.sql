CREATE TABLE IF NOT EXISTS price_trends (
    month TEXT,
    market_type TEXT,
    category TEXT,
    item TEXT,
    spec TEXT,
    price_source TEXT,
    price REAL
);