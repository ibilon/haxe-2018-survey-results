library(Cairo)
Cairo(file="generated/graphs/histogram-publish.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(135, 266, 91, 66, 28, 10, 3, 2, 1, 0, 1, 0, 1)
lbls <- c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="On how many places do you publish your Haxe applications?", yaxt="n", col=rainbow(length(lbls)))
invisible(dev.off())
