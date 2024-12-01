---
layout: default
title: theme_pubready | a ggplot theme for small, publication-ready plots
date: 2021-10-21
published: true
tags: r ggplot2 data-visualization
thumbnail: assets/writing/2021-10-21-theme-pubready/theme_pubready_example.png
toc: "off"
---
A while back I found myself creating a lot of small plots where I was removing the gridlines and reducing the size of axis text as a way to 'declutter' the small visuals. To save time, I generated this ggplot theme.

~~~
theme_pubready <- function(){
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

Now let's plot an example.
~~~
library(ggplot2)
library(ggpubr)

df <- data.frame(x=rnorm(50),y=rnorm(50))

p1 <- ggplot(df,aes(x=x,y=y)) + 
   geom_point() + 
   ggtitle("theme_grey")
   
p2 <- ggplot(df,aes(x=x,y=y)) + 
   geom_point() + 
   theme_pubready() + 
   ggtitle("theme_pubready")
   
ggarrange(p1,p2)
~~~
{: .language-r}
<br>
![](/assets/writing/2021-10-21-theme-pubready/theme_pubready_example.png)
