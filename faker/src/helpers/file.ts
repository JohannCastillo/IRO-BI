import fs from "fs";
export function exportTo(type: String, data: string, filename: string) {
    if (type === "json") {
        fs.writeFileSync(`data/json/${filename}.json`, data);
    } else if (type === "sql") {
        fs.writeFileSync(`data/sql/${filename}.sql`, data);
    }
}

export const readCsvFile = (filename: string) => {
    return fs.readFileSync(`data/csv/${filename}.csv`, "utf8").trim().split('\r\n');
};