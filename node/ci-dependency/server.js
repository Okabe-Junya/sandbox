const app = require('express')();

app.get('/', (req, res) => {
  res.status(200).send('Hello, world!');
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.get('/version', (req, res) => {
  res.status(200).send('1.0.0');
});

app.listen(8080, () => {
  console.log('Listening on port 8080');
});

module.exports = app;
