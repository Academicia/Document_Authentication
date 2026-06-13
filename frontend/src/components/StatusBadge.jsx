export default function StatusBadge({ status }) {
  const isSigned = status === 'SIGNED'
  return (
    <span className={`badge ${isSigned ? 'badge-signed' : 'badge-pending'}`}>
      <span className={`badge-dot ${isSigned ? 'badge-dot-signed' : 'badge-dot-pending'}`} />
      {status}
    </span>
  )
}
