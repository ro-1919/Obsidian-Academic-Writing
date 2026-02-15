# Academic Writing Workflow with Zotero, Obsidian and Pandoc

## Español:

Esta información la he recopilado durante mi doctorado para poder escribir mi disertación en Obsidian. La comparto en caso de que pueda ayudar a alguien:

El workflow en pocas palabras:
- Obsidian lo utilizo para escribir y tomar notas de lecturas, teoría e ideas. Con el template de [Feral Flora](https://github.com/FeralFlora?tab=repositories), las notas de lectura pueden ser dinámicas, permitiendo actualizarse en caso de que se cambien los subrayados del archivo en Zotero.
- Zotero administra las citas y los archivos PDFs. La integración con Better BibTeX y sus citation keys permite citar fácil y no interrumpir la escritura.
- En caso de tener que compartir un archivo, utilizo Pandoc para exportar el documento en Obsidian `md` a `docx`. Al usar el filtro `.lua` de Better BibTeX, las citas exportadas serán reconocidas por Zotero y funcionaran de manera dinámica con su conector.

### Zotero
1. Descargar [Zotero](https://www.zotero.org/)
2. Descargar e instalar [Better BibTeX](https://retorque.re/zotero-better-bibtex/installation/) > Zotero > Tools > Plugin > Instill from file
3. Opcional: descargar [Conector](https://www.zotero.org/download/connectors) de Zotero para buscadores
4. En Configuraciones de Zotero
    - Better BibTeX > Citation key Formula: decide cómo quieres que sean tus [citations key](https://retorque.re/zotero-better-bibtex/citing/index.html). Por ejemplo, esta es mi fórmula: `authEtAl + "_" + shorttitle(2, 2) + "_" + year` -> `Foucault_VigilarCastigar_2003` o `Apellido_TítuloTítulo_Año`. Si hay más de un autor sólo incluye un apellido y agrega EtAl. Sobre el título, sólo incluye las dos primeras palabras.

### Pandoc:
1. Instalar [Pandoc](https://pandoc.org/installing.html). Recomiendo que se instale a través de un administrador de paquetes. Si se hace así, Pandoc se instalará en donde el sistema espera. Dicho de otra forma, no va a ser necesario agregar su ubicación en Obsidian porque va a estar donde *generalmente* está:
    - En MacOS recomiendo instalarlo a través [brew](https://brew.sh/). Después de instalar brew sólo es necesario, como dicen las intrucciones de Pandoc, escribir en la terminal `brew install pandoc`
    - En Windows no estoy seguro la mejor forma, supondría que winget, la paquetería oficial de Windows `winget install --source winget --exact --id JohnMacFarlane.Pandoc`
    - En linux dependería de la distribución
2. Descargar [archivo de referencia](https://pandoc-templates.org/) (esto depende de qué estilo de citas utilizas más seguido. Lo que Pandoc necesita son los estilos de párrafo, entonces son modificables. Digamos, es posible cambiarle la tipografía, tamaño, alineación; mientras se guarde en el estilo predeterminado (block text, paragraph, etc.; para saber puedes exportar un archivo y ver cuales son los que quieres modificar, tal vez el archivo de referencia no necesita modificaciones). Aquí puedes encontrar el que yo uso, [MLA, Times New Roman](./Reference file/MLA.docx).
3. Descargar filto [.lua](https://retorque.re/zotero-better-bibtex/exporting/zotero.lua). Generalmente se agregan en la carpeta filters de /Pandoc/filters/; pero como menciono debajo, si usas Obsidian sync puedes ponerlo dentro de Obsidian para que se sincronice con tu bóveda y sea más fácil referenciarlo.

### Obsidian:
1. Descargar [Obsidian](https://obsidian.md/)
2. Lista de Community Plugins necesarios (Options > Community plugins > Turn on):
    - **Zotero Integration** (Permite importar notas, subrayados e información de citas de Zotero a Obsidian. Para configurarlo: [Zotero Importer, template and button to update note](hhttps://gist.github.com/FeralFlora/78f494c1862ce4457cef28d9d9ba5a01))
      - Aquí es importante recordar que los templates pueden y deben modificarse de acuerdo a lo que uses y necesites.
    - **Enhancing Export** (Permite exporar con Pandoc desde Obsidian, abajo la información de cómo configurarlo)
    - **Pandoc Reference List** (Se conecta con Zotero para recomendar Citation Keys al comenzar a escribirlas Tambien renderiza la cita para que aparezca en formato "Autor, # pag.")
    - Longform (Hace que obsidian funcione como Scrivener, permitiendo crear un proyecto que contenga múltiples notas que después puede compilarse en un solo documento)
    - Meta Bind (Permite crear botones y modificar la metadata desde el cuerpo de las notas)
    - Templater (Automatizar templates)
    - List Callout (Necesario si sigues el template de FeralFlora)
3. Recomendados:
    - QuickAdd
    - Auto Link Title
    - Better Word Count
    - Enhanced Annotation
    - Iconize
    - Homepage
    - Link with alias
    - Plugin Update Tracker
4. Más recursos: Obsidian > Pandoc + Zotero > Word:
    - [Obsidian for Academics](https://github.com/FeralFlora/obsidian-hub/blob/main/04%20-%20Guides%2C%20Workflows%2C%20%26%20Courses/for%20Academic%20Writing.md)
    - [Academic Writing Obsidian Workflow](https://medium.com/@alexandraphelan/an-academic-workflow-zotero-obsidian-56bf918d51ab)
    - [More info Academic Writing Workflow](https://publish.obsidian.md/hub/04+-+Guides%2C+Workflows%2C+%26+Courses/for+Academic+Writing)

#### Enhancing Export:

1. Recordar que es necesario un Word de referencia en el estilo que vas a necesitar.
2. Poner los siguientes Extra Arguments:

`--lua-filter="${vaultDir}/99-Archivo/Pandoc/zotero.lua" --reference-doc="${vaultDir}/99-Archivo/Pandoc/MLA.docx" --metadata=zotero_csl-style:mla --metadata=zotero_author-in-text:true`

*${vaultDir} = significa la  ubicación de la bóveda de obsidian. Si usas Obsidan sync, por ejemplo, puedes aprovechar y crear un folder para "Pandoc" que contenga todo lo que se necesita para exportar: archivo de referencia y filtro lua. Si no usas obsidian sync y pusiste las cosas en otro lugar, **necesitas poner su ubicación**.
**lua filter `zotero.lua`= este filtro básicamente hace que las referencias Pandoc al pasar al documento Word sean editables para el add-on de Zotero. La ventaja de usarlo así es que las citas seguirán siendo configurables en Word y la bibliografía será dinámica.

#### Exportar un archivo `.md` (obsidian) a `.docx` (word) en terminal:

`pandoc -f markdown -t docx "PATH\TO\OBSIDIAN\FILE.md" -o "PATH\TO\OUTPUT\WORD\FILE.docx" --lua-filter="PATH\TO\Pandoc\filters\zotero.lua" --reference-doc="PATH\TO\REFERENCE\MLA.docx" --metadata=zotero_author-in-text:true`

-f = from

-t = to

-o = output

---

## English:

I have compiled this information during my PhD in order to write my dissertation in Obsidian. I am sharing it in case it may be useful to others:

### Workflow (In Short)

- Obsidian is used for writing and note-taking, allowing readings, theories, and ideas to be connected. I always try to keep Markdown (`.md`) files as the primary text format, since they are easier to work with, export to other formats, and adapt to different citation styles.
- Zotero manages citations and associated files (PDFs). It runs in the background and works seamlessly with Better BibTeX Citation Keys, making it easy to cite sources directly from Obsidian.
- When I need to share a file, I use Pandoc to export the `.md` file to `.docx`. The resulting document only requires a Zotero refresh in Word to generate the citations (in your prefer style) and format the *Works Cited* list.

### Zotero
1. Download [Zotero](https://www.zotero.org/)
2. Install [Better BibTeX](https://retorque.re/zotero-better-bibtex/installation/)
3. Install Zotero Word Add-In (Zotero > Settings > Cite > Word Add-In)
4. Recommended: [Browser Connector](https://www.zotero.org/download/connectors)

### Obsidian:
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

### Pandoc:
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
-o "PATH\TO\OUTPUT\WORD\FILE.docx" \
--lua-filter="PATH\TO\Pandoc\filters\zotero.lua" \
--reference-doc="PATH\TO\REFERENCE\MLA.docx" \
--metadata=zotero_author-in-text:true

-f = from

-t = to

-o = output

---