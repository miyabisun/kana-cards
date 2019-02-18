require! {
  cheerio
  \node-fetch : fetch
}

# fetch: String -> Promise (Cheerio)
module.exports = (url) ->>
  res = await fetch url
  text = await res.text!
  cheerio.load text
