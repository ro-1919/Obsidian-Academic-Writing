-- =========================================
-- Filtro combinado Pandoc
-- Dedicatoria + limpieza de IDs + Zotero check
-- =========================================

-- ---- Zotero Better BibTeX version check ----
print('zotero-live-citations 199d652')
local online, mt, latest = pcall(
    pandoc.mediabag.fetch,
    'https://retorque.re/zotero-better-bibtex/exporting/zotero.lua.revision'
)
if online then
    latest = string.sub(latest, 1, 10)
    if '199d652' ~= latest then
        print('new version')
        end
        end

        -- ---- Función principal ----
        function Pandoc(doc)

        -- ===== Dedicatoria =====
        local dedicatoria = doc.meta.dedicatoria
        if dedicatoria then
            local blocks = {}

            for _, item in ipairs(dedicatoria) do
                local text = pandoc.utils.stringify(item)
                if text == "" then
                    table.insert(blocks, pandoc.Para({}))
                    else
                        table.insert(blocks, pandoc.Para({ pandoc.Str(text) }))
                        end
                        end

                        local div = pandoc.Div(
                            blocks,
                            pandoc.Attr("", {}, { ["custom-style"] = "Dedicatoria" })
                        )

                        table.insert(doc.blocks, 1, div)
                        end

                        -- ===== Eliminar identificadores de bloques =====
                        for _, el in ipairs(doc.blocks) do
                            if el.identifier then
                                el.identifier = ""
                                end
                                end

                                return doc
                                end
