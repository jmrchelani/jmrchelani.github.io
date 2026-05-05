const profile = {
  name: "Mahtab Chelani aka Milton (jmrchelani)",
  shortName: "Milton",
  fullName: "Mahtab Chelani aka Milton",
  initials: "MC",
  role: "Multidisciplinary Developer",
  location: "Pakistan",
  bio: "I build software across product UI, full-stack development, automation, and content systems with the same attention to usefulness and feel.",
  websiteUrl: "https://jmrchelani.github.io/",
  githubUsername: "jmrchelani",
  githubUrl: "https://github.com/jmrchelani",
  linkedinUrl: "https://www.linkedin.com/in/jmrchelani/",
  featuredRepoNames: [
    "jmrchelani.github.io",
    "flutter_portfolio",
    "scrap-this-web",
    "missing-braces-finder",
    "book-shop-php"
  ]
};

const portfolioData = {
  work: [
    [
      "Product interfaces and portfolio systems",
      "Web experiences that feel deliberate, explain themselves quickly, and still have personality."
    ],
    [
      "Full-stack product work",
      "Frontend implementation, backend wiring, data flow, and the small operational details that keep shipping smooth."
    ],
    [
      "Developer utilities and automation",
      "Internal tools, scrapers, workflow helpers, and practical systems that remove repeat work."
    ]
  ],
  process: [
    [
      "Clarify the problem first",
      "I reduce ambiguity early, map the user flow, and make sure the right thing is being built before polishing it."
    ],
    [
      "Move fast without getting messy",
      "I prefer compact systems, direct code, and a build path that stays easy to maintain after launch."
    ],
    [
      "Polish where it matters",
      "Performance, clarity, interaction feedback, and visual rhythm are not extras; they shape whether the work feels finished."
    ]
  ],
  experience: [
    [
      "Freelance and client delivery",
      "Fiverr, Upwork, and local client work across websites, product pages, UI cleanup, and tailored business builds.",
      ["Fiverr", "Upwork", "Local clients"]
    ],
    [
      "Startups, agencies, and product teams",
      "Contribution across Softotic, FixDar, KaamSay, and related team environments where delivery, iteration speed, and product thinking all matter.",
      ["Softotic", "FixDar", "KaamSay"]
    ],
    [
      "Open source and in-house products",
      "Public GitHub projects alongside product work such as ChaiMeter and DoomLift, with a mix of experimentation, tooling, and real-world shipping.",
      ["GitHub", "ChaiMeter", "DoomLift"]
    ]
  ],
  linkedInHighlights: [
    [
      "Professional headline",
      "Multidisciplinary Developer building products, interfaces, automations, and content systems under the name Milton."
    ],
    [
      "Current focus",
      "Freelance delivery, product collaboration, front-end polish, backend structure, and practical software that earns repeat use."
    ],
    [
      "Working style",
      "Comfortable moving from concept to shipped build, from user-facing design decisions to technical cleanup and iteration."
    ],
    [
      "Open to",
      "Freelance work, team roles, and product collaborations where range across disciplines is genuinely useful."
    ]
  ],
  hobbies: [
    [
      "Cross-discipline tinkering",
      "Jumping between interface ideas, backend experiments, small utilities, and prototype workflows just to see what becomes useful."
    ],
    [
      "Reverse-engineering good software",
      "Studying systems, interactions, and patterns that make products feel clear, fast, and surprisingly human."
    ],
    [
      "Turning experiments into tools",
      "Taking half-formed ideas and pushing them far enough that they start solving a real problem."
    ]
  ],
  interests: [
    "Product systems",
    "AI-assisted workflows",
    "Automation design",
    "Developer tooling",
    "Data-driven apps",
    "Performance tuning",
    "Retro software aesthetics",
    "Open-source products",
    "Interface behavior"
  ],
  fallbackProjects: [
    {
      name: "jmrchelani.github.io",
      html_url: "https://github.com/jmrchelani/jmrchelani.github.io",
      description: "Personal site experiments and public-facing portfolio work published through GitHub Pages.",
      language: "HTML",
      stargazers_count: 0,
      forks_count: 0,
      updated_at: "2026-01-01T00:00:00Z"
    },
    {
      name: "flutter_portfolio",
      html_url: "https://github.com/jmrchelani/flutter_portfolio",
      description: "A portfolio build in Flutter focused on presentation, responsiveness, and clean structure.",
      language: "Dart",
      stargazers_count: 0,
      forks_count: 0,
      updated_at: "2026-01-01T00:00:00Z"
    },
    {
      name: "scrap-this-web",
      html_url: "https://github.com/jmrchelani/scrap-this-web",
      description: "A scraping-oriented utility aimed at extracting useful structure from the web quickly.",
      language: "JavaScript",
      stargazers_count: 0,
      forks_count: 0,
      updated_at: "2026-01-01T00:00:00Z"
    },
    {
      name: "missing-braces-finder",
      html_url: "https://github.com/jmrchelani/missing-braces-finder",
      description: "A compact developer helper for spotting structural issues in code more quickly.",
      language: "JavaScript",
      stargazers_count: 0,
      forks_count: 0,
      updated_at: "2026-01-01T00:00:00Z"
    },
    {
      name: "book-shop-php",
      html_url: "https://github.com/jmrchelani/book-shop-php",
      description: "A PHP-based book shop project with product, storefront, and application logic concerns.",
      language: "PHP",
      stargazers_count: 0,
      forks_count: 0,
      updated_at: "2026-01-01T00:00:00Z"
    }
  ]
};

const apps = [
  { id: "home", label: "About Milton", title: "About Milton", icon: "home", x: 285, y: 52, w: 640, defaultOpen: true },
  { id: "work", label: "Craft", title: "Craft - What I make and how I work", icon: "craft", x: 210, y: 110, w: 710, pinned: true },
  { id: "projects", label: "Projects", title: "Featured Projects", icon: "projects", x: 350, y: 135, w: 760, pinned: true },
  { id: "experience", label: "Experience", title: "Experience", icon: "experience", x: 405, y: 86, w: 640, pinned: true },
  { id: "github", label: "GitHub", title: "GitHub - jmrchelani", icon: "github", x: 250, y: 82, w: 760, pinned: true },
  { id: "linkedin", label: "LinkedIn", title: "LinkedIn - Professional Snapshot", icon: "linkedin", x: 315, y: 156, w: 700, pinned: true },
  { id: "hobbies", label: "Hobbies", title: "Hobbies", icon: "hobbies", x: 480, y: 120, w: 580 },
  { id: "interests", label: "Interests", title: "Interests", icon: "interests", x: 170, y: 184, w: 600 },
  { id: "contact", label: "Contact", title: "Contact", icon: "contact", x: 390, y: 190, w: 560 }
];

const windowNotes = {
  home: "Profile overview",
  work: "Scope and working style",
  projects: "Live repo activity when GitHub is available",
  experience: "Where the work has happened",
  github: "Open the app first, then jump to the URL",
  linkedin: "Condensed professional view",
  hobbies: "How curiosity shows up",
  interests: "What I keep circling back to",
  contact: "Best starting points"
};

const appMap = new Map(apps.map((app) => [app.id, app]));
const taskButtons = new Map();
let windows = new Map();
let zIndex = 20;
let activeWindow = null;
let dragState = null;

const selectors = {
  shortcutGrid: document.querySelector("#shortcutGrid"),
  quickLaunch: document.querySelector("#quickLaunch"),
  startMenuList: document.querySelector("#startMenuList"),
  windowLayer: document.querySelector("#windowLayer"),
  taskbarApps: document.querySelector("#taskbarApps"),
  startButton: document.querySelector("#startButton"),
  startMenu: document.querySelector("#startMenu"),
  bootScreen: document.querySelector("#bootScreen")
};

function escapeHTML(value) {
  return String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");
}

function renderMiniList(items) {
  return items
    .map(
      ([title, text]) => `
        <article>
          <h3>${escapeHTML(title)}</h3>
          <p>${escapeHTML(text)}</p>
        </article>
      `
    )
    .join("");
}

function renderTagList(tags) {
  return tags.map((tag) => `<span class="tag">${escapeHTML(tag)}</span>`).join("");
}

function formatRelativeDate(isoDate) {
  if (!isoDate) return "Recently updated";
  const diffMs = new Date(isoDate).getTime() - Date.now();
  const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
  const units = [
    ["year", 1000 * 60 * 60 * 24 * 365],
    ["month", 1000 * 60 * 60 * 24 * 30],
    ["week", 1000 * 60 * 60 * 24 * 7],
    ["day", 1000 * 60 * 60 * 24],
    ["hour", 1000 * 60 * 60]
  ];

  for (const [unit, size] of units) {
    if (Math.abs(diffMs) >= size || unit === "hour") {
      return rtf.format(Math.round(diffMs / size), unit);
    }
  }

  return "Recently updated";
}

function formatDate(isoDate) {
  if (!isoDate) return "";
  return new Intl.DateTimeFormat("en", { month: "short", day: "numeric", year: "numeric" }).format(new Date(isoDate));
}

function renderRepoCards(repos) {
  return repos
    .map(
      (repo) => `
        <article class="repo-row repo-card">
          <div>
            <h3>${escapeHTML(repo.name)}</h3>
            <p>${escapeHTML(repo.description || "Public repository and active build in progress.")}</p>
            <div class="repo-meta">
              <span class="tag">${escapeHTML(repo.language || "Code")}</span>
              <span class="tag">${Number(repo.stargazers_count || 0)} stars</span>
              <span class="tag">${Number(repo.forks_count || 0)} forks</span>
              <span class="tag">${escapeHTML(formatDate(repo.updated_at))}</span>
            </div>
          </div>
          <div class="repo-actions">
            <span class="status-pill">Updated ${escapeHTML(formatRelativeDate(repo.updated_at))}</span>
            <a class="xp-link-button" href="${escapeHTML(repo.html_url)}" target="_blank" rel="noreferrer">Open URL</a>
          </div>
        </article>
      `
    )
    .join("");
}

function renderExperienceCards() {
  return portfolioData.experience
    .map(
      ([title, text, tags]) => `
        <article class="timeline-item">
          <h3>${escapeHTML(title)}</h3>
          <p>${escapeHTML(text)}</p>
          <div class="timeline-meta">${renderTagList(tags)}</div>
        </article>
      `
    )
    .join("");
}

function appBody(id) {
  const bodies = {
    home: `
      <div class="home-window">
        <div class="home-lede">
          <p class="eyebrow">C:\\PORTFOLIO\\PROFILE</p>
          <h1>${escapeHTML(profile.name)}</h1>
          <p>${escapeHTML(profile.bio)}</p>
          <div class="action-row">
            <button type="button" data-open="projects">Open projects</button>
            <button type="button" data-open="experience">View experience</button>
            <button type="button" data-open="contact">Contact</button>
          </div>
        </div>
        <pre class="terminal-note">C:\\MILTON&gt; load profile
alias: ${escapeHTML(profile.shortName)}
discipline: multidisciplinary development
focus: products ui automation systems</pre>
      </div>
    `,
    work: `
      <div class="work-window">
        <p class="eyebrow">C:\\PORTFOLIO\\CRAFT</p>
        <h2>What I build and how I work</h2>
        <p class="section-copy">
          I move across interface design, engineering, automation, and product execution without treating those as separate worlds.
        </p>
        <div class="two-column">
          <fieldset>
            <legend>What I make</legend>
            <div class="bullet-list">${renderMiniList(portfolioData.work)}</div>
          </fieldset>
          <fieldset>
            <legend>How I work</legend>
            <div class="bullet-list">${renderMiniList(portfolioData.process)}</div>
          </fieldset>
        </div>
      </div>
    `,
    projects: `
      <div class="projects-window">
        <div class="section-heading">
          <div>
            <h2>Featured from GitHub</h2>
            <p class="section-copy" id="projectFeedMeta">
              Pulling featured repositories and recent activity from GitHub.
            </p>
          </div>
          <button type="button" data-open="github">Open GitHub app</button>
        </div>
        <div id="projectList" class="project-list">${renderRepoCards(portfolioData.fallbackProjects)}</div>
      </div>
    `,
    experience: `
      <div class="experience-window">
        <p class="eyebrow">C:\\PORTFOLIO\\EXPERIENCE</p>
        <h2>Where the work has happened</h2>
        <p class="section-copy">
          Delivery has happened through freelance platforms, direct clients, startup and agency contexts, and public open-source work.
        </p>
        <div class="timeline">${renderExperienceCards()}</div>
      </div>
    `,
    github: `
      <div class="github-shell">
        <div id="githubProfile" class="github-profile"><p>Loading GitHub profile...</p></div>
        <div>
          <div class="section-heading">
            <div>
              <h2>Featured repositories</h2>
              <p class="section-copy">Pinned repos when available, otherwise the most active public work.</p>
            </div>
            <a href="${profile.githubUrl}" target="_blank" rel="noreferrer">Open profile URL</a>
          </div>
          <div id="githubRepos" class="repo-list">${renderRepoCards(portfolioData.fallbackProjects.slice(0, 3))}</div>
        </div>
      </div>
    `,
    linkedin: `
      <div class="linkedin-window">
        <div class="linkedin-head">
          <div class="avatar" aria-hidden="true">${escapeHTML(profile.initials)}</div>
          <div>
            <h2>${escapeHTML(profile.name)}</h2>
            <p>${escapeHTML(profile.role)}</p>
            <p>${escapeHTML(profile.location)}</p>
          </div>
        </div>
        <div class="section-heading">
          <div>
            <h2>Professional snapshot</h2>
            <p class="section-copy">The short version of how the profile should read.</p>
          </div>
          <a href="${profile.linkedinUrl}" target="_blank" rel="noreferrer">Open LinkedIn URL</a>
        </div>
        <div class="linkedin-tabs">
          ${renderMiniList(portfolioData.linkedInHighlights)}
          <article>
            <h3>Experience lanes</h3>
            <p>Fiverr, Upwork, local clients, Softotic, FixDar, KaamSay, open source work, and product efforts such as ChaiMeter and DoomLift.</p>
          </article>
        </div>
        <div class="action-row">
          <button type="button" data-open="experience">View experience</button>
          <button type="button" data-open="projects">See projects</button>
        </div>
      </div>
    `,
    hobbies: `
      <div class="hobbies-window">
        <p class="eyebrow">C:\\PORTFOLIO\\HOBBIES</p>
        <div class="tile-list">${renderMiniList(portfolioData.hobbies)}</div>
      </div>
    `,
    interests: `
      <div class="interests-window">
        <p class="eyebrow">C:\\PORTFOLIO\\INTERESTS</p>
        <p class="section-copy">The themes that keep showing up in my work and experiments.</p>
        <div class="interest-cloud">${renderTagList(portfolioData.interests)}</div>
      </div>
    `,
    contact: `
      <div class="contact-window">
        <p class="eyebrow">C:\\PORTFOLIO\\CONTACT</p>
        <h2>Start inside the apps.</h2>
        <p>
          For collaboration, freelance work, product conversations, or hiring, open the GitHub or LinkedIn app here first and then use the direct URL from inside each window.
        </p>
        <div class="contact-actions">
          <button type="button" data-open="github">Open GitHub app</button>
          <button type="button" data-open="linkedin">Open LinkedIn app</button>
          <button type="button" data-open="experience">View experience</button>
          <a class="xp-link-button" href="${profile.websiteUrl}" target="_blank" rel="noreferrer">Open website URL</a>
        </div>
      </div>
    `
  };

  return bodies[id] || "";
}

function renderChrome() {
  selectors.shortcutGrid.innerHTML = apps
    .filter((app) => app.id !== "contact")
    .map(
      (app) => `
        <button class="shortcut icon-${escapeHTML(app.icon)}" type="button" data-open="${escapeHTML(app.id)}">
          <span class="shortcut-icon" aria-hidden="true"></span>
          <span class="shortcut-label">${escapeHTML(app.label)}</span>
        </button>
      `
    )
    .join("");

  selectors.quickLaunch.innerHTML = apps
    .filter((app) => app.pinned)
    .map((app) => `<button type="button" data-open="${escapeHTML(app.id)}" title="${escapeHTML(app.label)}">${escapeHTML(app.label)}</button>`)
    .join("");

  selectors.startMenuList.innerHTML = ["projects", "experience", "github", "linkedin", "contact"]
    .map((id) => `<button type="button" data-open="${id}">${escapeHTML(appMap.get(id).label)}</button>`)
    .join("");
}

function renderWindows() {
  selectors.windowLayer.innerHTML = apps
    .map(
      (app) => `
        <section
          class="window portfolio-window"
          id="window-${escapeHTML(app.id)}"
          data-window="${escapeHTML(app.id)}"
          aria-hidden="true"
          style="--x: ${app.x}px; --y: ${app.y}px; --w: ${app.w}px;"
        >
          <div class="title-bar">
            <div class="title-bar-text">${escapeHTML(app.title)}</div>
            <div class="title-bar-controls">
              <button aria-label="Minimize" data-action="minimize"></button>
              <button aria-label="Maximize" data-action="maximize"></button>
              <button aria-label="Close" data-action="close"></button>
            </div>
          </div>
          <div class="window-body">${appBody(app.id)}</div>
          <div class="status-bar">
            <p class="status-bar-field">Ready</p>
            <p class="status-bar-field">${escapeHTML(windowNotes[app.id] || app.label)}</p>
          </div>
        </section>
      `
    )
    .join("");

  windows = new Map(
    Array.from(document.querySelectorAll(".portfolio-window")).map((windowEl) => [
      windowEl.dataset.window,
      windowEl
    ])
  );
}

function renderProfile() {
  document.querySelectorAll("[data-profile='name']").forEach((el) => {
    el.textContent = profile.name;
  });

  document.querySelectorAll("[data-profile='role']").forEach((el) => {
    el.textContent = profile.role;
  });

  document.querySelectorAll(".avatar").forEach((el) => {
    el.textContent = el.classList.contains("mini") ? profile.initials.slice(0, 1) : profile.initials;
  });
}

function updateClock() {
  const now = new Date();
  const time = now.toLocaleTimeString([], { hour: "2-digit", minute: "2-digit" });
  document.querySelector("#desktopClock").textContent = time;
  document.querySelector("#trayClock").textContent = time;
  document.querySelector("#desktopDate").textContent = now.toLocaleDateString([], {
    weekday: "long",
    month: "short",
    day: "numeric"
  });
}

function addTaskButton(name) {
  if (taskButtons.has(name)) return;
  const app = appMap.get(name);
  const button = document.createElement("button");
  button.type = "button";
  button.textContent = app.label;
  button.dataset.taskWindow = name;
  button.addEventListener("click", () => {
    const windowEl = windows.get(name);
    if (!windowEl) return;
    if (activeWindow === windowEl && !windowEl.classList.contains("is-minimized")) {
      minimizeWindow(windowEl);
      return;
    }
    openWindow(name);
  });
  selectors.taskbarApps.append(button);
  taskButtons.set(name, button);
}

function removeTaskButton(name) {
  const button = taskButtons.get(name);
  if (button) {
    button.remove();
    taskButtons.delete(name);
  }
}

function setActiveTaskButton(name) {
  taskButtons.forEach((button, buttonName) => {
    button.classList.toggle("is-active", buttonName === name);
  });
}

function focusWindow(windowEl) {
  if (!windowEl) return;
  document.querySelectorAll(".portfolio-window").forEach((item) => {
    item.classList.remove("is-active");
  });
  windowEl.classList.add("is-active");
  windowEl.style.zIndex = String(++zIndex);
  activeWindow = windowEl;
  setActiveTaskButton(windowEl.dataset.window);
}

function openWindow(name) {
  const windowEl = windows.get(name);
  if (!windowEl) return;
  windowEl.setAttribute("aria-hidden", "false");
  windowEl.classList.remove("is-minimized");
  windowEl.classList.add("is-opening");
  window.setTimeout(() => windowEl.classList.remove("is-opening"), 220);
  addTaskButton(name);
  focusWindow(windowEl);
  closeStartMenu();
}

function minimizeWindow(windowEl) {
  windowEl.classList.add("is-minimized");
  windowEl.classList.remove("is-active");
  activeWindow = null;
  setActiveTaskButton("");
}

function closeWindow(windowEl) {
  const name = windowEl.dataset.window;
  windowEl.setAttribute("aria-hidden", "true");
  windowEl.classList.remove("is-active", "is-minimized", "is-maximized");
  removeTaskButton(name);
  activeWindow = null;
  setActiveTaskButton("");
}

function toggleMaximize(windowEl) {
  windowEl.classList.toggle("is-maximized");
  focusWindow(windowEl);
}

function closeStartMenu() {
  selectors.startMenu.hidden = true;
  selectors.startButton.setAttribute("aria-expanded", "false");
}

function toggleStartMenu() {
  const willOpen = selectors.startMenu.hidden;
  selectors.startMenu.hidden = !willOpen;
  selectors.startButton.setAttribute("aria-expanded", String(willOpen));
}

function bindDesktopEvents() {
  document.addEventListener("click", (event) => {
    const openButton = event.target.closest("[data-open]");
    if (openButton) {
      openWindow(openButton.dataset.open);
      return;
    }

    const actionButton = event.target.closest("[data-action]");
    if (actionButton) {
      const windowEl = actionButton.closest(".portfolio-window");
      const action = actionButton.dataset.action;
      if (action === "minimize") minimizeWindow(windowEl);
      if (action === "maximize") toggleMaximize(windowEl);
      if (action === "close") closeWindow(windowEl);
      return;
    }

    const clickedWindow = event.target.closest(".portfolio-window");
    if (clickedWindow) focusWindow(clickedWindow);

    if (!event.target.closest("#startMenu") && !event.target.closest("#startButton")) {
      closeStartMenu();
    }
  });

  selectors.startButton.addEventListener("click", (event) => {
    event.stopPropagation();
    toggleStartMenu();
  });

  document.querySelectorAll(".portfolio-window .title-bar").forEach((titleBar) => {
    titleBar.addEventListener("pointerdown", (event) => {
      if (event.target.closest(".title-bar-controls")) return;
      const windowEl = titleBar.closest(".portfolio-window");
      if (windowEl.classList.contains("is-maximized")) return;
      const rect = windowEl.getBoundingClientRect();
      dragState = {
        pointerId: event.pointerId,
        windowEl,
        offsetX: event.clientX - rect.left,
        offsetY: event.clientY - rect.top
      };
      focusWindow(windowEl);
      titleBar.setPointerCapture(event.pointerId);
    });

    titleBar.addEventListener("pointermove", (event) => {
      if (!dragState || dragState.pointerId !== event.pointerId) return;
      const { windowEl, offsetX, offsetY } = dragState;
      const rect = windowEl.getBoundingClientRect();
      const taskbarHeight = document.querySelector(".taskbar").offsetHeight;
      const maxX = Math.max(8, window.innerWidth - rect.width - 8);
      const maxY = Math.max(8, window.innerHeight - rect.height - taskbarHeight - 8);
      const nextX = Math.min(Math.max(8, event.clientX - offsetX), maxX);
      const nextY = Math.min(Math.max(8, event.clientY - offsetY), maxY);
      windowEl.style.left = `${nextX}px`;
      windowEl.style.top = `${nextY}px`;
    });

    titleBar.addEventListener("pointerup", (event) => {
      if (!dragState || dragState.pointerId !== event.pointerId) return;
      titleBar.releasePointerCapture(event.pointerId);
      dragState = null;
    });
  });
}

function pickFeaturedRepos(repos) {
  const publicRepos = repos.filter((repo) => !repo.fork);
  const repoByName = new Map(publicRepos.map((repo) => [repo.name.toLowerCase(), repo]));
  const featured = profile.featuredRepoNames
    .map((name) => repoByName.get(name.toLowerCase()))
    .filter(Boolean);

  if (featured.length) {
    const used = new Set(featured.map((repo) => repo.name.toLowerCase()));
    const remaining = publicRepos.filter((repo) => !used.has(repo.name.toLowerCase()));
    return [...featured, ...remaining].slice(0, 5);
  }

  return publicRepos.slice(0, 5);
}

function hydrateGitHub(user, repos) {
  const featuredRepos = pickFeaturedRepos(repos);
  const profileTarget = document.querySelector("#githubProfile");
  const reposTarget = document.querySelector("#githubRepos");
  const projectTarget = document.querySelector("#projectList");
  const projectMeta = document.querySelector("#projectFeedMeta");

  profileTarget.innerHTML = `
    <div class="github-profile-card">
      <img src="${escapeHTML(user.avatar_url)}" alt="${escapeHTML(user.login)} GitHub avatar">
      <div>
        <h2>${escapeHTML(user.name || user.login)}</h2>
        <p>${escapeHTML(user.bio || "Public GitHub profile")}</p>
      </div>
    </div>
    <div class="github-stats">
      <span><strong>${Number(user.public_repos || 0)}</strong><br>Repos</span>
      <span><strong>${Number(user.followers || 0)}</strong><br>Followers</span>
      <span><strong>${Number(user.following || 0)}</strong><br>Following</span>
    </div>
  `;

  reposTarget.innerHTML = renderRepoCards(featuredRepos);
  projectTarget.innerHTML = renderRepoCards(featuredRepos);
  projectMeta.textContent = "Live GitHub repositories with current update activity.";
}

function hydrateGitHubFallback() {
  const reposTarget = document.querySelector("#githubRepos");
  const projectTarget = document.querySelector("#projectList");
  const profileTarget = document.querySelector("#githubProfile");
  const projectMeta = document.querySelector("#projectFeedMeta");
  const fallbackMarkup = renderRepoCards(portfolioData.fallbackProjects);

  profileTarget.innerHTML = `
    <div class="github-profile-card">
      <div class="avatar" aria-hidden="true">${escapeHTML(profile.initials)}</div>
      <div>
        <h2>${escapeHTML(profile.fullName)}</h2>
        <p>GitHub preview fallback loaded. Open the profile URL inside this app for the live page.</p>
      </div>
    </div>
  `;

  reposTarget.innerHTML = fallbackMarkup;
  projectTarget.innerHTML = fallbackMarkup;
  projectMeta.textContent = "GitHub API unavailable, showing featured fallback projects.";
}

async function loadGitHub() {
  const userUrl = `https://api.github.com/users/${profile.githubUsername}`;
  const repoUrl = `https://api.github.com/users/${profile.githubUsername}/repos?sort=updated&per_page=100`;

  try {
    const [userResponse, repoResponse] = await Promise.all([fetch(userUrl), fetch(repoUrl)]);
    if (!userResponse.ok || !repoResponse.ok) throw new Error("GitHub unavailable");
    const user = await userResponse.json();
    const repos = await repoResponse.json();
    hydrateGitHub(user, repos);
  } catch (error) {
    hydrateGitHubFallback();
  }
}

function init() {
  renderChrome();
  renderWindows();
  renderProfile();
  bindDesktopEvents();
  updateClock();
  window.setInterval(updateClock, 1000 * 20);
  apps.filter((app) => app.defaultOpen).forEach((app) => openWindow(app.id));
  loadGitHub();
  window.setTimeout(() => selectors.bootScreen.classList.add("is-hidden"), 900);
}

init();
