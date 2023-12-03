import csvParser from 'csv-parser';
import * as fs from 'fs';
import { MAX_FRAME_SIZE } from '../../src/constants';

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

export function getDataFromCSV<T>(csv: string): Promise<T[][]> {
  return new Promise<T[][]>((resolve, reject) => {
    const frame: T[] = [];
    const result: T[][] = [];
    fs.createReadStream(csv)
      .pipe(csvParser())
      .on('data', (data) => {
          if (frame.length === MAX_FRAME_SIZE) {
              result.push(frame);
              frame.length = 0;
          }
          frame.push(data);
      })
      .on('end', () => {
          result.push(frame);
          resolve(result);
      })
      .on('error', (error) => {
          reject(error);
      });
  });

}
