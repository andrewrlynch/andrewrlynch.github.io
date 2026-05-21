---
title: SeqPlotR
description: "Flexible, grid-based genomic track plots."
date: 2026-05-20
published: true
repo: "https://andrewlynch.io/SeqPlotR"
slug: SeqPlotR
---

[SeqPlotR](https://andrewlynch.io/SeqPlotR) is an R6-based genomic visualization package built on R's grid graphics system and inspired by the layered grammar of ggplot2, the unified genomic axes of gTrack, and the grid layout of patchwork. Plots are composed by chaining tracks, elements, and links through a %+% operator, with all rendering sharing a single viewport — enabling cross-track drawing primitives such as points, lines, segments, bars or more complex features like "ReCon"-style SV reconstructions, synteny bands, 1D or 2D genomic heatmaps, and more.
