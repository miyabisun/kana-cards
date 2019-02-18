require! {
  \../config.ls
  \../src/modules/update.ls
}

state = {}

main = ->>
  await update state, config.urls
  console.log state

main!
