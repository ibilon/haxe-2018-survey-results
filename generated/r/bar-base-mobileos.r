library(Cairo)
Cairo(file="generated/graphs/bar-base-mobileos.png", type="png", units="px", width=800, height=480, dpi=72)
slices <- c(438, 119, 11, 11, 3)
lbls <- c("Android", "iOS", "Windows Phone", "Other", "Blackberry")
lbls <- paste(lbls, "
", sep="")
lbls <- paste(lbls, slices)
barplot(slices, names.arg=lbls, main="What is your mobile operating system?", yaxt="n", col=rainbow(length(lbls)), las=2)
invisible(dev.off())
