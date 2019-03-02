library(Cairo)
Cairo(file="generated/graphs/bar-extended-install.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(443, 138, 54, 50, 23, 15, 10, 7, 6, 4, 2, 2, 1)
lbls <- c("Official
Installer", "Linux
Package", "Homebrew", "Source
Build", "NPM", "Chocolatey", "lix", "Bundled", "Other", "Manually", "hvm", "Docker", "Development Snapshot")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you install Haxe?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
