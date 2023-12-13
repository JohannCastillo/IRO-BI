import { SingleBar } from "cli-progress";



export function newBar(name: string) {
    return new SingleBar({
        // format: `${name} |' + '{bar}' + '| {percentage}% || {value}/{total} Chunks`,
        format: name + ' |' + '{bar}' + '| {percentage}% || {value}/{total}',
        barCompleteChar: '\u2588',
        barIncompleteChar: '\u2591',
        hideCursor: true
    });
}