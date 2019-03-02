library(Cairo)
Cairo(file="generated/graphs/pie-base-install.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(443, 138, 54, 50, 31, 23, 15)
lbls <- c("Official
Installer", "Linux
Package", "Homebrew", "Source
Build", "Other", "NPM", "Chocolatey")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="How do you install Haxe?")
invisible(dev.off())
