library(Cairo)
Cairo(file="generated/graphs/histogram-targets.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(19, 129, 140, 152, 86, 50, 20, 4, 4)
lbls <- c("0", "1", "2", "3", "4", "5", "6", "7", "8")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How many targets do you use?", yaxt="n", col=rainbow(length(lbls)))
invisible(dev.off())
