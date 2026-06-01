import { useParams, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useEffect } from 'react'
import { toast } from '../components/Toast'
import * as api from '../api'

export default function ViewerPage() {
  const { docId } = useParams()
  const { user } = useAuth()
  const navigate = useNavigate()

  useEffect(() => {
    if (!localStorage.getItem('token')) navigate('/login')
  }, [navigate])

  async function handleSign() {
    try {
      await api.signDocument(docId)
      toast('Document signed successfully!', 'success')
      navigate('/dashboard')
    } catch (err) {
      toast(err.message, 'error')
    }
  }

  return (
    <div className="viewer-container">
      <div className="viewer-toolbar glass" style={{ padding: '12px 20px' }}>
        <div style={{ display: 'flex', alignItems: 'center', gap: 12 }}>
          <button className="viewer-back" onClick={() => navigate('/dashboard')}>← Back to Dashboard</button>
          <span style={{ color: 'rgba(255,255,255,0.3)', fontSize: 13 }}>Document: {docId}</span>
        </div>
        {user?.role === 'SIGNER' && (
          <button className="btn-success" onClick={handleSign}>Sign Document</button>
        )}
      </div>
      <div className="glass-strong" style={{ flex: 1, padding: 8, overflow: 'hidden' }}>
        <iframe
          src={`/document/${docId}?token=${localStorage.getItem('token')}`}
          style={{ width: '100%', height: '100%', border: 'none', borderRadius: 12 }}
          title="Document Viewer"
        />
      </div>
    </div>
  )
}
