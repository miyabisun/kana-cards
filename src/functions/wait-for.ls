# wait-for :: Number -> Promise
module.exports = (time) ->
  new Promise (resolve) ->
    set-timeout resolve, time
