library(Cairo)
Cairo(file="generated/graphs/histogram-communication.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(190, 259, 109, 36, 9)
lbls <- c("0", "1", "2", "3", "4")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How do you communicate with other Haxe users?", yaxt="n", col=rainbow(length(lbls)))
invisible(dev.off())
