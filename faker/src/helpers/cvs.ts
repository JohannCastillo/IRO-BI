export function formatCSV(data: Record<string, any>) {
  const keys = Object.keys(data)
  const values = keys.map((key) => data[key])
  const header = `${keys.join(',')}`
  const csv = `${values.join(',')}`
  return {
    header,
    csv
  }
}
