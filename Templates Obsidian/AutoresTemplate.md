<%*
  let title = tp.file.title
  if (title.startsWith("Untitled")) {
    title = await tp.system.prompt("Title");
    await tp.file.rename(title);
  } 
  
  tR += "---"
%>
title: <%* tR += title %>
image:
aliases:
tags:
years:
país:
corrientes:
conceptos:
obras:
resumen: ""
bio: ""
origen: "[[autores]]"
created: 
updated: 
---
>[!info]+ **`INPUT[text:Title]`**:
>**Aliases**: `INPUT[inlineList:aliases]`
>**País**: `INPUT[text:país]`
>**Fechas**: `INPUT[text:years]`
>**Corriente**: `INPUT[inlineList:corrientes]`
>**Obras importantes**: `INPUT[inlineList:obras]`
>**Biografía**: `INPUT[textArea(showcase, class(meta-bind-full-width), class(meta-bind-high)):bio]`
> **Resumen**: `INPUT[textArea(showcase, class(meta-bind-full-width), class(meta-bind-high)):resumen]`

![[lecturas.base#Local]]

# Obras:

## 

