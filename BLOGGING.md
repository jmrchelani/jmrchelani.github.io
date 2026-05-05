# Blogging

Write posts as Markdown files in `content/blog`.

Each post starts with frontmatter:

```md
---
title: "My Post Title"
description: "A short SEO description for search results and social previews."
date: "2026-05-05"
updated: "2026-05-05"
tags: ["Software", "Notes"]
slug: "my-post-title"
draft: false
---

# My Post Title

Write the post here.
```

Build the static blog:

```sh
npm run build
```

The build generates:

- `blog/index.html`
- `blog/<slug>/index.html`
- `blog/posts.json`
- `blog/posts.js`
- `sitemap.xml`
- `rss.xml`

Published post URLs use this shape:

```txt
https://jmrchelani.com/blog/my-post-title/
```
