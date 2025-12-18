# Academic Writing Workflow with Obsidian, Zotero, and Pandoc

English:

I have compiled this information during my PhD in order to write my dissertation in Obsidian. I am sharing it in case it may be useful to others; I also recommend checking the rest of the files, such as templates and filters.lua.

## Workflow (In Short)

- Obsidian is used for writing and note-taking, allowing readings, theories, and ideas to be connected. I always try to keep Markdown (`.md`) files as the primary text format, since they are easier to work with, export to other formats, and adapt to different citation styles.
- Zotero manages citations and associated files (PDFs). It runs in the background and works seamlessly with Better BibTeX Citation Keys, making it easy to cite sources directly from Obsidian.
- When I need to share a file, I use Pandoc to export the `.md` file to `.docx`. The resulting document only requires a Zotero refresh in Word to generate the citations (in your prefer style) and format the *Works Cited* list.

## Zotero
1. Download [Zotero](https://www.zotero.org/)
2. Install [Better Bibtex](https://retorque.re/zotero-better-bibtex/installation/)
3. Install Zotero Word Add-In (Zotero > Settings > Cite > Word Add-In)
4. Recommended: [Browser Connector](https://www.zotero.org/download/connectors)

## Obsidian:
1. Download [Obsidian](https://obsidian.md/)
2. Requiered Community Plugins (Under: Options > Community plugins):
    - Longform
    - Meta Bind
    - Pandoc Reference List
    - QuickAdd
    - Templater
    - Zotero Integration
    - Enhancing Export (no me ha funcionado últimamente)
3. Other Community Plugin recommendations:
    - Auto Link Title
    - Better Word Count
    - Callout Manager
    - Enhanced Annotations
    - Iconize
    - Homepage
    - Link with alias
    - Plugin Update Tracker
4. Workflow to link Zotero + Obsidian:
    - [Zotero Importer, template and button to update note](https://github.com/FeralFlora?tab=repositories)
    - [Academic Writing Obsidian Workflow](https://medium.com/@alexandraphelan/an-academic-workflow-zotero-obsidian-56bf918d51ab)
    - [More info Academic Writing Workflow](https://publish.obsidian.md/hub/04+-+Guides%2C+Workflows%2C+%26+Courses/for+Academic+Writing)

## Pandoc:
1. Install [Pandoc](https://pandoc.org/installing.html)
2. Download [archivo de referencia](https://pandoc-templates.org/) (esto depende de qué estilo de citas utilizas más seguido)
3. Download Filter [zotero.lua](https://retorque.re/zotero-better-bibtex/exporting/zotero.lua)

If the Enhancing Export plugin is working:

1. Add new export template for Word
2. Add the following Extra Arguments:

--lua-filter="PATH\TO\Pandoc\filters\zotero.lua"
--reference-doc="PATH\TO\REFERENCE\MLA.docx"
--metadata=zotero_author-in-text:true

Exporting from Terminal (Example)

Example command to export an Obsidian Markdown file to Word using Pandoc:

pandoc -f markdown -t docx "PATH\TO\OBSIDIAN\FILE.md" \
-o "PATH\TO\OUTPUT\LOCATION\WORD\FILE.docx" \
--lua-filter="PATH\TO\Pandoc\filters\zotero.lua" \
--reference-doc="PATH\TO\REFERENCE\MLA.docx" \
--metadata=zotero_author-in-text:true

-f = from

-t = to

-o = output

---

Español:

Esta información la he recopilado durante mi doctorado para poder escribir mi disertación dentro de Obsidian. La comparto en caso de que pueda ayudar a alguien más; igualmente, recomiendo revisar el resto de los archivos, como templates y filtros.lua.

El workflow en pocas palabras:
- Obsidian lo utilizo para la escritura y la toma de notas de lecturas, teoría e ideas. Esta aplicación también permite enlazar las notas para hacerlas dinámicas. Esta es una de las razones por las que prefiero manter el 'md' en Obsidian como el archivo principal, además de que es mucho más sencillo exportarlo, editarlo y cambiarle estilo de citación.
- Zotero siempre está abierto ya que administra las citas y los archivos PDFs relacionado con estas. La integración con Better Bibtex y sus citation keys permite citar fácil y no interrumpir la escritura.
- En caso de tener que compartir un archivo, utilizo Pandoc para exportar el documento en Obsidian 'md' a 'docx'. El resultado es un archivo listo para exportar, sólo necesita hacer una _refresh_ de zotero para elegir qué tipo de estilo de cita se prefiere y general después la bibliografía.
- NOTA: Pandoc puede generar automáticamente un estilo, sin tener que usar zotero. Sin embargo, mantener zotero en el archivo word hace que las citas sean dinámicas. En caso de editar el archivo word, modificar citas o transferir una parte a un nuevo archivo, las referencias seguirán sido reconocidas por zotero.

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
3. Community Plugins recomendados:
    - Auto Link Title
    - Better Word Count
    - Callout Manager
    - Enhanced Annotations
    - Iconize
    - Homepage
    - Link with alias
    - Plugin Update Tracker
4. Obsidian > Pandoc + Zotero > Word:
    - [Zotero Importer, template and button to update note](https://github.com/FeralFlora?tab=repositories)
    - [Academic Writing Obsidian Workflow](https://medium.com/@alexandraphelan/an-academic-workflow-zotero-obsidian-56bf918d51ab)
    - [More info Academic Writing Workflow](https://publish.obsidian.md/hub/04+-+Guides%2C+Workflows%2C+%26+Courses/for+Academic+Writing)

Pandoc (recomiendo ponerlo todo en una carpeta fácilmente accesible):
1. Instalar [Pandoc](https://pandoc.org/installing.html)
2. Descargar [archivo de referencia](https://pandoc-templates.org/) (esto depende de qué estilo de citas utilizas más seguido)
3. Descargar filto [.lua](https://retorque.re/zotero-better-bibtex/exporting/zotero.lua), este debe estar en una carpeta llamada "filters" dentro de la carpeta de Pandoc. Pueden agregarse otros filtros.


Si Enhancing Export está funcionado:

1. Agregar template para exportar tipo Word
2. Poner los siguientes Extra Arguments:

--lua-filter="PATH\TO\Pandoc\filters\zotero.lua"
--reference-doc="PATH\TO\REFERENCE\MLA.docx"
--metadata=zotero_author-in-text:true

Ejemplo para exportar un archivo de 'md' (obsidian) a word en terminal:

pandoc -f markdown -t docx "PATH\TO\OBSIDIAN\FILE.md" \
-o "PATH\TO\OUTPUT\LOCATION\WORD\FILE.docx" \
--lua-filter="PATH\TO\Pandoc\filters\zotero.lua" \
--reference-doc="PATH\TO\REFERENCE\MLA.docx" \
--metadata=zotero_author-in-text:true

-f = from

-t = to

-o = output

