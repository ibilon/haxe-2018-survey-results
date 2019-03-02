library(Cairo)
Cairo(file="generated/graphs/bar-base-install.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(443, 138, 54, 50, 31, 23, 15)
lbls <- c("Official
Installer", "Linux
Package", "Homebrew", "Source
Build", "Other", "NPM", "Chocolatey")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you install Haxe?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
