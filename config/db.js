const hostWithPort = `${process.env.DB_HOST}${process.env.DB_PORT ? `:${process.env.DB_PORT}` : ''}`;
const connectionStr = `postgres://${process.env.DB_USER}:${process.env.DB_PASSWORD}@${hostWithPort}/${process.env.DB_NAME}`;

const schema = 'public';

module.exports = {
  connectionStr,
  schema
};
