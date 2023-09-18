import { readFileSync } from 'fs'

export function readJsonFile(path: string): any {
  const file = readFileSync(path, 'utf8')
  return JSON.parse(file)
}
