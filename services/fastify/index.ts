import fastify from 'fastify';

const server = fastify();

server.get('/', async (req, res) => 'Hello, Fastify!');

server.listen(8080, "0.0.0.0", (err, address) => {
  if(err) {
    console.error(err);
    process.exit(1);
  }
  console.log(`Server listening at ${address}`);
});