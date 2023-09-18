import { readFileSync, writeFileSync } from 'fs'
export function exportTo(type: String, data: string, filename: string) {
  if (type === 'json') {
    writeFileSync(`data/json/${filename}.json`, data)
  } else if (type === 'sql') {
    writeFileSync(`data/sql/${filename}.sql`, data)
  } else if (type === 'csv') {
    writeFileSync(`data/csv/${filename}.csv`, data)
  }
}

export const readCsvFile = (filename: string) => {
  return readFileSync(`data/csv/${filename}.csv`, 'utf8').trim().split('\r\n')
}
