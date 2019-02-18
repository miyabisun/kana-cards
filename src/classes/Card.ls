module.exports = class Card
  (@$) ->
  base-name:~ -> @_base-name ?= @$.find \b .text!
  obj:~ -> {@name, @rarity, @condition, @num, @price, @url}

  name:~ -> @base-name.match /^[^\s【]+/ .0
  rarity:~ -> if @base-name.match /【(.+)】/ then that.1 else \ノーマル
  condition:~ -> @base-name.replace /^[^\s【]+(【.*】)?\s?/, ''
  num:~ -> @$.find \td .eq 3 .text!.match /\d*$/ |> (or ['']) |> (.0) |> parse-int
  price:~ -> @$.find \strong .text!.replace /[¥\s,]/g, "" |> parse-int
  url:~ -> @$.find \a .eq 0 .attr \href
