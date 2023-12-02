//remove the ' character from a string
export function removeApostrophe(sentence: string) {
    if (typeof sentence !== "string") return sentence 
    return sentence.replace(/'/g, "")
}