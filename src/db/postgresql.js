const { Pool, Client } = require("pg");

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
});

const query = (text, params, callback) => {
  return pool.query(text, params, callback);
};

module.exports = {
  query
};
