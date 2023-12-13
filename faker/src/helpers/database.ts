import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


export async function save(table: string, data: any[][]) {
    if (!data || data.length === 0) {
        return;
    }
    
    const keys = Object.keys(data[0]?.[0]);
    data.forEach(async (row) => {
        
        const values: any[] = [];

        row.forEach((value) => {
            values.push(`('${Object.values(value).join(',')}')`);
        });
        
        const query = `INSERT INTO ${table} (${keys.join(',')}
                    VALUES ${values.join(',')}`;
        console.log(query);
        await prisma.$executeRaw`${query}`
    });
}