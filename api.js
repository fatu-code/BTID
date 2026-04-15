// ── BTID API CLIENT ──────────────────────────────────────────────
const API_BASE = 'https://btid-backend-production.up.railway.app';

// ── AUTH ─────────────────────────────────────────────────────────
const Auth = {
  get() {
    try { return JSON.parse(localStorage.getItem('btid_user')); } catch { return null; }
  },
  set(user, token) {
    localStorage.setItem('btid_user', JSON.stringify(user));
    localStorage.setItem('btid_token', token);
  },
  token() { return localStorage.getItem('btid_token'); },
  logout() {
    localStorage.removeItem('btid_user');
    localStorage.removeItem('btid_token');
    window.location.href = 'index.html';
  },
  require() {
    const u = this.get();
    if (!u) { window.location.href = 'index.html'; return null; }
    return u;
  }
};

// ── FETCH WRAPPER ─────────────────────────────────────────────────
async function apiFetch(path, opts = {}) {
  const headers = { 'Content-Type': 'application/json' };
  const token = Auth.token();
  if (token) headers['Authorization'] = 'Bearer ' + token;
  const res = await fetch(API_BASE + path, {
    method: opts.method || 'GET',
    headers,
    body: opts.body ? JSON.stringify(opts.body) : undefined,
  });
  const data = await res.json();
  if (res.status === 401) { Auth.logout(); return; }
  if (!res.ok) throw new Error(data.error || 'Request failed');
  return data;
}

// ── PLAYER API ────────────────────────────────────────────────────
const PlayerAPI = {
  getAll(params = {}) {
    const q = new URLSearchParams(params).toString();
    return apiFetch('/api/players' + (q ? '?' + q : ''));
  },
  get(id)    { return apiFetch('/api/players/' + id); },
  create(d)  { return apiFetch('/api/players',      { method: 'POST', body: d }); },
  update(id, d) { return apiFetch('/api/players/' + id, { method: 'PUT',  body: d }); },
  delete(id) { return apiFetch('/api/players/' + id, { method: 'DELETE' }); },
  uploadPhoto(id, file) {
    const fd = new FormData();
    fd.append('photo', file);
    return fetch(API_BASE + '/api/players/' + id + '/photo', {
      method: 'POST',
      headers: { 'Authorization': 'Bearer ' + Auth.token() },
      body: fd,
    }).then(r => r.json());
  },
};

// ── TRYOUT API ────────────────────────────────────────────────────
const TryoutAPI = {
  getAll()   { return apiFetch('/api/tryouts'); },
  get(id)    { return apiFetch('/api/tryouts/' + id); },
  create(d)  { return apiFetch('/api/tryouts', { method: 'POST', body: d }); },
  update(id, d) { return apiFetch('/api/tryouts/' + id, { method: 'PUT', body: d }); },
  getPlayers(id) { return apiFetch('/api/tryouts/' + id + '/players'); },
  addPlayer(id, playerId) {
    return apiFetch('/api/tryouts/' + id + '/players', { method: 'POST', body: { player_id: playerId } });
  },
  removePlayer(id, playerId) {
    return apiFetch('/api/tryouts/' + id + '/players/' + playerId, { method: 'DELETE' });
  },
};

// ── TRYOUT RESULTS API ────────────────────────────────────────────
const ResultAPI = {
  get(tryoutId, playerId) {
    return apiFetch('/api/tryouts/' + tryoutId + '/results/' + playerId);
  },
  save(tryoutId, playerId, d) {
    return apiFetch('/api/tryouts/' + tryoutId + '/results/' + playerId, { method: 'PUT', body: d });
  },
};

// ── HOME VISIT API ────────────────────────────────────────────────
const HomeVisitAPI = {
  get(playerId)  { return apiFetch('/api/players/' + playerId + '/home-visit'); },
  save(playerId, d) {
    return apiFetch('/api/players/' + playerId + '/home-visit', { method: 'PUT', body: d });
  },
  uploadMedia(playerId, file, type) {
    const fd = new FormData();
    fd.append('file', file);
    fd.append('type', type);
    return fetch(API_BASE + '/api/players/' + playerId + '/home-visit/media', {
      method: 'POST',
      headers: { 'Authorization': 'Bearer ' + Auth.token() },
      body: fd,
    }).then(r => r.json());
  },
  deleteMedia(playerId, mediaId) {
    return apiFetch('/api/players/' + playerId + '/home-visit/media/' + mediaId, { method: 'DELETE' });
  },
};

// ── COMMENT API ───────────────────────────────────────────────────
const CommentAPI = {
  get(playerId)    { return apiFetch('/api/players/' + playerId + '/comments'); },
  add(playerId, text) {
    return apiFetch('/api/players/' + playerId + '/comments', { method: 'POST', body: { text } });
  },
  delete(playerId, commentId) {
    return apiFetch('/api/players/' + playerId + '/comments/' + commentId, { method: 'DELETE' });
  },
};

// ── SCOUT API ─────────────────────────────────────────────────────
const ScoutAPI = {
  getAll()   { return apiFetch('/api/scouts'); },
  create(d)  { return apiFetch('/api/scouts', { method: 'POST', body: d }); },
  update(id, d) { return apiFetch('/api/scouts/' + id, { method: 'PUT', body: d }); },
  delete(id) { return apiFetch('/api/scouts/' + id, { method: 'DELETE' }); },
};

// ── ACTIVITY API ──────────────────────────────────────────────────
const ActivityAPI = {
  getAll(params = {}) {
    const q = new URLSearchParams(params).toString();
    return apiFetch('/api/activity' + (q ? '?' + q : ''));
  },
};

// ── STATS API ─────────────────────────────────────────────────────
const StatsAPI = {
  get()    { return apiFetch('/api/stats'); },
  reports(params = {}) {
    const q = new URLSearchParams(params).toString();
    return apiFetch('/api/reports' + (q ? '?' + q : ''));
  },
};
