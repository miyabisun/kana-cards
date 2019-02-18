require! {
  \prelude-ls : P
  \../functions/fetch.ls
  \../functions/to-cards.ls
  \../functions/to-pages.ls
  \../functions/wait-for.ls
}

# update :: Object -> Object -> Promise
module.exports = (state, urls) ->>
  for key, url of urls
    await wait-for 2000
    pages = await to-pages.url url
    state.(key) = await to-cards.urls pages
