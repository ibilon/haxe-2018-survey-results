library(Cairo)
Cairo(file="generated/graphs/pie-extended-install.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(443, 138, 54, 50, 23, 15, 10, 7, 6, 4, 2, 2, 1)
lbls <- c("Official
Installer", "Linux
Package", "Homebrew", "Source
Build", "NPM", "Chocolatey", "lix", "Bundled", "Other", "Manually", "hvm", "Docker", "Development Snapshot")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, " (", sep="")
lbls <- paste(lbls, pct)
lbls <- paste(lbls, "% )", sep="")
pie(slices, labels=lbls, col=rainbow(length(lbls)), main="How do you install Haxe?")
invisible(dev.off())
