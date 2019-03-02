library(Cairo)
Cairo(file="generated/graphs/bar-base-ide.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(223, 110, 58, 52, 41, 31)
lbls <- c("Visual Studio Code", "FlashDevelop/HaxeDevelop", "IntelliJ", "Other", "Sublime Text", "VIM")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your preferred Haxe IDE?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
