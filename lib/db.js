import nextConnect from 'next-connect';

import { Pool } from 'pg'

const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
});

async function database(req, res, next) {
    req.dbClient = pool;
    return next();
}

const middleware = nextConnect();
middleware.use(database);

export default middleware;
export { pool as dbClient };
