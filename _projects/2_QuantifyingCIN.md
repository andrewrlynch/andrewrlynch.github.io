---
title: Quantifying Chromosomal Instability
subtitle: from algorithmic first-principles, toward clinical impact (my PhD thesis)
forward:
image: images/iBover.png
permalink: projects/QuantifyingCIN
collection: projects
layout: panes_page
website:
---

## Improving Quantification of Chromosomal Instability
### How often do chromosome mis-segregations occur in cancer?
CIN is a dynamic process that occurs over many cellular divisions. This makes its study in human tumors—which cannot be constantly monitored—difficult. As such, the precise association between a tumor's intrinsic level of CIN—its rate of chromosome mis-segregation—and intratumoral karyotype diversity remain ambiguous. Modeling and parameterization of the factors that contribute to karyotype diversity—time, mis-segregation rate, and selective pressure—enables the simulation of the process of CIN. The outcomes of these simulations can be compared to tumor-derived single cell sequencing datasets that, while only providing a snapshot in time, can provide a great deal of information on the karyotypic diversity of the tumor. **[[Lynch et al., *eLife*, 2022]](https://elifesciences.org/articles/69799)**

<div style="white-space: nowrap; background-color: white; padding: 1%; border-radius: 10px; box-shadow: 0 0 15px #99999933">
    <img src="{{site.baseurl}}/images/image42.gif" style="width:24%">
    <img src="{{site.baseurl}}/images/image43.gif" style="width:24%">
    <img src="{{site.baseurl}}/images/image45.gif" style="width:24%">
    <img src="{{site.baseurl}}/images/image49.gif" style="width:24%">
</div>

We found that this approach to measuring CIN outperforms traditional methods such as mitotic chromosome and centromeric FISH counts. **[[Lynch et al., *bioRxiv*, 2023]](https://www.biorxiv.org/content/10.1101/2023.06.15.544840v1.full.pdf)** To make this approach more... aproachable, I developed **[CINFER](https://burkardlab.shinyapps.io/CINFER/)**, a tool to estimate mis-segregation rates from single cell copy number data.

### How do multipolar divisions reshape cells' karyotypes?
**[Meet iBover](https://andrewrlynch.shinyapps.io/iBover/)**

<div style="white-space: nowrap; background-color: white; padding: 1%; border-radius: 10px; box-shadow: 0 0 15px #99999933">
<img src="{{site.baseurl}}/images/iBover.png" style="width:75%" align="center">
</div>