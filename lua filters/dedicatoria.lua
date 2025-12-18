function Pandoc(doc)
  local dedicatoria = doc.meta.dedicatoria
  if not dedicatoria then return doc end

  local blocks = {}

  -- Recorremos cada línea de la dedicatoria (asumimos lista de strings)
  for _, item in ipairs(dedicatoria) do
    local text = pandoc.utils.stringify(item)
    if text == "" then
      table.insert(blocks, pandoc.Para({})) -- párrafo vacío
    else
      table.insert(blocks, pandoc.Para({pandoc.Str(text)})) -- párrafo con texto
    end
  end

  -- Agrupamos en un Div con estilo "Dedicatoria"
  local div = pandoc.Div(blocks, pandoc.Attr("", {}, {["custom-style"] = "Dedicatoria"}))

  -- Insertamos al inicio del documento
  table.insert(doc.blocks, 1, div)

  return doc
end
