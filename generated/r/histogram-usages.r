library(Cairo)
Cairo(file="generated/graphs/histogram-usages.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(22, 128, 135, 137, 83, 48, 31, 8, 7, 5)
lbls <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What do you use Haxe for?", yaxt="n", col=rainbow(length(lbls)))
invisible(dev.off())
