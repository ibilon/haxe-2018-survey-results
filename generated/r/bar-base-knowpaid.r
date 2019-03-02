library(Cairo)
Cairo(file="generated/graphs/bar-base-knowpaid.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(297, 279)
lbls <- c("No", "Yes")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="Do you know that the Haxe foundation offers paid support plans?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
