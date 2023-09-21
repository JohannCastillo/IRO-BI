//remove the ' character from a string
export function removeApostrofe (sentence: string) {
    // if the sentence contains an apostrophe, remove it
    if (sentence.includes("'")) {
        sentence = sentence.replace(/'/g, "");
    }
    return sentence;
}