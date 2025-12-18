-- Filtro Pandoc para eliminar identificadores de todos los bloques

function Pandoc(doc)
    -- Itera sobre todos los bloques en el cuerpo del documento
    for i, el in ipairs(doc.blocks) do
        -- Si el elemento (bloque) tiene un atributo 'identifier', lo establece a una cadena vacía
        if el.identifier then
            el.identifier = ""
        end
        -- Nota: Los identificadores de inlines (como para enlaces internos) también existen,
        -- pero este filtro se enfoca en los identificadores de bloque.
        -- Para eliminar todos los identificadores, incluyendo los de inlines,
        -- se necesitaría una recursión a través de todos los elementos del documento.
    end
    return doc
end
