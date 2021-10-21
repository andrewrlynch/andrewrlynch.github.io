---
layout: post
title: A Decade In-Review
date: 31 Dec 2019
published: false
---
Well here we are. We're nearing the end of the Twenty-Tens. A decade of increasing global unrest, political polarization, climate change-related weather anomalies, CRISPR-babies, and Taylor Swift!
<br><br>
This year - 2019 - has been a great year for me. And this decade offers a lot to reflect on - within my own personal life and without. I'd like to kick off a new decade with a 'mental flush' of the events that resonated with me as defining the last 10 years.

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
<img align = "center" width = "300" src = "https://github.com/andrewrlynch/andrewrlynch.github.io/blob/master/post_files/2021-10-21_theme_pubready/theme_pubready_example.png">
