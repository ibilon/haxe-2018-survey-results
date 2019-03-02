library(Cairo)
Cairo(file="generated/graphs/bar-base-orgsizepro.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(66, 61, 23, 17, 15, 13, 9, 2)
lbls <- c("2-10", "<= 1", "10-25", "26-100", "501-1500", "101-500", "1501-10000", "> 10000")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="How big is your organization?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
