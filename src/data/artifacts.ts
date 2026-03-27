/**
 * Artifacts — recent content items displayed in the MainLayout feed.
 * Each artifact represents a piece of content from any platform.
 */

export interface Artifact {
  title: string;
  date: string;         // ISO date string
  type: 'post' | 'note' | 'substack' | 'social';
  url: string;
  tags: string[];
  summary?: string;
}

export const artifacts: Artifact[] = [
  {
    title: "Thoughts on fitness in karyotype space",
    date: "2022-02-14",
    type: "post",
    url: "/posts/2022-02-14-thoughts-on-fitness-in-karyotype-space",
    tags: ["genomics", "CIN", "evolution"],
    summary: "Exploring how chromosomal instability creates fitness landscapes in cancer cells.",
  },
  {
    title: "pubready: a ggplot2 theme for publication figures",
    date: "2021-10-21",
    type: "post",
    url: "/posts/2021-10-21-theme-pubready",
    tags: ["R", "visualization", "tools"],
    summary: "A minimal ggplot2 theme optimized for journal figures.",
  },
  {
    title: "End of year / decade wrap-up",
    date: "2019-12-18",
    type: "post",
    url: "/posts/2019-12-18-end-of-year-decade-wrap-up",
    tags: ["personal", "reflection"],
    summary: "Looking back on a decade of science and life.",
  },
  {
    title: "Reflections on redefining the metric system",
    date: "2018-11-20",
    type: "note",
    url: "/posts/2018-11-20-reflections-redefining-metric-system",
    tags: ["science", "measurement"],
    summary: "On the 2019 redefinition of SI units in terms of fundamental constants.",
  },
  {
    title: "CINFER: estimating chromosomal instability from sequencing",
    date: "2023-06-01",
    type: "post",
    url: "/projects/CINFER",
    tags: ["genomics", "tools", "CIN", "R"],
    summary: "A computational method to estimate CIN rates from bulk sequencing data.",
  },
  {
    title: "NCI NRSA fellowship awarded",
    date: "2023-01-15",
    type: "note",
    url: "/about",
    tags: ["news", "fellowship"],
    summary: "Awarded an NRSA fellowship from the National Cancer Institute.",
  },
  {
    title: "Paper: Measuring chromosomal instability from oncology panel sequencing",
    date: "2023-03-10",
    type: "substack",
    url: "https://doi.org/10.1158/2159-8290.CD-22-0875",
    tags: ["paper", "genomics", "CIN"],
    summary: "Published in Cancer Discovery — new method for clinical CIN measurement.",
  },
  {
    title: "ggsuperviolin: enhanced violin plots in R",
    date: "2022-08-05",
    type: "post",
    url: "/projects/ggsuperviolin",
    tags: ["R", "visualization", "tools"],
    summary: "A ggplot2 extension for publication-quality violin plots with embedded boxplots.",
  },
  {
    title: "Moving from Jekyll to Astro",
    date: "2026-03-01",
    type: "note",
    url: "/posts/2018-03-23-moving",
    tags: ["web", "meta"],
    summary: "Rebuilt the site with Astro for better performance and developer experience.",
  },
  {
    title: "TRIUMPH fellowship from CPRIT",
    date: "2022-09-01",
    type: "social",
    url: "/about",
    tags: ["news", "fellowship"],
    summary: "Awarded a TRIUMPH translational research fellowship from CPRIT.",
  },
];

/**
 * Returns artifacts sorted by date descending (most recent first).
 */
export function getSortedArtifacts(): Artifact[] {
  return [...artifacts].sort((a, b) => b.date.localeCompare(a.date));
}
