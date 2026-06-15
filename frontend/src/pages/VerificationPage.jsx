import { useState, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { verifyDocument, BASE } from '../api'

export default function VerificationPage() {
  const { docId } = useParams()
  const [data, setData] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    if (!docId) return
    setLoading(true)
    verifyDocument(docId)
      .then(setData)
      .catch(err => setError(err.message || 'Verification failed'))
      .finally(() => setLoading(false))
  }, [docId])

  if (loading) {
    return (
      <div className="auth-container">
        <div className="auth-card glass-strong" style={{ textAlign: 'center', padding: 48, maxWidth: 480, width: '90%' }}>
          <div className="spinner" style={{ width: 48, height: 48, margin: '0 auto 20px' }} />
          <p style={{ color: 'rgba(255,255,255,0.7)' }}>Verifying document...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="auth-container">
        <div className="auth-card glass-strong" style={{ textAlign: 'center', padding: 48, maxWidth: 480, width: '90%' }}>
          <div style={{ fontSize: 64, marginBottom: 16 }}>❌</div>
          <h2 style={{ fontSize: 22, marginBottom: 8 }}>Verification Error</h2>
          <p style={{ color: 'rgba(255,255,255,0.6)' }}>{error}</p>
        </div>
      </div>
    )
  }

  const isSigned = data?.status === 'VALID' || data?.status === 'SIGNED'

  return (
    <div className="auth-container">
      <div className="auth-card glass-strong" style={{ maxWidth: 520, width: '90%', padding: 32 }}>
        <div style={{ textAlign: 'center', marginBottom: 24 }}>
          <div style={{ fontSize: 72, marginBottom: 8 }}>
            {isSigned ? '✅' : '⚠️'}
          </div>
          <h1 style={{ fontSize: 24, fontWeight: 700, marginBottom: 4 }}>
            {isSigned ? 'Document Verified' : 'Document Not Verified'}
          </h1>
          <p style={{ color: 'rgba(255,255,255,0.5)', fontSize: 14 }}>
            {data?.message || 'Unknown status'}
          </p>
        </div>

        <div style={{
          background: isSigned ? 'rgba(0, 201, 167, 0.1)' : 'rgba(255, 101, 132, 0.1)',
          border: `1px solid ${isSigned ? 'rgba(0, 201, 167, 0.3)' : 'rgba(255, 101, 132, 0.3)'}`,
          borderRadius: 12,
          padding: 20,
          marginBottom: 24
        }}>
          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
            <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Status</span>
            <span style={{
              fontWeight: 600,
              color: isSigned ? '#00c9a7' : '#ff6584',
              fontSize: 13,
              textTransform: 'uppercase',
              letterSpacing: 1
            }}>
              {data?.status}
            </span>
          </div>

          {data?.document_type && (
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
              <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Document Type</span>
              <span style={{ fontWeight: 500, fontSize: 13 }}>{data.document_type}</span>
            </div>
          )}

          <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
            <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Uploaded By</span>
            <span style={{ fontWeight: 500, fontSize: 13 }}>{data?.uploader_name}</span>
          </div>

          {data?.signer_name && (
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
              <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Signed By</span>
              <span style={{ fontWeight: 500, fontSize: 13 }}>{data.signer_name}</span>
            </div>
          )}

          {data?.uploaded_at && (
            <div style={{ display: 'flex', justifyContent: 'space-between', marginBottom: 12 }}>
              <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Uploaded</span>
              <span style={{ fontWeight: 500, fontSize: 13 }}>
                {new Date(data.uploaded_at).toLocaleDateString('en-US', {
                  year: 'numeric', month: 'short', day: 'numeric', hour: '2-digit', minute: '2-digit'
                })}
              </span>
            </div>
          )}

          {data?.document_id && (
            <div style={{ display: 'flex', justifyContent: 'space-between' }}>
              <span style={{ color: 'rgba(255,255,255,0.5)', fontSize: 13 }}>Document ID</span>
              <span style={{ fontWeight: 500, fontSize: 12, fontFamily: 'monospace', color: 'rgba(255,255,255,0.6)' }}>
                {data.document_id.slice(0, 8)}...
              </span>
            </div>
          )}
        </div>

        <div style={{ textAlign: 'center' }}>
          <p style={{ color: 'rgba(255,255,255,0.35)', fontSize: 11 }}>
            Verified via Academicia Document Authentication System
          </p>
        </div>
      </div>
    </div>
  )
}
