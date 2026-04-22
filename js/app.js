// ── BTID — ATHLETE MANAGEMENT SYSTEM ────────────────────────────
// App utilities, sidebar, auth, helpers

// ── ROLES ────────────────────────────────────────────────────────
// joshua = full admin, permanent access
// scout  = read only, time-limited access
function getRoleLevel(role) {
  if (role === 'joshua' || role === 'admin') return 2;
  if (role === 'scout') return 1;
  return 0;
}

// ── DATE & TIME HELPERS ───────────────────────────────────────────
function formatDate(d) {
  if (!d) return '—';
  const date = new Date(d);
  const now = new Date();
  const diff = Math.floor((now - date) / 1000);
  if (diff < 60)    return 'Just now';
  if (diff < 3600)  return Math.floor(diff / 60) + 'm ago';
  if (diff < 86400) return Math.floor(diff / 3600) + 'h ago';
  if (diff < 604800) return Math.floor(diff / 86400) + 'd ago';
  return date.toLocaleDateString('en-UG', { day:'numeric', month:'short', year:'numeric' });
}

function formatDateFull(d) {
  if (!d) return '—';
  return new Date(d).toLocaleDateString('en-UG', {
    weekday:'long', day:'numeric', month:'long', year:'numeric'
  });
}

function formatDateShort(d) {
  if (!d) return '—';
  return new Date(d).toLocaleDateString('en-UG', { day:'numeric', month:'short', year:'numeric' });
}

function calcAge(dob) {
  if (!dob) return null;
  const today = new Date();
  const birth  = new Date(dob);
  let age = today.getFullYear() - birth.getFullYear();
  const m = today.getMonth() - birth.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birth.getDate())) age--;
  return age;
}

// GPHP — Mid-Parental Height Formula
// unit: 'cm' or 'in'
// Boys: (Dad + Mom + 13cm) / 2  |  Girls: (Dad + Mom - 13cm) / 2
// In inches: Boys +5in, Girls -5in
function calcGPHP(dadHt, momHt, gender, unit) {
  if (!dadHt || !momHt) return null;
  const dad = parseFloat(dadHt);
  const mom = parseFloat(momHt);
  if (isNaN(dad) || isNaN(mom)) return null;
  const adj  = (unit === 'in') ? 5 : 13;
  const raw  = gender === 'F'
    ? (dad + mom - adj) / 2
    : (dad + mom + adj) / 2;
  return raw.toFixed(1);
}

// Convert heights between units
function cmToFtIn(cm) {
  const totalIn = cm / 2.54;
  const ft = Math.floor(totalIn / 12);
  const inches = Math.round(totalIn % 12);
  return ft + '\"' + inches + '\"';
}

function ftInToCm(ft, inches) {
  return ((parseFloat(ft) * 12 + parseFloat(inches)) * 2.54).toFixed(1);
}

function inToCm(inches) {
  return (parseFloat(inches) * 2.54).toFixed(1);
}

function cmToIn(cm) {
  return (parseFloat(cm) / 2.54).toFixed(1);
}

// ── NUMBER HELPERS ────────────────────────────────────────────────
function fmt(n) {
  const num = Number(n || 0);
  if (num >= 1000000) return (num/1000000).toFixed(1) + 'M';
  if (num >= 1000)    return (num/1000).toFixed(1) + 'K';
  return num.toLocaleString();
}

function avg(...vals) {
  const nums = vals.map(v => parseFloat(v)).filter(v => !isNaN(v));
  if (!nums.length) return null;
  return (nums.reduce((a,b) => a+b, 0) / nums.length).toFixed(2);
}

function initials(name) {
  if (!name) return '?';
  return name.trim().split(' ').filter(Boolean).map(w => w[0].toUpperCase()).slice(0,2).join('');
}

// ── TOAST ─────────────────────────────────────────────────────────
function showToast(msg, type = 'info', duration = 3200) {
  let t = document.getElementById('btid-toast');
  if (!t) {
    t = document.createElement('div');
    t.id = 'btid-toast';
    t.className = 'toast';
    document.body.appendChild(t);
  }
  t.textContent = msg;
  t.className = 'toast ' + type;
  requestAnimationFrame(() => requestAnimationFrame(() => t.classList.add('show')));
  clearTimeout(t._timer);
  t._timer = setTimeout(() => t.classList.remove('show'), duration);
}

// ── TIER HELPERS ──────────────────────────────────────────────────
const TIER_CONFIG = {
  '1':   { label: 'Tier 1',   cls: 't1',  color: '#009c41', textColor: '#fff' },
  '1.5': { label: 'Tier 1.5', cls: 't15', color: '#7dbf3a', textColor: '#fff' },
  '2':   { label: 'Tier 2',   cls: 't2',  color: '#f5a623', textColor: '#fff' },
  '3':   { label: 'Tier 3',   cls: 't3',  color: '#e53935', textColor: '#fff' },
};

function tierBadge(tier) {
  if (!tier) return '<span class="pill pill-muted">No tier</span>';
  const c = TIER_CONFIG[String(tier)];
  if (!c) return `<span class="pill pill-muted">${tier}</span>`;
  const label = tier === '1.5' ? 'T1.5' : 'T' + tier;
  return `<span class="tier-badge ${c.cls}" title="${c.label}">${label}</span>`;
}

function tierPill(tier) {
  if (!tier) return '<span class="pill pill-muted">No tier</span>';
  const c = TIER_CONFIG[String(tier)];
  if (!c) return `<span class="pill pill-muted">${tier}</span>`;
  return `<span class="pill tier-pill ${c.cls}">${c.label}</span>`;
}

// ── DISTRICTS (Uganda) ───────────────────────────────────────────
const UGANDA_DISTRICTS = [
  'Abim','Adjumani','Agago','Alebtong','Amolatar','Amudat','Amuria',
  'Amuru','Apac','Arua','Budaka','Bududa','Bugiri','Bugweri','Buhweju',
  'Buikwe','Bukedea','Bukomansimbi','Bukwo','Bulambuli','Buliisa',
  'Bundibugyo','Bunyangabu','Bushenyi','Busia','Butaleja','Butebo',
  'Buvuma','Buyende','Dokolo','Gomba','Gulu','Hoima','Ibanda','Iganga',
  'Isingiro','Jinja','Kaabong','Kabale','Kabarole','Kaberamaido',
  'Kagadi','Kakumiro','Kalaki','Kalangala','Kaliro','Kalungu','Kampala',
  'Kamuli','Kamwenge','Kanungu','Kapchorwa','Kapelebyong','Karenga',
  'Kasese','Kasanda','Katakwi','Kayunga','Kazo','Kibaale','Kiboga',
  'Kibuku','Kikuube','Kiruhura','Kiryandongo','Kisoro','Kitgum',
  'Koboko','Kole','Kotido','Kumi','Kwania','Kween','Kyankwanzi',
  'Kyegegwa','Kyenjojo','Kyotera','Lamwo','Lira','Luuka','Luwero',
  'Lwengo','Lyantonde','Madi-Okollo','Manafwa','Maracha','Masaka',
  'Masindi','Mayuge','Mbale','Mbarara','Mitooma','Mityana','Moroto',
  'Moyo','Mpigi','Mubende','Mukono','Nabilatuk','Nakapiripirit',
  'Nakaseke','Nakasongola','Namayingo','Namisindwa','Namutumba',
  'Napak','Nebbi','Ngora','Ntoroko','Ntungamo','Nwoya','Obongi',
  'Omoro','Otuke','Oyam','Pader','Pakwach','Pallisa','Rakai',
  'Rubanda','Rubirizi','Rukiga','Rukungiri','Sembabule','Serere',
  'Sheema','Sironko','Soroti','Tororo','Wakiso','Yumbe','Zombo'
].sort();

// ── SIDEBAR ───────────────────────────────────────────────────────
const NAV_ITEMS = [
  { section: 'Main' },
  { id: 'dashboard',  label: 'Dashboard',       href: 'dashboard.html',  minLevel: 1,
    icon: '<rect x="1" y="1" width="6" height="6" rx="1.5"/><rect x="9" y="1" width="6" height="6" rx="1.5"/><rect x="1" y="9" width="6" height="6" rx="1.5"/><rect x="9" y="9" width="6" height="6" rx="1.5"/>' },
  { id: 'players',    label: 'Players',          href: 'players.html',    minLevel: 1,
    icon: '<circle cx="6" cy="5" r="2.5"/><path d="M1 13c0-2.8 2.2-5 5-5s5 2.2 5 5"/><circle cx="13" cy="5" r="2.5"/><path d="M11 13c0-1.4.5-2.7 1.3-3.7"/>' },

  { section: 'Tryouts', minLevel: 2 },
  { id: 'tryouts',    label: 'Tryout Batches',   href: 'tryouts.html',    minLevel: 2,
    icon: '<circle cx="8" cy="8" r="6"/><path d="M8 5v3l2 2"/>' },
  { id: 'reports',    label: 'Reports',           href: 'reports.html',    minLevel: 2,
    icon: '<rect x="2" y="1" width="12" height="14" rx="1.5"/><path d="M5 5h6M5 8h6M5 11h4"/>' },

  { section: 'System', minLevel: 2 },
  { id: 'scouts',     label: 'Scout Access',      href: 'scouts.html',     minLevel: 2,
    icon: '<circle cx="8" cy="5" r="2.5"/><path d="M3 13c0-2.8 2.2-5 5-5s5 2.2 5 5"/><path d="M13 7l1.5 1.5L17 6"/>' },
  { id: 'activity',   label: 'Login Activity',    href: 'activity.html',   minLevel: 2,
    icon: '<path d="M1 8l3 3 4-6 3 3 4-4"/>' },
  { id: 'settings',   label: 'Settings',          href: 'settings.html',   minLevel: 2,
    icon: '<circle cx="8" cy="8" r="2.5"/><path d="M8 1v2M8 13v2M1 8h2M13 8h2M3.5 3.5l1.4 1.4M11.1 11.1l1.4 1.4M3.5 12.5l1.4-1.4M11.1 4.9l1.4-1.4"/>' },
];

function buildSidebar(activeId) {
  const user  = Auth.require();
  if (!user) return;
  const level = getRoleLevel(user.role);
  const el    = document.getElementById('sidebar');
  if (!el) return;

  let html = `
    <div class="sidebar-brand">
      <div class="brand-logo">
        <div class="brand-icon">
          <svg viewBox="0 0 16 16">
            <circle cx="8" cy="8" r="5"/>
            <path d="M3.5 5.5c2 1 5 1 9-1"/>
            <path d="M3 8.5c2-1 6-1 10 1"/>
          </svg>
        </div>
        <div>
          <div class="brand-name">BTID</div>
          <div class="brand-tag">Athlete Management</div>
        </div>
      </div>
    </div>
    <nav class="sidebar-nav">`;

  NAV_ITEMS.forEach(item => {
    if (item.section !== undefined) {
      if (item.minLevel && level < item.minLevel) return;
      html += `<div class="nav-section">${item.section}</div>`;
      return;
    }
    if (level < (item.minLevel || 1)) return;
    const badge = item.id === 'activity' && window._unreadLogins > 0
      ? `<span class="nav-badge">${window._unreadLogins}</span>` : '';
    html += `
      <a class="nav-item ${item.id === activeId ? 'active' : ''}" href="${item.href}">
        <svg viewBox="0 0 16 16">${item.icon}</svg>
        ${item.label}
        ${badge}
      </a>`;
  });

  html += `</nav>
    <div class="sidebar-footer">
      <button class="theme-toggle" style="margin-bottom:10px;width:100%;border-radius:var(--radius-xs);height:30px;gap:8px;font-family:var(--font2);font-size:.68rem;font-weight:700" onclick="Theme.toggle()">
        <span class="theme-toggle-icon" style="display:flex"></span>
        Toggle theme
      </button>
      <div class="sidebar-user">
        <div class="user-avatar">${initials(user.name)}</div>
        <div style="min-width:0">
          <div class="user-name">${user.name}</div>
          <div class="user-role">${user.role}</div>
        </div>
      </div>
      <button class="logout-btn" onclick="Auth.logout()">
        <svg viewBox="0 0 16 16"><path d="M10 8H3M6 5l-3 3 3 3"/><path d="M8 3h4a1 1 0 011 1v8a1 1 0 01-1 1H8"/></svg>
        Sign out
      </button>
    </div>`;

  el.innerHTML = html;

  // Mobile overlay
  let overlay = document.getElementById('sidebar-overlay');
  if (!overlay) {
    overlay = document.createElement('div');
    overlay.id = 'sidebar-overlay';
    overlay.className = 'sidebar-overlay';
    overlay.onclick = closeSidebar;
    document.body.appendChild(overlay);
  }
}

function toggleSidebar() {
  const s = document.getElementById('sidebar');
  const o = document.getElementById('sidebar-overlay');
  if (!s) return;
  s.classList.toggle('open');
  if (o) o.classList.toggle('show');
}

function closeSidebar() {
  const s = document.getElementById('sidebar');
  const o = document.getElementById('sidebar-overlay');
  if (s) s.classList.remove('open');
  if (o) o.classList.remove('show');
}

// ── THEME SYSTEM ──────────────────────────────────────────────────
const Theme = {
  get() {
    return localStorage.getItem('btid_theme') || 'light';
  },
  set(t) {
    localStorage.setItem('btid_theme', t);
    document.documentElement.setAttribute('data-theme', t);
    document.querySelectorAll('.theme-toggle-icon').forEach(el => {
      el.innerHTML = t === 'dark'
        ? '<svg viewBox="0 0 16 16"><circle cx="8" cy="8" r="4"/><path d="M8 1v2M8 13v2M1 8h2M13 8h2M3.5 3.5l1.5 1.5M11 11l1.5 1.5M3.5 12.5l1.5-1.5M11 5l1.5-1.5"/></svg>'
        : '<svg viewBox="0 0 16 16"><path d="M13 8A5 5 0 0 1 5 2.5a6 6 0 1 0 8 8 5 5 0 0 1 0-2.5z"/></svg>';
    });
  },
  toggle() {
    this.set(this.get() === 'dark' ? 'light' : 'dark');
  },
  init() {
    this.set(this.get());
  }
};

// ── BACKGROUND SYSTEM ─────────────────────────────────────────────
const BG_PRESETS = [
  { id: 'none',    label: 'None',           css: '' },
  { id: 'forest',  label: 'Forest',         css: 'linear-gradient(135deg, #0d2818 0%, #1a4a2e 50%, #0d2818 100%)' },
  { id: 'night',   label: 'Night field',    css: 'linear-gradient(180deg, #0a0f0d 0%, #0d2818 60%, #1a3a20 100%)' },
  { id: 'dawn',    label: 'Dawn',           css: 'linear-gradient(135deg, #1a2e22 0%, #2d5a3d 50%, #4a8a5a 100%)' },
  { id: 'savanna', label: 'Savanna',        css: 'linear-gradient(135deg, #2a1f0a 0%, #4a3510 50%, #6a5020 100%)' },
  { id: 'sky',     label: 'Clear sky',      css: 'linear-gradient(180deg, #0a1628 0%, #1a3a6a 50%, #2a5a9a 100%)' },
];

const AppBG = {
  get() { return localStorage.getItem('btid_bg') || 'none'; },
  set(id, customUrl) {
    localStorage.setItem('btid_bg', id);
    if (customUrl) localStorage.setItem('btid_bg_custom', customUrl);
    this.apply();
  },
  apply() {
    const id = this.get();
    const customUrl = localStorage.getItem('btid_bg_custom');
    let el = document.getElementById('app-bg-layer');
    if (!el) {
      el = document.createElement('div');
      el.id = 'app-bg-layer';
      el.className = 'app-bg';
      document.body.insertBefore(el, document.body.firstChild);
    }
    if (id === 'custom' && customUrl) {
      el.style.backgroundImage = 'url(' + customUrl + ')';
      el.classList.add('with-image');
    } else {
      const preset = BG_PRESETS.find(p => p.id === id);
      if (preset && preset.css) {
        el.style.backgroundImage = preset.css;
        el.style.background = preset.css;
        el.classList.remove('with-image');
      } else {
        el.style.backgroundImage = '';
        el.style.background = '';
        el.classList.remove('with-image');
      }
    }
  },
  init() { this.apply(); }
};

// Init on load
document.addEventListener('DOMContentLoaded', () => {
  Theme.init();
  AppBG.init();
});
// Also init immediately in case DOM is ready
Theme.init();
AppBG.init();

// ── SEASON / YEAR FILTER SYSTEM ──────────────────────────────────
const Season = {
  get() {
    return parseInt(localStorage.getItem('btid_season')) || new Date().getFullYear();
  },
  set(year) {
    localStorage.setItem('btid_season', year);
    // Update all season selectors on page
    document.querySelectorAll('.season-select').forEach(el => {
      el.value = year;
    });
    // Dispatch event so pages can react
    window.dispatchEvent(new CustomEvent('seasonChanged', { detail: { season: year } }));
  },
  label() {
    return 'Season ' + this.get();
  }
};

async function buildSeasonSelector(containerId) {
  const el = document.getElementById(containerId);
  if (!el) return;
  let seasons = [new Date().getFullYear()];
  try {
    const r = await apiFetch('/api/seasons');
    seasons = r.seasons || seasons;
  } catch(e) {}

  const current = Season.get();
  el.innerHTML = `
    <select class="season-select filter-select"
      style="height:32px;font-size:0.75rem;font-weight:800;color:var(--green);border-color:var(--green-mid);background:var(--green-pale);min-width:110px"
      onchange="Season.set(parseInt(this.value));window.location.reload()">
      ${seasons.map(y => `<option value="${y}" ${y == current ? 'selected' : ''}>${y} Season</option>`).join('')}
      ${!seasons.includes(new Date().getFullYear()) ? `<option value="${new Date().getFullYear()}" ${new Date().getFullYear() == current ? 'selected' : ''}>${new Date().getFullYear()} Season</option>` : ''}
    </select>`;
}
