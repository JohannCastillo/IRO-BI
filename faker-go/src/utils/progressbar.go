package utils

import (
	"fmt"

	"github.com/schollz/progressbar/v3"
)

const MAX_BAR_LENGHT = 30

func GetProgressbar(name string, max int) *progressbar.ProgressBar {
	if len(name) > MAX_BAR_LENGHT {
		name = name[:MAX_BAR_LENGHT]
	} else {
		name = fmt.Sprintf("%-"+fmt.Sprintf("%d", MAX_BAR_LENGHT)+"s", name)
	}

	return progressbar.NewOptions(max,
		progressbar.OptionSetDescription("[cyan]"+name+"[reset]"),
		progressbar.OptionEnableColorCodes(true),
		progressbar.OptionSetTheme(progressbar.Theme{
			Saucer:        "[green]█[reset]",
			SaucerPadding: "░",
			BarStart:      "[",
			BarEnd:        "]",
		}),
		progressbar.OptionShowBytes(false),
		progressbar.OptionShowCount(),
		progressbar.OptionSetPredictTime(false),
		progressbar.OptionSetItsString("iteración"),
		progressbar.OptionOnCompletion(func() {
			fmt.Println("")
		}),
	)
}
