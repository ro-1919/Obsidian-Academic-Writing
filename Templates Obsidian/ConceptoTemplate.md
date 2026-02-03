<%*
  let title = tp.file.title
  if (title.startsWith("Untitled")) {
    title = await tp.system.prompt("Title");
    await tp.file.rename(title);
  } 
  
  tR += "---"
%>
title: <%* tR += title %>
aliases:
tags:
resumen:
origen: "[[Conceptos]]"
created: 
updated: 
---
> [!info+] : **`INPUT[text:title]`**
>**Aliases**: `INPUT[inlineList:aliases]`
> **tags**: `INPUT[inlineList:tags]`
> **Resumen**:`INPUT[textArea(showcase, class(meta-bind-full-width), class(meta-bind-high)):resumen]`
> @



# Descripción

# Teóricos:

##



> [!note] 

##



> [!note] 

# Relaciones

![[lecturas.base#Local]]