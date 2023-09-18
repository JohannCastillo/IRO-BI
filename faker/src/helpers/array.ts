// given an array of objects , add id prop to each object
export function addIdToObjects(idName: String, arr: any[]) {
    const newArr = arr.map((item, index) => {
        return {
            [`${idName}`]: index + 1,
            ...item,
        };
    });
    return newArr;
}

// given an array of objects , return an array of ids
export function getIdsFromObjects(idName: String, arr: any[]) {
    const newArr = arr.map((item) => {
        return item[`${idName}`];
    });
    return newArr;
}
