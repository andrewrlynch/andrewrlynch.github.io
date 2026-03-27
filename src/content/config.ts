import { defineCollection, z } from 'astro:content';

const widthEnum = z.enum(['full', 'three-quarter', 'two-third', 'half', 'one-third', 'quarter', 'none']).optional();

const tocComponentSchema = z.object({
  layout: z.enum(['vertical', 'horizontal']).optional(),
}).optional();

const metadataComponentSchema = z.object({
  layout: z.enum(['vertical', 'horizontal']).optional(),
}).optional();

const panelSchema = z.object({
  width: widthEnum,
  components: z.object({
    toc: z.union([z.boolean(), tocComponentSchema]).optional(),
    metadata: z.union([z.boolean(), metadataComponentSchema]).optional(),
    version: z.boolean().optional(),
  }).optional(),
}).optional();

const pageLayoutSchema = z.object({
  center: panelSchema,
  left: panelSchema,
  right: panelSchema,
}).optional();

const posts = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    updated: z.coerce.date().optional(),
    published: z.boolean().optional(),
    description: z.string().optional(),
    tags: z.string().optional(),
    thumbnail: z.string().optional(),
    toc: z.string().optional(),
    pageLayout: pageLayoutSchema,
  }),
});

const projects = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    published: z.boolean().optional(),
    repo: z.string().optional(),
  }),
});

const papers = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    authors: z.array(z.string()),          // list of author names
    journal: z.string().optional(),
    year: z.number().optional(),
    date: z.coerce.date().optional(),
    abstract: z.string().optional(),       // can be in frontmatter or body
    doi: z.string().optional(),            // e.g. "10.1000/xyz123"
    pdf: z.string().optional(),            // path to local PDF asset
    fulltext: z.string().optional(),       // URL to full text
    code: z.string().optional(),           // URL to code repo
    data: z.string().optional(),           // URL to data repo
    thumbnail: z.string().optional(),      // path to image asset
    tags: z.string().optional(),
    published: z.boolean().optional(),
  }),
});

const areas = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    description: z.string().optional(),
    published: z.boolean().optional(),
  }),
});

const pages = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    subtitle: z.string().optional(),
    date: z.coerce.date().optional(),
    updated: z.coerce.date().optional(),
    tags: z.string().optional(),
    headerImage: z.string().optional(),
    published: z.boolean().optional(),
    pageLayout: pageLayoutSchema,
  }),
});

export const collections = { posts, projects, papers, areas, pages };
