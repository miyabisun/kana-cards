require! {
  ramda: R
  \./fetch.ls
}

module.exports = {
  # url: String -> Promise([String])
  url: (url) ->> @cheerio url, await fetch url

  # cheerio: String -> Cheerio -> [String]
  cheerio: (url, $) ->
    $ '#under_navi a'
      .map (i, it) -> $ it .attr \href
      .get!
    |> R.map (.match /pageno=(.+)$/ .1) >> parse-int
    |> Math.max.apply null, _
    |> (-> [2 to it])
    |> R.map -> "#{url}&pageno=#it"
    |> (++ [url])
}
