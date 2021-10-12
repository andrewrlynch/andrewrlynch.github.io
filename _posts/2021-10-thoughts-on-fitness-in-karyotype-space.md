---
layout: post
title: Thoughts on visualizing fitness in karyotype space
date: xx October 2021
published: true
---
The publication of our [pre-print](https://www.biorxiv.org/content/10.1101/2021.04.26.441466v1) on advancing quantification of chromosomal instability is nigh. I'm wrapping up a long stretch of revisions for the re-submit and, as a result, have been thinking a great deal about karyotype selection. Ultimately, we want to be able to experimentally quantify selection, but how to represent this? Reviews on the effects of selection, in general, are rife with toy visualizations of 'genotype spaces'. The concept is understandable to me and is easily generalized to the biology of aneuploidy — a 'karyotype space'. However, I've recently been attempting to plot out a fitness landscape for karyotypes and it's clear I underestimated the difficulty of implementing a *useful* visualization of karyotypic space.<br>
<img align="center" width="400" src="https://upload.wikimedia.org/wikipedia/commons/e/ea/Visualization_of_two_dimensions_of_a_NK_fitness_landscape.png">

I want to be clear about what I'm trying to produce. I want a granular landscape where fitness values are defined for every unique karyotype from haploid to tetraploid presented in an intuitive and useful way. 
### Permutation through karyotypic space
~~~
#Selecting 
karyos <- as.data.frame(combinations(4, 23, v=1:4, repeats.allowed = T))
~~~
{: .language-r}
### Calculating ploidy, aneuploidy, and fitness of each karyotype

## Fitness landscapes with respect to ploidy and aneuploidy

### Two-dimensional linear fitness landscape

### Three-dimensional fitness landscapes

### n-dimensional fitness landscape using adjacency
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
