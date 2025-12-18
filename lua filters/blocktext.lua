local after_bq = false

return {
  {
    BlockQuote = function (blk)
      after_bq = true
    end,

    Para = function (blk)
      if after_bq then
        after_bq = false
        return pandoc.Div({blk}, pandoc.Attr("", {}, {["custom-style"] = "BodyText"}))
      end
    end
  }
}