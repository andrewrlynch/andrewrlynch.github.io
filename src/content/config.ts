import { defineCollection, z } from 'astro:content';

const posts = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.coerce.date(),
    published: z.boolean().optional(),
    tags: z.string().optional(),
    thumbnail: z.string().optional(),
    toc: z.string().optional(),
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

export const collections = { posts, projects };
