require! {
  \../classes/Card.ls
  \./fetch.ls
}

module.exports = {
  # url: String -> Promise([Card])
  url: (url) ->> @cheerio await fetch url

  # urls: [String] -> Promise([Card])
  urls: (urls) ->>
    results = []
    for it in urls
      results = results ++ await @url it
    results

  # cheerio: Cheerio -> [Card]
  cheerio: ($) ->
    $ ".sortCatalog li"
      .map (i, el) -> new Card($ el)
      .get!
}
