export function formatSql(tableName: string, data: any[]) {
    const keys = Object.keys(data[0]);
    const values = data.map((item) => keys.map((key) => item[key]));
    const sql = `INSERT INTO ${tableName} (${keys.join(",")}) VALUES ${values
        .map((item) => `(${item.map((i) => `'${i}'`).join(",")})`)
        .join(",")} \nGO`;
    console.log(sql);
    return sql;
}

export function formatSqlOne(tableName: string, data: any) {
    const keys = Object.keys(data);
    const values = keys.map((key) => data[key]);
    //Si no hay Id se quita el primer elemento, solo para sql server autoincrementable
    if (!values[0]){
        values.shift()
        keys.shift()
    }
    const sql = `INSERT INTO ${tableName} (${keys.join(",")}) VALUES (${values
        .map((item) => `${item ? `'${item}'` : null}`)
        .join(",")}) \nGO`;
    console.log(sql);
    return sql;
}

export const fixFormat = (sentence: string) => {
    // if the sentence contains an apostrophe, remove it
    if (sentence.includes("'")) {
        sentence = sentence.replace(/'/g, "");
    }
    return sentence;
};
