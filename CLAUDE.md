# andrewrlynch.github.io — Astro redesign

Worktree: `.claude/worktrees/focused-curie/` → branch `claude/focused-curie`

---

## Stack

- **Astro** (SSG, v4) with TypeScript
- **Content collections** for all data (Zod schemas in `src/content/config.ts`)
- **SCSS** (`src/styles/`) — `main.scss` imports `_base.scss`, `_highlights.scss`, `_reset.scss`
- Deployed to GitHub Pages via `astro.config.mjs`

---

## Directory structure

```
src/
  components/         # Reusable Astro components
    Footer.astro
    PostMeta.astro      # date · updated · tags · versions (horizontal or vertical layout)
    SiteHeader.astro    # sticky nav with hide-on-scroll
    SocialIcons.astro
    TableOfContents.astro  # h2/h3 links with scrollspy
    Ticker.astro
    VersionHistory.astro   # version list + LCS word diff toggle

  content/            # Astro content collections
    areas/            # research areas (title, description)
    pages/            # misc one-off pages: cv.md, about.md, etc.
    papers/           # academic papers (authors, doi, journal, thumbnail, …)
    posts/            # blog posts; versioned slugs end in -v\d+
    projects/         # software projects (title, description, repo)
    config.ts         # Zod schemas for all collections

  data/
    artifacts.ts      # getSortedArtifacts() — manually curated feed items
    ticker.ts         # ticker strip entries

  layouts/
    BaseLayout.astro       # bare HTML shell (rarely used)
    CatalogueLayout.astro  # index/listing pages (tiles / list / feed toggle)
    MainLayout.astro       # homepage: hero + artifact feed + areas + projects
    PageLayout.astro       # *** universal three-column article layout ***
    PaperLayout.astro      # academic paper pages (left metadata, right Dimensions badge)
    PostLayout.astro       # posts — resolves pageLayout config → PageLayout

  pages/
    index.astro            # homepage → MainLayout
    [page].astro           # dynamic route for content/pages/* collection
    artifacts.astro        # all artifacts with type filter
    areas/index.astro      # areas catalogue
    papers/index.astro     # papers catalogue (feed view only)
    papers/[slug].astro
    posts/index.astro      # posts catalogue (tiles / list / feed)
    posts/[slug].astro
    projects/index.astro
    projects/[slug].astro

  styles/
    _base.scss
    _highlights.scss   # Pygments/Rouge syntax theme (backgrounds stripped — pre has its own)
    _reset.scss
    main.scss          # fluid type scale, CSS custom properties, global resets
```

---

## PageLayout — universal layout system

`PageLayout.astro` is the base for all article/page rendering. It provides a three-column grid with named slots.

### Slots

| Slot | Position | Typical use |
|------|----------|-------------|
| `left` | left panel (sticky) | `TableOfContents` |
| *(default)* | center body | page content |
| `right` | right panel | `PostMeta`, `VersionHistory` |

### Props (key ones)

```ts
title, subtitle, date, updated, tags, versions, currentVersion
headerImage          // full-width header image
showLeftPanel        // boolean (default true)
showRightPanel       // boolean (default true)
leftWidth            // CSS string e.g. "25%" (default "25%")
centerWidth          // CSS string e.g. "50%" (default "50%")
rightWidth           // CSS string e.g. "25%" (default "25%")
suppressHeaderMeta   // hide meta row in header when metadata lives in a panel
```

When both panels are hidden the body column is auto-centered.

### pageLayout frontmatter config

Posts and pages declare their layout in frontmatter. `PostLayout` and `[page].astro` resolve this into PageLayout props:

```yaml
pageLayout:
  left:
    width: quarter          # full|three-quarter|two-third|half|one-third|quarter|none
    components:
      toc:
        layout: vertical    # vertical|horizontal
  center:
    width: half
  right:
    width: quarter
    components:
      metadata:
        layout: vertical
      version: true
```

Width name → CSS: `full=100%`, `three-quarter=75%`, `two-third=66.67%`, `half=50%`, `one-third=33.33%`, `quarter=25%`, `none=hidden`.

If a panel is omitted when `pageLayout` is present, it defaults to hidden (`none`).

### Adding a component as a panel module

1. Build the component in `src/components/`.
2. Accept a `layout?: 'vertical' | 'horizontal'` prop for orientation flexibility.
3. In `PostLayout.astro` (or `[page].astro`), check for the relevant `components` key and inject the component into the appropriate slot:
   ```astro
   {showRightPanel && myComponentEnabled && (
     <MyComponent layout={myLayout} slot="right" />
   )}
   ```
4. Add the config key to `panelSchema` in `config.ts` if it needs frontmatter control.

---

## CatalogueLayout — index pages

Props: `title`, `subtitle`, `maxCols` (default 3), `minCols` (default 1), `defaultView` ('tiles'|'list'|'feed'), `displayToggle` (bool), `tagFilter` (bool, placeholder), `thumbnails` (bool).

Card structure expected in consumer pages:
- `.catalogue-card` — wrapper (gets clickable-card overlay via `::after`)
- `.card-title` / `.card-title-row` — primary link
- `.card-dates` / `.card-date` — date element(s)
- `.card-excerpt`, `.card-tags`, `.card-tag`, `.card-read-more`, `.card-thumb`

List view: title left, date right. Tiles: compact (no excerpt). Feed: full cards with excerpt.

---

## Content collections

### posts
`title`, `date`, `updated?`, `published?`, `description?`, `tags?` (comma-sep string), `thumbnail?`, `pageLayout?`

Versioned posts: slugs ending in `-v\d+` (e.g. `demo-versioning-v2`). `PostLayout` auto-detects all versions of the same base slug and passes them to `VersionHistory`.

### pages
`title`, `subtitle?`, `date?`, `updated?`, `tags?`, `headerImage?`, `published?`, `pageLayout?`

Rendered by `src/pages/[page].astro` at `/<slug>` (e.g. `/cv`, `/about`).

### papers
`title`, `authors[]`, `journal?`, `year?`, `date?`, `abstract?`, `doi?`, `pdf?`, `fulltext?`, `code?`, `data?`, `thumbnail?`, `tags?`, `published?`

### areas
`title`, `description?`, `published?`

---

## Key design decisions

- **No MarkdownLayout** — deleted. Misc pages go in `content/pages/` and are rendered by `[page].astro` with full `pageLayout` support.
- **Stretched-link pattern** for catalogue cards: `position: relative` on `.catalogue-card` + `::after` pseudo-element on `.card-title` with `inset: 0` covers the whole card without nesting `<a>` inside `<a>`.
- **Code block background**: `pre` gets `background: rgb(250, 249, 247) !important` in `PageLayout.astro`; `_highlights.scss` has all per-token `background-color` removed so there's no per-line highlighting fighting the block background.
- **Scrollspy**: `IntersectionObserver` in `PageLayout.astro` highlights `[data-toc-link]` elements and syncs the lines strip in the left panel.

---

## To-do

### Diff versioning (partially built)
`VersionHistory.astro` renders version list and has client-side JS for:
- Clicking a non-current version: fetches that page, swaps `#body` innerHTML, updates URL via `history.pushState`
- "show diff" toggle: fetches predecessor, extracts text, runs LCS word diff, renders `<ins>`/`<del>` inline

**Remaining work:**
- HTML-level diff rather than plain-text diff (currently diffs `innerText`, so markup isn't preserved)
- Diff should render inside the normal styled body, not a `pre-wrap` container
- The "show diff" state should survive version switches (e.g. toggling diff on v2 then clicking v1 should show v1→v2 diff)
- Consider preloading version content at build time to avoid fetch latency

### Horizontal component layouts
Currently `PostMeta` and `TableOfContents` have a vertical layout suitable for side panels. When `toc: center` or metadata is used inline (e.g. below the title), they need horizontal variants:
- `TableOfContents` with `layout: horizontal` → compact dot-row or inline pill list
- `PostMeta` with `layout: horizontal` → already partially built, needs polish for inline header use

### Automatic artifact ingestion
`src/data/artifacts.ts` is currently manually curated. The goal is to automatically pull in:
- Posts from **notes.andrewlynch.io** (RSS or API)
- Posts from **Substack** (RSS)
- Optionally social posts

Approach: add a build-time fetch in `artifacts.ts` (or a separate `src/data/remote-artifacts.ts`) that requests the RSS feeds and merges entries with the manual list, deduplicating by URL.

### Footer
`src/components/Footer.astro` is minimal. Planned improvements:
- Column layout: site sections (Posts, Papers, Projects, Areas) + social links + colophon
- "Built with Astro" / license / last-updated line
- Consistent with the site's Menlo/monospace label aesthetic
