const fs = require("fs");
const path = require("path");

const ROOT = __dirname;
const SITE_URL = "https://jmrchelani.com";
const SOURCE_DIR = path.join(ROOT, "content", "blog");
const BLOG_DIR = path.join(ROOT, "blog");
const AUTHOR = "Mahtab Chelani aka Milton";
const SITE_TITLE = "Milton's Blog";
const SITE_DESCRIPTION = "Notes from Mahtab Chelani aka Milton on software, products, automation, tooling, and useful internet things.";

function escapeHTML(value) {
  return String(value ?? "")
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function escapeAttr(value) {
  return escapeHTML(value).replaceAll("\n", " ");
}

function slugify(value) {
  return String(value)
    .toLowerCase()
    .trim()
    .replace(/['"]/g, "")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

function parseValue(value) {
  const trimmed = value.trim();
  if (trimmed === "true") return true;
  if (trimmed === "false") return false;
  if (trimmed.startsWith("[") && trimmed.endsWith("]")) {
    return trimmed
      .slice(1, -1)
      .split(",")
      .map((item) => item.trim().replace(/^["']|["']$/g, ""))
      .filter(Boolean);
  }
  return trimmed.replace(/^["']|["']$/g, "");
}

function parseFrontmatter(raw, filename) {
  if (!raw.startsWith("---")) {
    return {
      data: {},
      body: raw
    };
  }

  const end = raw.indexOf("\n---", 3);
  if (end === -1) {
    throw new Error(`Missing frontmatter closing marker in ${filename}`);
  }

  const block = raw.slice(3, end).trim();
  const body = raw.slice(end + 4).replace(/^\r?\n/, "");
  const data = {};

  block.split(/\r?\n/).forEach((line) => {
    const match = line.match(/^([A-Za-z0-9_-]+):\s*(.*)$/);
    if (match) data[match[1]] = parseValue(match[2]);
  });

  return { data, body };
}

function renderInline(markdown) {
  let html = escapeHTML(markdown);
  html = html.replace(/!\[([^\]]*)\]\(([^)]+)\)/g, '<img src="$2" alt="$1">');
  html = html.replace(/\[([^\]]+)\]\(([^)]+)\)/g, '<a href="$2">$1</a>');
  html = html.replace(/`([^`]+)`/g, "<code>$1</code>");
  html = html.replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>");
  html = html.replace(/\*([^*]+)\*/g, "<em>$1</em>");
  return html;
}

function renderMarkdown(markdown) {
  const lines = markdown.replace(/\r\n/g, "\n").split("\n");
  const html = [];
  let paragraph = [];
  let list = [];
  let inCode = false;
  let codeLines = [];
  let codeLang = "";

  function flushParagraph() {
    if (!paragraph.length) return;
    html.push(`<p>${renderInline(paragraph.join(" "))}</p>`);
    paragraph = [];
  }

  function flushList() {
    if (!list.length) return;
    html.push(`<ul>${list.map((item) => `<li>${renderInline(item)}</li>`).join("")}</ul>`);
    list = [];
  }

  lines.forEach((line) => {
    if (line.startsWith("```")) {
      if (inCode) {
        html.push(`<pre><code class="language-${escapeAttr(codeLang)}">${escapeHTML(codeLines.join("\n"))}</code></pre>`);
        inCode = false;
        codeLines = [];
        codeLang = "";
      } else {
        flushParagraph();
        flushList();
        inCode = true;
        codeLang = line.slice(3).trim();
      }
      return;
    }

    if (inCode) {
      codeLines.push(line);
      return;
    }

    if (!line.trim()) {
      flushParagraph();
      flushList();
      return;
    }

    const heading = line.match(/^(#{1,6})\s+(.*)$/);
    if (heading) {
      flushParagraph();
      flushList();
      const level = Math.min(heading[1].length, 3);
      html.push(`<h${level}>${renderInline(heading[2])}</h${level}>`);
      return;
    }

    const listItem = line.match(/^[-*]\s+(.*)$/);
    if (listItem) {
      flushParagraph();
      list.push(listItem[1]);
      return;
    }

    const quote = line.match(/^>\s?(.*)$/);
    if (quote) {
      flushParagraph();
      flushList();
      html.push(`<blockquote>${renderInline(quote[1])}</blockquote>`);
      return;
    }

    paragraph.push(line.trim());
  });

  flushParagraph();
  flushList();

  return html.join("\n");
}

function readPosts() {
  if (!fs.existsSync(SOURCE_DIR)) fs.mkdirSync(SOURCE_DIR, { recursive: true });

  return fs
    .readdirSync(SOURCE_DIR)
    .filter((file) => file.endsWith(".md"))
    .map((file) => {
      const raw = fs.readFileSync(path.join(SOURCE_DIR, file), "utf8");
      const { data, body } = parseFrontmatter(raw, file);
      const title = data.title || path.basename(file, ".md");
      const slug = data.slug || slugify(title);
      const articleBody = body.replace(new RegExp(`^\\s*#\\s+${escapeRegExp(title)}\\s*\\n+`, "i"), "");
      const description = data.description || articleBody.replace(/[#*_`>\-[\]()]/g, "").trim().slice(0, 155);

      return {
        title,
        slug,
        description,
        date: data.date || new Date().toISOString().slice(0, 10),
        updated: data.updated || data.date || new Date().toISOString().slice(0, 10),
        tags: Array.isArray(data.tags) ? data.tags : [],
        draft: Boolean(data.draft),
        body: articleBody,
        html: renderMarkdown(articleBody)
      };
    })
    .filter((post) => !post.draft)
    .sort((a, b) => new Date(b.date) - new Date(a.date));
}

function escapeRegExp(value) {
  return String(value).replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

function pageShell({ title, description, canonical, body, type = "website", extraHead = "" }) {
  return `<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${escapeHTML(title)}</title>
    <meta name="description" content="${escapeAttr(description)}">
    <link rel="canonical" href="${canonical}">
    <meta property="og:type" content="${type}">
    <meta property="og:title" content="${escapeAttr(title)}">
    <meta property="og:description" content="${escapeAttr(description)}">
    <meta property="og:url" content="${canonical}">
    <meta property="og:site_name" content="${escapeAttr(SITE_TITLE)}">
    <meta name="twitter:card" content="summary">
    <link rel="stylesheet" href="/blog.css">
    ${extraHead}
  </head>
  <body>
    <main class="blog-shell">
      <nav class="blog-nav" aria-label="Blog navigation">
        <a class="blog-brand" href="/blog/">
          <strong>${escapeHTML(SITE_TITLE)}</strong>
          <span>${escapeHTML(AUTHOR)}</span>
        </a>
        <div class="blog-actions">
          <a href="/">Portfolio OS</a>
          <a href="/rss.xml">RSS</a>
          <a href="/sitemap.xml">Sitemap</a>
        </div>
      </nav>
      ${body}
    </main>
  </body>
</html>
`;
}

function postJsonLd(post) {
  return JSON.stringify({
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    headline: post.title,
    description: post.description,
    datePublished: post.date,
    dateModified: post.updated,
    author: {
      "@type": "Person",
      name: AUTHOR,
      url: SITE_URL
    },
    mainEntityOfPage: `${SITE_URL}/blog/${post.slug}/`,
    url: `${SITE_URL}/blog/${post.slug}/`
  });
}

function renderPostPage(post) {
  const tags = post.tags.length
    ? `<div class="blog-tags">${post.tags.map((tag) => `<span>${escapeHTML(tag)}</span>`).join("")}</div>`
    : "";

  return pageShell({
    title: `${post.title} | ${SITE_TITLE}`,
    description: post.description,
    canonical: `${SITE_URL}/blog/${post.slug}/`,
    type: "article",
    extraHead: `<script type="application/ld+json">${postJsonLd(post)}</script>`,
    body: `
      <article class="post-article">
        <header class="blog-header">
          <div class="blog-meta">
            <time datetime="${escapeAttr(post.date)}">${escapeHTML(formatLongDate(post.date))}</time>
            <span>by ${escapeHTML(AUTHOR)}</span>
          </div>
          <h1>${escapeHTML(post.title)}</h1>
          <p class="blog-description">${escapeHTML(post.description)}</p>
          ${tags}
        </header>
        ${post.html}
      </article>
    `
  });
}

function formatLongDate(date) {
  return new Intl.DateTimeFormat("en", { month: "long", day: "numeric", year: "numeric" }).format(new Date(date));
}

function renderIndex(posts) {
  const cards = posts
    .map(
      (post) => `
        <article class="post-card">
          <div class="blog-meta">
            <time datetime="${escapeAttr(post.date)}">${escapeHTML(formatLongDate(post.date))}</time>
          </div>
          <h2><a href="/blog/${escapeAttr(post.slug)}/">${escapeHTML(post.title)}</a></h2>
          <p>${escapeHTML(post.description)}</p>
          ${post.tags.length ? `<div class="blog-tags">${post.tags.map((tag) => `<span>${escapeHTML(tag)}</span>`).join("")}</div>` : ""}
        </article>
      `
    )
    .join("");

  return pageShell({
    title: SITE_TITLE,
    description: SITE_DESCRIPTION,
    canonical: `${SITE_URL}/blog/`,
    body: `
      <header class="blog-header">
        <h1>${escapeHTML(SITE_TITLE)}</h1>
        <p class="blog-description">${escapeHTML(SITE_DESCRIPTION)}</p>
      </header>
      <section class="post-list" aria-label="Blog posts">
        ${cards || "<p>No posts yet.</p>"}
      </section>
    `
  });
}

function writeGeneratedFiles(posts) {
  fs.rmSync(BLOG_DIR, { recursive: true, force: true });
  fs.mkdirSync(BLOG_DIR, { recursive: true });

  posts.forEach((post) => {
    const postDir = path.join(BLOG_DIR, post.slug);
    fs.mkdirSync(postDir, { recursive: true });
    fs.writeFileSync(path.join(postDir, "index.html"), renderPostPage(post));
  });

  fs.writeFileSync(path.join(BLOG_DIR, "index.html"), renderIndex(posts));
  fs.writeFileSync(
    path.join(BLOG_DIR, "posts.json"),
    JSON.stringify(posts.map(publicPostData), null, 2)
  );
  fs.writeFileSync(
    path.join(BLOG_DIR, "posts.js"),
    `window.BLOG_POSTS = ${JSON.stringify(posts.map(publicPostData), null, 2)};\n`
  );

  fs.writeFileSync(path.join(ROOT, "sitemap.xml"), renderSitemap(posts));
  fs.writeFileSync(path.join(ROOT, "rss.xml"), renderRss(posts));
}

function publicPostData(post) {
  return {
    title: post.title,
    slug: post.slug,
    description: post.description,
    date: post.date,
    updated: post.updated,
    tags: post.tags,
    url: `${SITE_URL}/blog/${post.slug}/`
  };
}

function renderSitemap(posts) {
  const urls = [
    { loc: SITE_URL + "/", lastmod: new Date().toISOString().slice(0, 10) },
    { loc: SITE_URL + "/blog/", lastmod: posts[0]?.updated || new Date().toISOString().slice(0, 10) },
    ...posts.map((post) => ({ loc: `${SITE_URL}/blog/${post.slug}/`, lastmod: post.updated }))
  ];

  return `<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
${urls.map((url) => `  <url><loc>${escapeHTML(url.loc)}</loc><lastmod>${escapeHTML(url.lastmod)}</lastmod></url>`).join("\n")}
</urlset>
`;
}

function renderRss(posts) {
  return `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>${escapeHTML(SITE_TITLE)}</title>
    <link>${SITE_URL}/blog/</link>
    <description>${escapeHTML(SITE_DESCRIPTION)}</description>
${posts
  .map(
    (post) => `    <item>
      <title>${escapeHTML(post.title)}</title>
      <link>${SITE_URL}/blog/${escapeHTML(post.slug)}/</link>
      <guid>${SITE_URL}/blog/${escapeHTML(post.slug)}/</guid>
      <pubDate>${new Date(post.date).toUTCString()}</pubDate>
      <description>${escapeHTML(post.description)}</description>
    </item>`
  )
  .join("\n")}
  </channel>
</rss>
`;
}

const posts = readPosts();
writeGeneratedFiles(posts);
console.log(`Generated ${posts.length} blog post${posts.length === 1 ? "" : "s"} at /blog/.`);
