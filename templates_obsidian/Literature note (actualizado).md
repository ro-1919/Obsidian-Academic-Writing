---
citekey: '{{citekey}}'
title: '{{title}}'
Autor: {{authors}}
{%- set camelRegex = r/([a-z])([A-Z])/g %}
{%- for type, creators in creators | groupby("creatorType") %} 
{% if creators.length > 1 %}{{type | replace(camelRegex, "$1 $2") | lower | trim}}s:{%- for creator in creators %}{% if creator.name %}
 - {{creator.name}}{% else%}
 - {{creator.firstName}} {{creator.lastName}} {% endif %}{%- endfor %} {% else -%}
{{type | replace(camelRegex, "$1-$2") | lower | trim}}:{%- for creator in creators %}{% if creator.name %} "{{creator.name}}"{% else%} "{{creator.firstName}} {{creator.lastName}}"{% endif -%}{%- endfor -%}{% endif -%}{% endfor %}
año: {% if date %}{{date | format("YYYY")}}{% endif %}{% if itemType == "bookSection" %}
book-title: "{{bookTitle | replace('"',"'")}}"{% endif %}
aliases: 
 - '{%- if shortTitle %} {{shortTitle | safe}} {%- else %} {{title | safe}} {%- endif -%}'
 - " {%- if creators -%}
        {{creators[0].lastName}}
        {%- if creators|length > 1 %} et al.{% endif -%}
    {%- endif -%}
    {%- if date %} ({{date | format("YYYY")}}){% endif -%} 
    {%- if shortTitle %} {{shortTitle | safe}} {%- else %} {{title | safe}} {%- endif -%}"{% if DOI %}
 - '{{citekey}}'
doi: https://doi.org/{{DOI}}{% endif %}{% if itemType == "book" %}
ISBN: {{ISBN}}{% endif %}
estado: {% for t in tags %}{{t.tag}}{% if not loop.last %}{% endif %}{% endfor %}
resumen: '{% persist "r" %}  {% if isFirstImport %}{% endif %}{% endpersist %}'
item-type: {{itemType | replace(camelRegex, "$1 $2") | title | trim}}
created: 
updated: 
---
>[!info]+ **[{%- if shortTitle %} {{shortTitle | safe}} {%- else %} {{title | safe}} {%- endif -%}]({{desktopURI}})**
>**Autores**: {% for a in creators %} [[07-Autores/{{a.lastName}}, {{a.firstName}}|{{a.firstName}} {{a.lastName}}]]{% if not loop.last %}, {% endif %}{% endfor %}
>**Año**: {{date | format ("YYYY")}}
>**Estado**:  {% for t in tags %}{{t.tag}}{% if not loop.last %}, {% endif %}{% endfor %}
>**Citekey**: `{{citekey}}`
>{% if bibliography %}**Bibliography**: {{bibliography|replace("\n"," ")}}{% endif %}
>[**Zotero**]({{desktopURI}}){% if DOI %} | [**DOI**](https://doi.org/{{DOI}}){% endif %}{% for attachment in attachments | filterby("path", "endswith", ".pdf") %} | [**PDF-{{loop.index}}**](file:///{{attachment.path | replace(" ", "%20")}}){%- endfor %}
> {% if abstractNote %} **Abstract**:
> {{abstractNote|replace("\n","\n>")|striptags(true)|replace("Objectives", "**Objectives**")|replace("Background", "**Background**")|replace("Methodology", "**Methodology**")|replace("Results","**Results**")|replace("Conclusion","**Conclusion**")}}
> {% endif %}

`BUTTON[update-litnote]`

{% persist "notes" %}
{% if isFirstImport %}
# Análisis

## Resumen de lectura



@{{citekey}}

## Conceptos, autores y enlaces

- **Conceptos**: 
	- 
- **Relaciones**: 
	- 

%% 04-Conceptos/ %% %% 05-Periodos/Hechos/ %% %% 05-Periodos/Personajes/ %% %% 07-Autores/ %%

## Análisis corto %% fold %%
%%Qué dice%%

%%Cómo lo dice%%

%%Por qué lo dice cómo lo dice%%

## Notas de lectura %% fold %%



{% endif %}{% endpersist %}

## Relaciones %% fold %%

![[lecturas.base#Local]]

---
# Citas

{% set colorValueMap = {
    "#ff6666": {
        "colorCategory": "Red",
        "heading": "⭕ Very important",
        "symbol": "!"
    },
    "#2ea8e5": {
        "colorCategory": "Blue",
        "heading": "⭐ Important",
        "symbol": "@"
    },
    "#5fb236": {
        "colorCategory": "Green",
        "heading": "🎯 Major statement",
        "symbol": "$"
    },
    "#ffd400": {
        "colorCategory": "Yellow",
        "heading": "📚 Ordinary notes",
        "symbol": "&"
    }
} -%}

{%- macro tagFormatter(annotation) -%}
    {% if annotation.tags -%}
        {%- for t in annotation.tags %} #{{ t.tag | replace(r/\s+/g, "-") }}{% if not loop.last %}, {% endif %}{%- endfor %}
    {%- endif %}
{%- endmacro -%}

{% if annotations.length > 0 %}
*Imported on [[{{importDate | format("YYYY-MM-DD")}}]] at {{importDate | format("HH:mm")}}*

{%- set grouped_annotations = annotations | groupby("color") -%}
{%- for color, colorValue in colorValueMap -%}
{%- if color in grouped_annotations -%} 
{%- set annotations = grouped_annotations[color] -%}
{%- for annotation in annotations -%}
{% if annotation.pageLabel %}
{%- set citationLink = '[(p. ' ~ annotation.pageLabel ~ ')](' ~ annotation.desktopURI ~ ')' %}
{%- else %}
{%- set citationLink = '[Open in Zotero](zotero://open-pdf/library/items/' ~ annotation.attachment.itemKey ~ '?page&annotation=' ~ annotation.id ~ ')' %}
{% endif %}
{%- set tagString = tagFormatter(annotation) %}

{%- if annotation and loop.first %}

### {{colorValue.heading}} %% fold %%
{% endif -%}

{%- if annotation.imageRelativePath %}

> [!cite]+ Image {{citationLink}}
> ![[{{annotation.imageRelativePath}}]]{% if annotation.tags %}
> {{tagString}}{% endif %}{%- if (annotation.comment or []).indexOf("todo ") !== -1 %}
> - [ ] **{{annotation.comment | replace("todo ", "")}}**{%- elif annotation.comment %}
> **{{annotation.comment}}**{%- endif %}
{% elif (annotation.comment or []).indexOf("todo ") !== -1 %}
- [ ] **{{annotation.comment | replace("todo ", "")}}**:{% if not annotation.annotatedText %} {{citationLink}}{% else %}
	- {{colorValue.symbol}}  {{annotation.annotatedText | replace(r/\s+/g, " ")}} {{citationLink}}{{tagString}}{% endif -%}
{% elif annotation.comment %}
- **{{annotation.comment}}**:{% if not annotation.annotatedText %} {{citationLink}}{% else %}
	- {{colorValue.symbol}}  {{annotation.annotatedText | replace(r/\s+/g, " ") }} {{citationLink}}{{tagString}}{% endif -%}
{%- elif annotation.annotatedText %}
- {{colorValue.symbol}}  {{annotation.annotatedText | replace(r/\s+/g, " ") }} {{citationLink}}{{tagString}}
{%- endif -%}{%- endfor %}{%- endif -%}
{% endfor -%}
{% endif %}