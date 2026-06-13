import { useState, useEffect, useCallback } from 'react'

let toastId = 0
let addToastFn = null

export function toast(msg, type = 'info') {
  if (addToastFn) addToastFn(msg, type)
}

export function ToastContainer() {
  const [toasts, setToasts] = useState([])

  const addToast = useCallback((msg, type) => {
    const id = ++toastId
    setToasts(prev => [...prev, { id, msg, type }])
    setTimeout(() => setToasts(prev => prev.filter(t => t.id !== id)), 3500)
  }, [])

  useEffect(() => { addToastFn = addToast; return () => { addToastFn = null } }, [addToast])

  return (
    <div className="toast-container">
      {toasts.map(t => (
        <div key={t.id} className={`toast toast-${t.type}`}>
          <span>{t.type === 'success' ? '✓' : t.type === 'error' ? '✕' : 'ℹ'}</span>
          {t.msg}
        </div>
      ))}
    </div>
  )
}
