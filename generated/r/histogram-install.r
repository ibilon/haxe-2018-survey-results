library(Cairo)
Cairo(file="generated/graphs/histogram-install.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(23, 447, 101, 30)
lbls <- c("0", "1", "2", "3")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you install Haxe?", yaxt="n", col=rainbow(length(lbls)))
invisible(dev.off())
