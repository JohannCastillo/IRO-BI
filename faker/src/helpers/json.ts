import fs from "fs";

export function readJsonFile(path: string): any {
    const file = fs.readFileSync(path, "utf8");
    return JSON.parse(file);
}
