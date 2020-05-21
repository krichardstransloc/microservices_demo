import express from 'express';
const app: express.Application = express();
app.get('/', (_, res) => res.send('Hello, Express!'))
app.listen(8080, () => console.log(`Listening at express:8080`));