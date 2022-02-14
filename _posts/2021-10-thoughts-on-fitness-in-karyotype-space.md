---
layout: post
title: Thoughts on visualizing fitness in karyotype space
date: xx October 2021
published: false
tags: science data-visualization aneuploidy
---
The publication of our [pre-print](https://www.biorxiv.org/content/10.1101/2021.04.26.441466v1) on advancing quantification of chromosomal instability is nigh. I'm wrapped up a long stretch of revisions for the re-submit and, as a result, have been thinking a great deal about karyotype selection. Ultimately, we want to be able to experimentally quantify selection. We're not there yet, but how would we represent this when that time comes? Reviews on the effects of selection, in general, are rife with toy visualizations of 'genotype spaces'. The *concept* is understandable to me and is easily generalized to the biology of aneuploidy — a 'karyotype space'. However, I've recently been attempting to plot out a fitness landscape for karyotypes and it's clear I underestimated the difficulty of implementing a *useful* visualization of karyotypic space.<br>
<img align="center" width="400" src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Visualization_of_two_dimensions_of_a_NK_fitness_landscape.png">

I want to be clear about what I'm trying to produce. I want a granular landscape where fitness values are defined for every unique karyotype from haploid to tetraploid presented in an intuitive and useful way.
### Permutation through karyotypic space
My first impressions of fitness landscapes were conceptual. In reality, there are 4<sup>23</sup> unique karyotypes between an *n* of 1 and 4 and I don't think it would necessarily be useful to consider all 70 trillion+. Let's consider a smaller karyotypic space of, say, 8 chromosomes. Permuting yields 65,536 unique karyotypes.
~~~
library(arrangements)
#Selecting copy numbers 1-4 for k chromosomes
k <- 8
karyos <- as.data.frame(permutations(x=1:4,k=k,replace=T))
~~~
{: .language-r}

### Calculating ploidy, aneuploidy, and *theoretical* fitness of each karyotype
We can now calculate the individual characteristics of these karyotypes that are actually interesting. Ploidy and aneuploidy are pretty easy to calculate as just the average copy number and average intra-karyotype variance respectively. But how do you calculate fitness of aneuploid karyotypes? One way to look at this is through the lens of stabilizing selection—selection against clones with karyotypes that stray too far from a 'core' karyotype. Current evidence, at least in non-cancer-derived tissue suggests that aneuploid cellular fitness is negatively correlated to the number of genes on the chromosome(s) for which a cell is aneuploid<sup>1,2</sup>. For example, aneuploidy of chromosome 1 having a larger fitness detriment than that of chromosome 18 [1,2]. So in this case it's all about balancing the stoichiometry of expressed genes.

~~~
# Sum the number of annotated genes on each chromosome
chrscores <- c(2880 + 2615, 1647 + 2557, 1392 + 1806, 746 + 1917, 710 + 2282, 1541 + 1539, 1082 + 1947, 959 + 1536)

# Normalize the gene abundance of each chromosome to the sum across the karyotype to get relative gene abundance (relative importance to fitness). 
chrscores <- chrscores / sum(chrscores

# Calculate the ploidy for each karyotype
karyos$ploidy <- apply(karyos[,1:k], 1, function(x){sum(x)/k})

# Calculate the aneuploidy of each karyotype
karyos$aneuploidy <- apply(karyos[,1:k], 1, function(x){var(x)})

# Calculate the fitness of each karyotype (this takes a few seconds)
karyos$fitness <- apply(karyos[,1:k], 1, function(x){
  f <- vector() #Create a vector to hold the modified fitness values of each chromosome
  for(c in 1:k){
    f[c] <- chrscores[c] - (chrscores[c] * (abs(x[c] - mean(x))))/ mean(x) # Modify the fitness value of each chromosome by how unbalanced it is from the ploidy of the cell.
  }
  sum(f)
})
~~~
{: .language-r}

Great! What did we just do? We generated chromosome scores for chromosomes 1-8; we calculated the ploidy and aneuploidy of each karyotype in the set; and we used these values to calculate the fitness of the karyotype by assuming a balanced (i.e. euploid) karyotype has a perfect fitness with all chromosome scores summing to 1. We also modified the chromosome scores such that chromosomes that were more unbalanced from the ploidy of the cell experienced a fitness detriment, so the sum of chromosome scores for that karyotype would be < 1. There are some caveats to these assumptions like 1) the ploidy of 2.5 indicates the cell is already aneuploid so this may not be the best denominator and 2) the assumption that gains will be roughly equally detrimental as losses, which may not be true in normal tissue due to haploinsufficiency of many genes. Yet I think this is a good place to start.

Let's plot!

### Two-dimensional fitness landscape
Starting with something super simple. Let's just consider the landscape of all 8-chromosome karyotypes ordered by fitness.

~~~
library(ggplot2)

karyos$id <- rownames(karyos) # Assign an id to each karyotype to easily re-order them by fitness

ggplot(karyos, aes(x=reorder.factor(id,fitness), y=fitness)) + 
  geom_point(aes(col = fitness)) + 
  theme_pubready() + 
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_text(size = 9),
    axis.ticks.x = element_blank(),
    legend.position = "none",
    axis.title = element_text(size = 10)
  ) + 
  scale_x_discrete(expand = c(0.1,0.1)) + 
  scale_color_gradient(low="tomato1", high = "steelblue1", limits = c(0,1)) + 
  labs(x="Karyotype", y="Fitness")
~~~
{: .language-r}

<img src="https://github.com/andrewrlynch/andrewrlynch.github.io/blob/master/post_files/2021-10-karyotype-fitness-landscapes/linear.png?raw=true" width="300" height="300" img align="center">

Okay cool! So what does this tell us? In general, karyotypes that are more aneuploid are less fit! That jives with what we know about the biology of aneuploidy in normal, non-cancerous tissue. But it doesn't appear to be a clean gradient. Looking closely there are interspersed pockets of blue and red, so this doesn't give us all the information we need to resolve the full fitness landscape.

### Three-dimensional fitness landscapes
Now let's shoot for something more like the 'classic' fitness landscape. The nice surface plot
<img src="https://raw.githubusercontent.com/andrewrlynch/andrewrlynch.github.io/master/post_files/2021-10-karyotype-fitness-landscapes/3d_fitness.png" width="300" height="300" img align="center">

### n-dimensional fitness landscape using adjacency networks
~~~
#Function to calculate manhattan distance between two vectors
manhattan_dist <- function(a, b){
  dist <- abs(a-b)
  dist <- sum(dist)
  return(dist)
}

#Function to apply the above to calculate manhattan distances between two karyotypes
pairwise.manhattan <- function(x){
  pairwise.comparisons <- t(combn(nrow(x),2))
  results.matrix <- matrix(nrow = nrow(x), ncol = nrow(x))
  for(i in 1:nrow(pairwise.comparisons)){
    vec <- pairwise.comparisons[i,]
    results.matrix[vec[1], vec[2]] <- manhattan_dist(karyotypes[vec[1],], karyotypes[vec[2],])
    results.matrix[vec[2], vec[1]] <- manhattan_dist(karyotypes[vec[1],], karyotypes[vec[2],])
  }
  return(results.matrix)
}

karyo.copies <- 4 #copies from 1-4
karyo.set <- 2 #two chromosomes of a karyotypes
karyotypes <- permutations(n=karyo.copies,r=karyo.set,v=1:karyo.copies, repeats.allowed = T)
~~~
{: .language-r}

### Footnotes
1. DOI:10.1101/2021.08.31.458318
2. DOI:10.1016/j.tig.2011.07.003
