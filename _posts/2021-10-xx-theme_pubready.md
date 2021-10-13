---
layout: post
title: theme_pubready: a ggplot theme for small, publication-ready plots
date: xx October 2021
published: false
---
A while back I found myself creating a lot of small plots where I was removing the gridlines and reducing the size of axis text as a way to 'declutter' the small visuals. To save time a generated this ggplot theme.
~~~
function(){
   font <- "Arial"
   theme_minimal() %+replace%
   
      theme(
         panel.grid = element_blank(),
         panel.background = element_rect(color = "black", size = 0.5),
         axis.ticks = element_line(size = 0.25),
         axis.line = element_blank(),
         axis.text = element_text(size = 6),
         axis.title = element_text(size = 7),
         strip.background = element_blank(),
         strip.text = element_text(size = 7)
      )
}
~~~
{: .language-r}
