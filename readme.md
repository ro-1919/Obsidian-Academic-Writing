Esta información la he recopilado durante mi doctorado para poder escribir mi disertación, junto con otros tipos de escritura académica, dentro de Obsidian. Los comparto en caso de que pueda ayudarle a alguien más, igual recomiendo ver el resto de archivos como templates y filtos.lua:

Zotero
1. Descargar [Zotero](https://www.zotero.org/)
2. Instalar [Better Bibtex](https://retorque.re/zotero-better-bibtex/installation/)
3. Opcional: descargar [Conector](https://www.zotero.org/download/connectors) de Zotero para buscadores

Obsidian:
1. Descargar [Obsidian](https://obsidian.md/)
2. Lista de Community Plugins necesarios (Options > Community plugins):
    - Longform
    - Meta Bind
    - Pandoc Reference List
    - QuickAdd
    - Templater
    - Zotero Integration
    - Enhancing Export (no me ha funcionado últimamente)
Community Plugins recomendados:
    - Auto Link Title
    - Better Word Count
    - Callout Manager
    - Enhanced Annotations
    - Iconize
    - Homepage
    - Link with alias
    - Plugin Update Tracker
    - QuickAdd
3. Obsidian > Pandoc + Zotero > Word:
    - https://forum.obsidian.md/u/Feralflora/summary
    - https://medium.com/@alexandraphelan/an-academic-workflow-zotero-obsidian-56bf918d51ab
    - https://publish.obsidian.md/hub/04+-+Guides%2C+Workflows%2C+%26+Courses/for+Academic+Writing

Pandoc (recomiendo ponerlo todo en una carpeta fácilmente accesible):
1. Instalar [Pandoc](https://pandoc.org/installing.html)
2. Descargar [archivo de referencia](https://pandoc-templates.org/) (esto depende de qué estilo de citas utilizas más seguido)
3. Descargar filto [.lua](https://retorque.re/zotero-better-bibtex/exporting/zotero.lua), este debe estar en una carpeta llamada "filters" dentro de la carpeta de Pandoc. Pueden agregarse otros filtros.


Si el plugin Enhancing Export está funcionado (las últimas veces conjelaba elementos de Obsidian), es necesario:
1. Crear un nuevo tipo de exportación de tipo Word, el nombre no tiene importancia
2. Extra Arguments: --lua-filter="UBICACIÓN DE CARPETA\Pandoc\filters\zotero.lua" --reference-doc="UBICACIÓN DE ARCHIVO REFERENCIA\MLA.docx" --metadata=zotero_author-in-text:true

Ejemplo de exportar un archivo de obsidian a word en terminal:

pandoc -f markdown -t docx "UBICACIÓN DEL ARCHIVO DE OBSIDIAN\ARCHIVO.md" -o "UBICACIÓN FINAL DE ARCHIVO WORD\ARCHIVO.docx" --lua-filter="UBICACIÓN DE CARPETA\Pandoc\filters\zotero.lua" --reference-doc="UBICACIÓN DE ARCHIVO REFERENCIA\MLA.docx" --metadata=zotero_author-in-text:true

-f = from
-t = to
-o = output

