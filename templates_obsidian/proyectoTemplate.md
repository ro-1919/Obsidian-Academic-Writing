<%*
  let title = tp.file.title
  if (title.startsWith("Untitled")) {
    title = await tp.system.prompt("Title");
    await tp.file.rename(title);
  } 
  
  tR += "---"
%>
title: <%* tR += title %>
author: 
aliases:
evento: []
year: 
tags:
due:
prioridad: ""
Tipo: Proyecto
kind:
  - Plan
estado:
  - 🌰
proyecto: ""
resumen:
completed: false
origen: "[[Proyectos]]"
created: 
updated: 
---
>[!info]+ **`INPUT[text:title]`**:
>**Año**: `INPUT[number:year]`
>**Proyecto**: `INPUT[text:proyecto]`
>**Tipo**: `INPUT[inlineSelect(option(Idea), option(Plan), option(Abstract), option(Ensayo), option(Borrador), option(Capítulo), option(Libro)):kind]`
>**Due**: `INPUT[datePicker:due]`
>**Estado**: `INPUT[inlineSelect(option(🌰, Borrador), option(🌱, Iniciado), option(🪴, Procesado), option(🌲, Acabando), option(🍁, Terminado), title(Estado)):estado]`
>**Prioridad**: `INPUT[inlineSelect(option(!, Poca), option(!!, Algo), option(!!!, Mucha), title(Prioridad)):prioridad]`
>**Tags**: `INPUT[inlineList:tags]`
>**Resumen**: `INPUT[textArea(showcase, class(meta-bind-full-width), class(meta-bind-high)):resumen]`

# Abstract

# Documentos 

# Textos
![[proyectos.base#Local]]

**Archivo** %% fold %%
![[proyectos (Archivo).base#Local]]