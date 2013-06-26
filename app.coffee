express  = require 'express'
app = express()
statuses = {}

app.configure ->
  app.set "port", process.env.PORT or 4000
  app.use express.bodyParser()

app.get '/', (req, res) ->
  res.send 'Hello, Zaiste!'

app.get '/status', (req, res) ->
  if not req.query.id
    res.send { status : null }

  if statuses[req.query.id]
    res.send { status : statuses[req.query.id] }
  
  res.send { status : 'unknown' }

app.post '/status', (req, res) ->
  console.log req.body
  console.log req.params
  console.log req.body.id
  console.log req

  if not req.body.id
    res.send '1'

  res.send '2'

app.listen app.get('port'), ->
  console.log "Listening on port #{app.get('port')}"