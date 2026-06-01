const BASE = ''

async function request(url, options = {}) {
  const token = localStorage.getItem('token')
  const headers = { ...options.headers }
  if (token && !url.includes('/login') && !url.includes('/register') && !url.includes('/verify')) {
    headers['Authorization'] = `Bearer ${token}`
  }
  const res = await fetch(BASE + url, { ...options, headers })
  if (!res.ok) {
    const err = await res.json().catch(() => ({ detail: 'Request failed' }))
    throw new Error(err.detail || `HTTP ${res.status}`)
  }
  return res.json()
}

export function login(username, password) {
  const params = new URLSearchParams({ username, password })
  return fetch(BASE + '/login', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: params
  }).then(r => { if (!r.ok) throw new Error('Invalid credentials'); return r.json() })
}

export function register(username, password, role) {
  const params = new URLSearchParams({ username, password, role })
  return fetch(BASE + '/register', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: params
  }).then(r => { if (!r.ok) throw new Error('Registration failed'); return r.json() })
}

export function getSigners() {
  return request('/signers')
}

export function uploadDoc(file, signerId) {
  const token = localStorage.getItem('token')
  const formData = new FormData()
  formData.append('file', file)
  formData.append('signer_id', signerId)
  return fetch(BASE + '/upload', {
    method: 'POST',
    headers: { 'Authorization': `Bearer ${token}` },
    body: formData
  }).then(r => { if (!r.ok) throw new Error('Upload failed'); return r.json() })
}

export function signDocument(docId) {
  return request('/sign/' + docId, { method: 'POST' })
}

export function verifyDocument(docId) {
  return fetch(BASE + '/verify/' + docId).then(r => r.json())
}

export function getUserDocuments() {
  return request('/user/documents')
}

export function getSignerPending() {
  return request('/signer/pending')
}

export function getSignerSigned() {
  return request('/signer/signed')
}

export function getAuditLogs(docId) {
  return request('/audit/' + docId)
}
