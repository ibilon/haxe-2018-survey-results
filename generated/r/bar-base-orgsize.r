library(Cairo)
Cairo(file="generated/graphs/bar-base-orgsize.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(241, 116, 87, 41, 38, 29, 17, 17, 11)
lbls <- c("<= 1", "2-10", "Not Applicable", "10-25", "26-100", "101-500", "1501-10000", "501-1500", "> 10000")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How big is your organization?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
