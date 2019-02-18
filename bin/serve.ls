require! {
  express
  ramda: R
  \../config.ls
  \../src/modules/update.ls
}
state = {}
update-state = ->>
  console.log "update state!"
  await update state, config.urls
  console.log "update state is successful."

main = ->>
  await update-state!
  set-interval update-state, config.update-interval

  app = express!
  app.get \/, (req, res) ->
    config.urls
    |> R.keys
    |> res.json
  config.urls
  |> R.keys
  |> R.for-each (key) ->
    app.get "/#key", (req, res) ->
      state.(key).map (.obj)
      |> ->
        if req.query.all isnt \true then it.filter (.num > 0)
        else it
      |> ->
        if req.query.status is \true then it.filter (.condition.match /^(火力|雷装)/)
        else it
      |> res.json
  app.listen config.port

  console.log "Get Ready..."

main!
